import 'package:flutter/material.dart';
import 'package:kbu_app/model/user_model.dart';
import 'package:kbu_app/utils/universal_veriables.dart';
import 'package:kbu_app/view_model/groupChat_view_model.dart';
import 'package:kbu_app/view_model/user_viewModel.dart';
import 'package:kbu_app/widgets/context_extension.dart';
import 'package:provider/provider.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class GroupDetailPage extends StatefulWidget {
  @override
  _GroupDetailPageState createState() => _GroupDetailPageState();
}

class _GroupDetailPageState extends State<GroupDetailPage> {
  List<UserModel> membersInformation;

  @override
  Widget build(BuildContext context) {
    final _chatModel = Provider.of<GroupChatViewModel>(context);
    List<String> members = _chatModel.group.members;

    final _userModel = Provider.of<UserViewModel>(context);
    for (var member in members) {
      membersInformation.add(_userModel.findUserInList(member));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_chatModel.group.groupName),
        centerTitle: true,
        backgroundColor: UniversalVeriables.appBarColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: context.dynamicHeight(0.1),
                ),
                Padding(padding: context.paddingAllLow),
                CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    backgroundImage:
                        NetworkImage(_chatModel.group.groupImgUrl)),
                Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.grey,
                ),
                Container(
                  margin: context.marginAllLow,
                  padding: context.paddingAllLow,
                  child: Column(
                    children: [
                      Text(
                        "Katılımcılar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: UniversalVeriables.appBarColor,
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.25),
                        ),
                      ),
                      ListView.builder(
                          itemCount: membersInformation.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: context.paddingAllLow,
                              child: ListTile(
                                leading: CircleAvatar(
                                    radius: 70,
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(
                                        membersInformation[index].profileURL)),
                                title: Text(
                                  membersInformation[index].userName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: UniversalVeriables.greyColor,
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(2),
                                  ),
                                ),
                                subtitle: Text(
                                  membersInformation[index].email,
                                  style: TextStyle(
                                    color: UniversalVeriables.greyColor,
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(1.5),
                                  ),
                                ),
                              ),
                            );
                          }),
                      Divider(
                        color: Colors.grey,
                        height: context.dynamicHeight(0.1),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.group_add,
                          color: UniversalVeriables.buttonColor,
                        ),
                        title: Text("Katılımcı Ekle",
                            style: TextStyle(
                              color: UniversalVeriables.appBarColor,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: context.dynamicHeight(0.1),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.outbox,
                          color: Colors.red,
                        ),
                        title: Text("Gruptan Çık",
                            style: TextStyle(
                              color: UniversalVeriables.appBarColor,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: context.dynamicHeight(0.1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
