import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kbu_app/localization/localization_constants.dart';
import 'package:kbu_app/model/user_model.dart';
import 'package:kbu_app/screens/signIn/signin_with_email.dart';
import 'package:kbu_app/utils/universal_veriables.dart';
import 'package:kbu_app/view_model/user_viewModel.dart';
import 'package:kbu_app/widgets/social_login_button.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SignInPage extends StatelessWidget {

  /*void _guestLogin(BuildContext context) async {
    final _userModel = Provider.of<UserViewModel>(context);
    await Firebase.initializeApp();
    UserModel user = await _userModel.signInAnonymusly();
    print("oturum açan user id :" + user.userID.toString());
  }*/

  void _signInEmail(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true, builder: (context) => EmailLogin()));
  }

  void _signInGoogle(BuildContext context) async {
    final _userModel = Provider.of<UserViewModel>(context);
    UserModel _user = await _userModel.signInWithGoogle();
    if (_user != null) print("oturum açan user id:" + _user.userID.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Center(
              child: new Text(
            "Unicapp",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          )),
          elevation: 0,
          backgroundColor: UniversalVeriables.bg,
        ),
        backgroundColor: UniversalVeriables.bg,
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                getTranslated(context, "Sign In"),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white),
              ),
              SizedBox(
                height: 8,
              ),
              SocialLoginButton(
                onPressed: () => _signInGoogle(context),
                butonIcon: Image(
                  image: AssetImage("image/gmail.png"),
                ),
                butonText:
                getTranslated(context,"Sign in with Gmail and Password"), //farklı mail adresi ile olan
                textColor: Colors.white,
                radius: 16,
                height: 40,
              ),
              SizedBox(
                height: 8,
              ),
              SocialLoginButton(
                butonColor: UniversalVeriables.blueColor,
                butonText: getTranslated(context, "Sign in with Email and Password"),
                textColor: Colors.white,
                radius: 16,
                onPressed: () {
                  _signInEmail(context);
                },
                height: 40,
                butonIcon: Image(
                  image: AssetImage("image/kbu.png"),
                ),
              ),
            ],
          ),
        ));
  }
}
