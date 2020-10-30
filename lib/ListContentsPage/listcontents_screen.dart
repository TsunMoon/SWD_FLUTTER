import 'package:flutter/material.dart';
import 'package:mobileapp/ListContentsPage/components/body.dart';
import 'package:mobileapp/Models/user_login.dart';

class ListContentsScreen extends StatelessWidget {

  UserLogin userLogin;
  ListContentsScreen({Key key, this.userLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(userLogin: userLogin,),
    );
  }
}
