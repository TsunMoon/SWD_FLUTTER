import 'package:flutter/material.dart';
import 'package:mobileapp/InfoPage/components/body.dart';
import 'package:mobileapp/Models/user_login.dart';

class InfoScreen extends StatelessWidget {

  UserLogin userLogin;

  InfoScreen({Key key, this.userLogin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin'),
        centerTitle: true,
      ),
      body: Body(userLogin: userLogin,),
    );
  }
}
