import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobileapp/InfoPage/info_screen.dart';
import 'package:mobileapp/ListContentsPage/listcontents_screen.dart';
import 'package:mobileapp/Models/user_login.dart';
import 'package:mobileapp/components/posting_type.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/global.dart';

class Body extends StatefulWidget {

  UserLogin userLogin;
  var currentBean;

  Body({Key key, this.userLogin}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  // Lấy số đậu hiên tại theo username
  Future<int> _getCurrentBean() async {
    http.Response response = await http.post(
        Uri.encodeFull(GET_CURRENT_BEAN_BY_USERNAME),
        headers: {"Content-type": "application/json"},
        body: jsonEncode(<String, String>{
          'username' : widget.userLogin.username
        })
    );
    var jsonDataBean = json.decode(utf8.decode(response.bodyBytes));
    print(jsonDataBean);



    if(jsonDataBean == widget.userLogin.amount){
      return 1;
    }
    setState(() {
      widget.currentBean = jsonDataBean.toString();
    });
    return -1;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _getCurrentBean();
    return Container(
      //width: double.infinity,
      //height: size.height,

        child: ListView(

          //crossAxisAlignment: CrossAxisAlignment.center,

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
                  backgroundImage: NetworkImage(widget.userLogin.photoUrl),
                ),
                title: Text(
                  widget.userLogin.displayName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Text('Xin chào!'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return InfoScreen(userLogin: widget.userLogin,);
                  }));
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.09,
              decoration: BoxDecoration(gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xff12c2e9), Color(0xffc471ed), Color(0xfff64f59)]
              )),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Text(
                    'Bạn đang tìm công việc gì?',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(left: 15,),
              child:
              Text("Your Beans",
                  style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.w700,
                  )
              ),
            ),
            SizedBox(height: 5,),
            Container(
                padding: EdgeInsets.only(left: 40),
                height: size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(0)),

                  color: Color(0xff01ff7c),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.currentBean != null ? widget.currentBean +" Beans" : "",
                          style: TextStyle(fontSize: 28,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/pea.gif"),
                      ],
                    ),
                  ],
                )
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(left: 15,),
              child:
              Text("What do you wanna do?",
                  style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.w700,
                  )
              ),
            ),
            SizedBox(height: 5,),
            Container(
              //width: double.infinity,
              height: size.height * 0.7,

              child: SingleChildScrollView(
                child: Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PostingType(
                        color: Color(0xffffffff),
                        icon: 'assets/images/content-css.gif',
                        title: 'Content Outsourcing',
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return ListContentsScreen(userLogin: widget.userLogin,numberJob: 1,);
                              }));
                        },
                      ),
                      PostingType(
                        color: Color(0xffffffff),
                        icon: 'assets/images/digital-desgin.gif',
                        title: 'Design Outsourcing',
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return ListContentsScreen(userLogin: widget.userLogin,numberJob: 2,);
                              }));
                        },
                      ),
                      PostingType(
                        color: Color(0xffffffff),
                        icon: 'assets/images/translate-icon.gif',
                        title: 'Translate Outsourcing',
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return ListContentsScreen(userLogin: widget.userLogin,numberJob: 3,);
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



