import 'package:flutter/material.dart';
import 'package:mobileapp/InfoPage/info_screen.dart';
import 'package:mobileapp/Models/user_login.dart';
import 'package:mobileapp/PostTypePage/posttype_screen.dart';

class MainScreen extends StatefulWidget {


  UserLogin userLogin;

  MainScreen({Key key,this.userLogin}) : super(key: key); 

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    
  final List<Widget> _children = [
    PostTypeScreen(userLogin: widget.userLogin,),
    PostTypeScreen(userLogin: widget.userLogin,),
    InfoScreen(userLogin: widget.userLogin,)
  ];
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: new Text("Posting")),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), title: new Text("Booking")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: new Text("Profile")),
          ]),
      //AntDesign.plussquare
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
