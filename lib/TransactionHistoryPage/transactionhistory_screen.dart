import 'package:flutter/material.dart';
import 'package:mobileapp/Models/user_login.dart';
import 'package:mobileapp/TransactionHistoryPage/components/body.dart';

class TransactionHistoryScreen extends StatelessWidget {

  UserLogin userLogin;

  TransactionHistoryScreen({Key key, this.userLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transaction History'
        ),
      ),
      body: Body(userLogin: userLogin,),
    );
  }
}