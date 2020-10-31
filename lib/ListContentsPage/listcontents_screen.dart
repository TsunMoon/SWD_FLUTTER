import 'package:flutter/material.dart';
import 'package:mobileapp/ListContentsPage/components/body.dart';
import 'package:mobileapp/Models/user_login.dart';
import 'package:mobileapp/Models/writer_post.dart';

class ListContentsScreen extends StatelessWidget {

  UserLogin userLogin;
  int numberJob;

  ListContentsScreen({Key key, this.userLogin, this.numberJob}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(userLogin: userLogin,numberJob: numberJob,),
    );
  }
}
