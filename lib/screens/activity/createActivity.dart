import 'package:flutter/material.dart';
import 'package:kbu_app/localization/localization_constants.dart';
import 'package:kbu_app/model/activity.dart';
import 'package:kbu_app/utils/universal_veriables.dart';
import 'package:kbu_app/view_model/user_viewModel.dart';
import 'package:kbu_app/widgets/app_bar.dart';
import 'package:kbu_app/widgets/social_login_button.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CreateActivity extends StatefulWidget {
  @override
  _CreateActivityState createState() => _CreateActivityState();
}

class _CreateActivityState extends State<CreateActivity> {
  TextEditingController newsTitleController = TextEditingController();
  TextEditingController newsContentController = TextEditingController();
  TextEditingController newsDateController = TextEditingController();

  Activity _activity;

  void _create(String title, String content,String date) async {
    final _userModel = Provider.of<UserViewModel>(context);
    _activity = Activity(
      title: title,
      content: content,
      date: date,
    );
    _userModel.createActivity(_activity);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UniversalVeriables.bg,
        appBar: customAppBar(context),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: newsTitleController,
                          decoration: InputDecoration(
                            hintText: getTranslated(context, "Title"),
                            labelText: getTranslated(context, "Title"),
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: const OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          controller: newsContentController,
                          maxLines: 6,
                          decoration: InputDecoration(
                            hintText: getTranslated(context, "Content"),
                            labelText: getTranslated(context, "Content"),
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: const OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: newsDateController,
                          decoration: InputDecoration(
                            hintText: getTranslated(context, "Date"),
                            labelText: getTranslated(context, "Date"),
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: const OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                          ),
                          onTap: () async{
                            FocusScope.of(context).requestFocus(FocusNode());
                            await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(DateTime.now().year),
                                lastDate: DateTime(DateTime.now().year + 20),);
                          },
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SocialLoginButton(
                          butonText: getTranslated(context, "Create"),
                          butonColor: Colors.blueAccent,
                          radius: 10,
                          butonIcon: Opacity(
                            opacity: 0,
                            child: Icon(

                              Icons.email,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          height: 40,
                          onPressed: () => {
                            _create(newsTitleController.text,
                                newsContentController.text,newsDateController.text),
                            Navigator.pop(context),
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

CustomAppBar customAppBar(BuildContext context) {
  return CustomAppBar(
    actions: [],
    title: Text(getTranslated(context, "Create An Activity")),
  );
}
