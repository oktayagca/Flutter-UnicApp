import 'package:flutter/material.dart';
import 'package:kbu_app/model/user_model.dart';
import 'package:kbu_app/screens/chat/chat_screen.dart';
import 'package:kbu_app/utils/universal_veriables.dart';
import 'package:kbu_app/view_model/chat_view_model.dart';
import 'package:kbu_app/view_model/user_viewModel.dart';
import 'package:provider/provider.dart';

class UsersSeacrh extends SearchDelegate<UserModel>{

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      textTheme: TextTheme(title: TextStyle( color: Colors.white, fontSize: 18,),),
      primaryColor: UniversalVeriables.bg,
      primaryIconTheme: IconThemeData(
        color: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle:
        Theme.of(context).textTheme.title.copyWith(color: Colors.white),
      ),

    );
  }
  @override
  List<Widget> buildActions(BuildContext context) {
    return [ IconButton(icon: Icon(Icons.clear), onPressed: (){
      query ="";
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
      close(context,null);
    });
  }

  @override
  // ignore: missing_return
  Widget buildResults(BuildContext context) {

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    UserViewModel _userModel = Provider.of<UserViewModel>(context);
    final usersList = query.isEmpty ? _userModel.allUserList:
    _userModel.allUserList.where((p) => p.userName.startsWith(query)).toList();
    return usersList.isEmpty?Text("No result found...",style: TextStyle(fontSize: 20),) :Container(
      color: UniversalVeriables.bg,
      child: ListView.builder(
        itemCount:usersList.length,
        itemBuilder: (context,index){
          final UserModel userItem = usersList[index];
          return ListTile(
            onTap:(){
              Navigator.pop(context);
              Navigator.of(context, rootNavigator: false)
                  .push(MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                    builder: (context) => ChatViewModel(
                        currentUser: _userModel.user,
                        chattedUser: userItem),
                    child: ChatScreen(),
                  )));
            },
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userItem.userName,style: TextStyle(fontSize: 20,color: Colors.white),),
                Text(userItem.email,style: TextStyle(color: Colors.grey),),
                Divider(color: Colors.white10,)
              ],
            ),);
        },
      ),
    );
  }

}