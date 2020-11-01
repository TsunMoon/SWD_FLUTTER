import 'package:flutter/material.dart';
import 'package:mobileapp/LoginPage/components/body.dart';
import 'package:mobileapp/Models/user_login.dart';

class LoginScreen extends StatelessWidget {

  UserLogin userLogin;

  LoginScreen({Key key, this.userLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
