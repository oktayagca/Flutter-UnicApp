import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:kbu_app/view_model/user_viewModel.dart';

class ProfilePhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserViewModel>(context);
    return Container(
      height: 800,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(_userModel.user.profileURL),
            fit: BoxFit.cover
        ) ,
      ),
    );
  }
}
