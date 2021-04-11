import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kbu_app/localization/localization_constants.dart';
import 'package:kbu_app/model/group.dart';
import 'package:kbu_app/model/user_model.dart';
import 'package:kbu_app/utils/universal_veriables.dart';
import 'package:kbu_app/view_model/user_viewModel.dart';
import 'package:kbu_app/widgets/social_login_button.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CreateGroup extends StatefulWidget {
  var selectedUsers = [];
  CreateGroup({this.selectedUsers});
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {

  TextEditingController groupNameController = TextEditingController();

  File _groupImg;
  final picker = ImagePicker();
  Group _group;

  void _createGroup(String groupName) async{
    final _userModel = Provider.of<UserViewModel>(context);
    UserModel user = await _userModel.currentUser();
      _group = Group(
      groupName: groupName,
      administrator: user.userID,
      members: widget.selectedUsers,
    );
    if (_groupImg != null) {
      var url = await _userModel.uploadGroupFile(_group.groupName, "group_img", _groupImg, "group_Img.png");
      print("Group Image Url :" + url);
      _group.groupImgUrl=url;
    }
    _userModel.createGroup(_group);
  }

  Future _shootWithCamera() async {
    final _newGroupImg = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _groupImg = File(_newGroupImg.path);
      Navigator.of(context).pop();
    });
  }

  Future _chooseFromGallery() async {
    var _newGroupImg = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _groupImg = File(_newGroupImg.path);
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVeriables.bg,
      appBar: AppBar(
        title: Text(getTranslated(context, "Create a Group")),
        backgroundColor: UniversalVeriables.bg,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 170,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.camera),
                                  title: Text(getTranslated(context, "Capture From Camera")),
                                  onTap: () {
                                    _shootWithCamera();
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.image),
                                  title: Text(getTranslated(context, "Select From Gallery")),
                                  onTap: () {
                                    _chooseFromGallery();
                                  },
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    backgroundImage: _groupImg == null
                        ? NetworkImage(
                        "https://img.favpng.com/25/7/19/users-group-computer-icons-png-favpng-WKWD9rqs5kwcviNe9am7xgiPx.jpg")
                        : FileImage(_groupImg),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: groupNameController,
                        decoration: InputDecoration(

                          hintText: getTranslated(context, "Group Name"),
                          labelText: getTranslated(context, "Group Name"),
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                        ),
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
                          _createGroup(groupNameController.text),
                          Navigator.pop(context),
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
      ),
    );
  }
}
