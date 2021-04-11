import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kbu_app/localization/localization_constants.dart';
import 'package:kbu_app/utils/universal_veriables.dart';
import 'package:kbu_app/widgets/platform_alert_dialog.dart';
import 'package:provider/provider.dart';
import 'package:kbu_app/view_model/user_viewModel.dart';

// ignore: must_be_immutable
class StoryAdd extends StatelessWidget {
  File statusPhoto;
  String description;
  var _messageController = TextEditingController();

  StoryAdd(File statusPhoto) {
    this.statusPhoto = statusPhoto;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: FileImage(statusPhoto), fit: BoxFit.cover),
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[ Container(
                color: UniversalVeriables.bg.withOpacity(0.5),
                height: 70,
                padding: EdgeInsets.only(bottom: 8, left: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        cursorColor: Colors.blueGrey.withOpacity(0.8),
                        style: new TextStyle(fontSize: 16.0, color: Colors.white),
                        decoration: InputDecoration(
                            fillColor: UniversalVeriables.bg,
                            filled: true,
                            hintText: getTranslated(context, "Add title"),
                            hintStyle: TextStyle(color: Colors.grey),
                            border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Container(
                          color: Colors.transparent,
                          margin: EdgeInsets.only(left: 10),
                          child: InkWell(
                            child: Icon(
                              Icons.send,
                              size: 30,
                              color: UniversalVeriables.blueColor.withOpacity(0.5),
                            ),
                            onTap: () {
                              description = _messageController.text;
                              _storyAdd(context);
                            },
                          )),
                    )
                  ],
                ),
              ),]
            ),
        )
      ],
    );
  }
  void _storyAdd(BuildContext context) async {
    final _userModel = Provider.of<UserViewModel>(context);
      var url = await _userModel.uploadStory(
          _userModel.user.userID, "story", statusPhoto,description);
      print("gelen url" + url);
    Navigator.pop(context);
      if(url !=null){
        PlatformAlertDialog(
          title: getTranslated(context, "Successful"),
          content: getTranslated(context, "Announcement Added"),
          mainAction: getTranslated(context, "Ok"),
        ).show(context);
      }
    }
  }

