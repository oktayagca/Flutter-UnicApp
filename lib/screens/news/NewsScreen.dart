import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kbu_app/localization/localization_constants.dart';
import 'package:kbu_app/model/news.dart';
import 'package:kbu_app/model/user_model.dart';
import 'package:kbu_app/utils/universal_veriables.dart';
import 'package:kbu_app/view_model/user_viewModel.dart';
import 'package:kbu_app/widgets/app_bar.dart';
import 'package:kbu_app/widgets/custom-drawer.dart';
import 'package:provider/provider.dart';
import 'create_news_page.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  CustomAppBar customAppBar(BuildContext context) {
    return CustomAppBar(
      /*  leading:IconButton(
      icon: Icon(
        Icons.notifications,
        color:Colors.white,
      ),
      onPressed: (){},
      ),*/
      title: Text(getTranslated(context, "News")),
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
              child: FutureBuilder<List<News>>(
                future: _userModel.getAllNews(),
                builder: (context, result) {
                  if (result.hasData) {
                    var allNews = result.data;
                    if (allNews.length > 0) {
                      return RefreshIndicator(
                        onRefresh: _newsListUpdate,
                        child: ListView.builder(
                          itemCount: allNews.length,
                          itemBuilder: (context, index) {
                            var news = result.data[index];
                            if (news != null) {
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
                                        Container(
                                          width: 80.0,
                                          height: 80.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(news.imgURL),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                          ),
                                        ),
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
                                                news.title,
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
                                                    news.content,
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
                        onRefresh: _newsListUpdate,
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
                                    getTranslated(context, "No news yet"),
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
      floatingActionButton: addNews(context, user.role),
    );
  }

  Future<Null> _newsListUpdate() async {
    setState(() {});
    await Future.delayed(Duration(seconds: 1));
    return null;
  }

  Widget addNews(BuildContext context, String role) {
    if (role == "Admin") {
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
                MaterialPageRoute(builder: (context) => CreateNews()),
              );
            },
          ),
          padding: EdgeInsets.all(1),
        ),
      );
    }
    else{
      return Container();
    }
  }
}