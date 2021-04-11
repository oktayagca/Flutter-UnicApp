import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kbu_app/localization/localization_constants.dart';
import 'package:kbu_app/model/activity.dart';
import 'package:kbu_app/model/user_model.dart';
import 'package:kbu_app/screens/activity/CreateActivity.dart';
import 'package:kbu_app/utils/universal_veriables.dart';
import 'package:kbu_app/view_model/user_viewModel.dart';
import 'package:kbu_app/widgets/app_bar.dart';
import 'package:kbu_app/widgets/custom-drawer.dart';
import 'package:provider/provider.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  CustomAppBar customAppBar(BuildContext context) {
    return CustomAppBar(
      /*  leading:IconButton(
      icon: Icon(
        Icons.notifications,
        color:Colors.white,
      ),
      onPressed: (){},
      ),*/
      title: Text(getTranslated(context, "Activities")),
      actions: [
        Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer(); //popup menü
              },
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    UserViewModel _userModel = Provider.of<UserViewModel>(context);
    UserModel user = _userModel.user;
    return Scaffold(
      backgroundColor: UniversalVeriables.bg,
      endDrawer: CustomDrawer(),
      appBar: customAppBar(context),
      body: Column(
        children: [
          Container(
            child: Expanded(
              child: FutureBuilder<List<Activity>>(
                future: _userModel.getAllActivity(),
                builder: (context, result) {
                  if (result.hasData) {
                    var allActivity = result.data;
                    if (allActivity.length > 0) {
                      return RefreshIndicator(
                        onRefresh: _updateActivityList,
                        child: ListView.builder(
                          itemCount: allActivity.length,
                          itemBuilder: (context, index) {
                            var activity = result.data[index];
                            if (activity != null) {
                              return GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color:
                                        UniversalVeriables.seperatorColor,
                                        width: 1.4,
                                      ),
                                    ),
                                  ),
                                  margin: EdgeInsets.only(bottom: 20.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                activity.title,
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    activity.content,
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    activity.date,
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      );
                    } else {
                      return RefreshIndicator(
                        onRefresh: _updateActivityList,
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.supervised_user_circle,
                                    color: Colors.blue,
                                    size: 120,
                                  ),
                                  Text(
                                    getTranslated(context,"No Events Yet"),
                                    style: TextStyle(
                                        fontSize: 36, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            height: MediaQuery.of(context).size.height - 150,
                          ),
                        ),
                      );
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: addActivity(context, user.role),
    );
  }

  Future<Null> _updateActivityList() async {
    setState(() {});
    await Future.delayed(Duration(seconds: 1));
    return null;
  }

  Widget addActivity(BuildContext context, String role) {
      return SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff00b6f3), Color(0xff0184dc)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateActivity()),
              );
            },
          ),
          padding: EdgeInsets.all(1),
        ),
      );
  }
}