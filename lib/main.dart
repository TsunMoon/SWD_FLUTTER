import 'package:flutter/material.dart';
import 'package:mobileapp/LoginPage/login_screen.dart';

void main() {
  runApp(MyApp());
  // String date = "2020-10-19T00:00:00";
  // String year = date.substring(0,4);
  // String month = date.substring(5,7);
  // String day = date.substring(8,10);
  // String hour = date.substring(11,13);
  // String minute = date.substring(14,16);
  // print(hour + ":" + minute);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginScreen(),
    );
  }
}



