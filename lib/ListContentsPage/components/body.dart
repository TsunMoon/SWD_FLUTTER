import 'package:flutter/material.dart';
import 'package:mobileapp/InfoPage/info_screen.dart';
import 'package:mobileapp/Models/user_login.dart';
import 'package:mobileapp/Models/writer_post.dart';
import 'package:mobileapp/PostDetailPage/postdetail_screen.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/PostTypePage/posttype_screen.dart';
import 'package:mobileapp/global.dart';
import 'dart:async';
import 'dart:convert';

import 'package:mobileapp/list_3_tab.dart';

class Body extends StatefulWidget {
  UserLogin userLogin;
  int numberJob;
  bool isRequested = false;
  String strButton = "Request";

  Body({Key key, this.userLogin, this.numberJob}) : super(key: key) ;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int flagColorChange = 1;

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  Future<List<WriterPost>> listTotal;







  //Hàm fetch api lấy list các bài post
  Future<List<WriterPost>> _fetchPostWriter() async {
    http.Response response;
    if(widget.numberJob == 1){
       response = await http.post(
         Uri.encodeFull(GET_WRITER_POST),
           headers: {"Content-type": "application/json"},
           body: jsonEncode(<String, String>{
             'username' : widget.userLogin.username
           }
       ));
    }else
    if(widget.numberJob == 2){
       response = await http.post(
           Uri.encodeFull(GET_DESIGN_POST),
           headers: {"Content-type": "application/json"},
           body: jsonEncode(<String, String>{
             'username' : widget.userLogin.username
           }
           )
       );
    }else
      if(widget.numberJob == 3){
        response = await http.post(
            Uri.encodeFull(GET_TRANSLATE_POST),
            headers: {"Content-type": "application/json"},
            body: jsonEncode(<String, String>{
              'username' : widget.userLogin.username
            }
            )
        );
      }

    var jsonData = json.decode(utf8.decode(response.bodyBytes));
      print( jsonData);
    List<WriterPost> listWriter = [];

    for (var u in jsonData) {
      WriterPost wpost = WriterPost(
        id: u["id"],
        title: u["title"],
        description: u["description"],
        characterLimit: u["characterLimit"],
        amount: u["amount"],
        postType: u["postType"],
        relatedDocument: u["relatedDocument"],
        isPublic: u["isPublic"],
        createdDate: u["createdDate"],
        status: u["status"],
        listKeywords: List.from(u["listKeywords"])

        // listKeywords: u["listKeywords"]
      );
      listWriter.add(wpost);
    }
    return listWriter;
  }

  //Hàm lấy tất cả bài requested và accepted của 1 username
  Future<List<WriterPost>> _getRequetedByUsername(String statusWant) async {
    http.Response response;

    if(statusWant.compareTo("Requested") == 0 ){
      response =  await http.post(Uri.encodeFull(GET_REQUESTED_POST),
          headers: {"Content-type": "application/json"},
        body: jsonEncode(<String,String>{
          'username' : widget.userLogin.username
        })
      );

    }
    if(statusWant.compareTo("Accepted") == 0){
      response =  await http.post(
          Uri.encodeFull(GET_ACCEPTED_POST),
          headers: {"Content-type": "application/json"},
          body: jsonEncode({
            'username' : widget.userLogin.username
          })
      );
    }
    if(statusWant==null){
      //Trường hợp ngoài dự liệu, để code ko phát sinh lỗi
      response = await http.post(
          Uri.encodeFull(GET_WRITER_POST),
          headers: {"Content-type": "application/json"},
          body: jsonEncode(<String, String>{
            'username' : widget.userLogin.username
          }
          )
      );
    }

    var jsonData = json.decode(utf8.decode(response.bodyBytes));
    print(jsonData);
    List<WriterPost> listWriter = [];

    for (var u in jsonData) {

      WriterPost wpost = WriterPost(
        id: u["id"],
        title: u["title"],
        description: u["description"],
        characterLimit: u["characterLimit"],
        amount: u["amount"],
        postType: u["postType"],
        relatedDocument: u["relatedDocument"],
        isPublic: u["isPublic"],
        createdDate: u["createdDate"],
        status: u["status"],
          listKeywords: List.from(u["listKeywords"])
      );
      listWriter.add(wpost);
    }
    return listWriter;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey[100],
      width: double.infinity,
      height: size.height,
      child: Column(
        children: [
          Container(
            height: 78,
            color: Colors.blue,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(top: 15),
            child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return PostTypeScreen(userLogin: widget.userLogin,);
                          }));
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            widget.userLogin.photoUrl,
                          ),
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
                  ),

                ]
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                // width: double.infinity,
                // height: size.height * 0.6,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        listTotal = _fetchPostWriter();
                                        flagColorChange = 1;
                                      });
                                    widget.isRequested = false;
                                      widget.strButton = "Request";
                                    },
                                    child: Text('All'),
                                    color: flagColorChange == 1 ? Colors.redAccent : Colors.blueAccent,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: FlatButton(
                                    onPressed: ()  {
                                    
                                      setState(()  {
                                        listTotal = _getRequetedByUsername("Requested");
                                        flagColorChange = 2;
                                      });
                                      widget.isRequested = true;
                                      widget.strButton = "Cancel Request";
                                    },
                                    child: Text('Requested'),
                                    color: flagColorChange == 2 ? Colors.redAccent : Colors.blueAccent,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        listTotal = _getRequetedByUsername("Accepted");
                                        flagColorChange = 3;
                                      });
                                      widget.isRequested = false;
                                      widget.strButton = "Accepted";
                                    },
                                    child: Text('Accepted'),
                                    color: flagColorChange == 3 ? Colors.redAccent : Colors.blueAccent,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: listTotal == null ?List3Tab(listWriter: _fetchPostWriter(),userLogin: widget.userLogin, numberJob: widget.numberJob,isRequested: widget.isRequested,strButton: widget.strButton, ) :List3Tab(listWriter: listTotal,userLogin: widget.userLogin, numberJob: widget.numberJob,isRequested: widget.isRequested,strButton: widget.strButton, )
                      )
                    ],
                  )),
            ),
          )
        ],
      ),

      //
    );
  }
}
