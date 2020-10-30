import 'package:flutter/material.dart';
import 'package:mobileapp/Models/user_login.dart';
import 'package:mobileapp/PostTypePage/compents/body.dart';

class PostTypeScreen extends StatelessWidget {

  UserLogin userLogin;

  PostTypeScreen({Key key,this.userLogin}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(userLogin: userLogin,),
    );
  }
}
