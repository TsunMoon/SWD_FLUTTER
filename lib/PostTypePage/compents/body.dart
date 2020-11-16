import 'package:flutter/material.dart';
import 'package:mobileapp/InfoPage/info_screen.dart';
import 'package:mobileapp/ListContentsPage/listcontents_screen.dart';
import 'package:mobileapp/Models/user_login.dart';
import 'package:mobileapp/components/posting_type.dart';

class Body extends StatelessWidget {

  UserLogin userLogin;
  Body({Key key, this.userLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        //width: double.infinity,
        //height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.1,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(userLogin.photoUrl),
                ),
                title: Text(
                  userLogin.displayName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Text('Xin chào!'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return InfoScreen(userLogin: userLogin,);
                  }));
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.055,
              decoration: BoxDecoration(color: Colors.blue),
              alignment: Alignment.center,
              child: Text(
                'Bạn đang tìm công việc gì?',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              //width: double.infinity,
              height: size.height * 0.7,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PostingType(
                      color: Color(0xFFE8E8E8),
                      icon: 'assets/images/content-css.gif',
                      title: 'Content Outsourcing',
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return ListContentsScreen(userLogin: userLogin,numberJob: 1,);
                            }));
                      },
                    ),
                    PostingType(
                      color: Color(0xFFE8E8E8),
                      icon: 'assets/images/digital-desgin.gif',
                      title: 'Design Outsourcing',
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return ListContentsScreen(userLogin: userLogin,numberJob: 2,);
                            }));
                      },
                    ),
                    PostingType(
                      color: Color(0xFFE8E8E8),
                      icon: 'assets/images/translate-icon.gif',
                      title: 'Translate Outsourcing',
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return ListContentsScreen(userLogin: userLogin,numberJob: 3,);
                            }));
                      },
                    )
                  ]
                ),
              ),
            ),
          ],
        ));
  }
}
