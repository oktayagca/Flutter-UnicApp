import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kbu_app/localization/localization_constants.dart';
import 'package:kbu_app/model/user_model.dart';
import 'package:kbu_app/utils/error_exception.dart';
import 'package:kbu_app/utils/universal_veriables.dart';
import 'package:kbu_app/view_model/user_viewModel.dart';
import 'package:kbu_app/widgets/platform_alert_dialog.dart';
import 'package:kbu_app/widgets/social_login_button.dart';
import 'package:provider/provider.dart';

enum FormType { Register, LogIn }

class EmailLogin extends StatefulWidget {
  @override
  _EmailLoginState createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  String _email, _password;
  String _butonText, _linkText;
  var _formType = FormType.LogIn;

  final _formKey = GlobalKey<FormState>();

  void _formsubmit(BuildContext context) async {
    _formKey.currentState.save();
    debugPrint("email:" + _email + "Şifre" + _password);
    final _userModel = Provider.of<UserViewModel>(context);
    if (_formType == FormType.LogIn) {
      try {
        UserModel _loginUser =
            await _userModel.signInWithEmailandPassword(_email, _password);
        if (_loginUser != null)
          print("oturum açan user id:" + _loginUser.userID.toString());
      } catch (e) {
        PlatformAlertDialog(
            title: getTranslated(context, "Login error"),
            content: ErrorException.show(e.code),
            mainAction: getTranslated(context, "Ok"))
            .show(context);
      }
    } else {
      try {
        UserModel _newUser =
            await _userModel.createUserWithEmailandPassword(_email, _password);
        if (_newUser != null)
          print("oturum açan user id:" + _newUser.userID.toString());
      } catch (e) {
        PlatformAlertDialog(
                title: getTranslated(context, "Login error"),
                content: ErrorException.show(e.code),
                mainAction: getTranslated(context, "Ok"))
            .show(context);
      }
    }
  }

  void change() {
    setState(() {
      _formType =
          _formType == FormType.LogIn ? FormType.Register : FormType.LogIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    _butonText = _formType == FormType.LogIn ? getTranslated(context, "Sign In") : getTranslated(context, "Register");
    _linkText = _formType == FormType.LogIn
        ? getTranslated(context, "Don't have an account? Sign Up")
        : getTranslated(context, "Sign In");

    final _userModel = Provider.of<UserViewModel>(context);

    if (_userModel.user != null) {
      Future.delayed(Duration(milliseconds: 1), () {
        Navigator.of(context).popUntil(ModalRoute.withName("/"));
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: new Center(
              child: new Text(
                getTranslated(context, "Login / Register"),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          )),
          elevation: 0,
          backgroundColor: UniversalVeriables.bg,
        ),
        backgroundColor: UniversalVeriables.bg,
        body: _userModel.state == ViewState.Idle
            ? Center(
              child: SingleChildScrollView(
                  child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          initialValue: "2015010206033@ogrenci.karabuk.edu.tr",
                          style: TextStyle(color: Colors.white),
                          onSaved: (String input) {
                            _email = input;
                          },
                          decoration: InputDecoration(
                            errorText: _userModel.emailMessage != null
                                ? _userModel.emailMessage
                                : null,
                            prefixIcon: Icon(Icons.mail, color: Colors.white),
                            hintText: 'E-Mail',
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            labelText: 'E-Mail',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: UniversalVeriables.blueColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          initialValue: "password",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          onSaved: (String input) {
                            _password = input;
                          },
                          keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                          decoration: InputDecoration(
                            errorText: _userModel.passwordMessage != null
                                ? _userModel.passwordMessage
                                : null,
                            prefixIcon: Icon(Icons.mail, color: Colors.white),
                            hintText: getTranslated(context,"Password"),
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            labelText: getTranslated(context,"Password"),
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: UniversalVeriables.blueColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SocialLoginButton(
                          butonColor: UniversalVeriables.blueColor,
                          butonText: _butonText,
                          textColor: Colors.white,
                          radius: 16,
                          onPressed: () {
                            _formsubmit(context);
                          },
                          height: 50,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FlatButton(
                            onPressed: () => change(),
                            child: Text(
                              _linkText,
                              style: TextStyle(color: Colors.white, fontSize: 17),
                            ))
                      ],
                    ),
                  ),
                )),
            )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
