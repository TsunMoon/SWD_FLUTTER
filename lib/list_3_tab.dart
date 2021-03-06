import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobileapp/Models/user_login.dart';
import 'package:mobileapp/Models/writer_post.dart';
import 'package:mobileapp/PostDetailPage/postdetail_screen.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/PostTypePage/posttype_screen.dart';
import 'package:mobileapp/global.dart';

class List3Tab extends StatefulWidget {
  Future<List<WriterPost>> listWriter;
  UserLogin userLogin;
  int numberJob;
  bool isRequested;
  String strButton;

  List3Tab(
      {Key key,
      this.listWriter,
      this.userLogin,
      this.numberJob,
      this.isRequested,
      this.strButton})
      : super(key: key);

  @override
  _List3TabState createState() => _List3TabState();
}

class _List3TabState extends State<List3Tab> {

  // Hàm mô phỏng ấn submit
  void pressSubmit(int postID){
    showDialog(
        context: context,
        builder: (_) => AlertDialog( title: Text('Submit', style: TextStyle(color: Colors.red, fontSize: 25),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Submit Thành Công', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Đồng ý'),
              onPressed: () async {
                http.Response response = await http.post(Uri.encodeFull(PRESS_SUBMIT),
                    headers: {"Content-type": "application/json"},
                    body: jsonEncode(<String,String>{
                      'postId' : postID.toString(),
                      'giver' : "abv",
                      'receiver' : widget.userLogin.username ,
                    })
                );

                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return PostTypeScreen(userLogin: widget.userLogin,);
                }));
              },
            ),
          ],

        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: widget.listWriter,
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Container(
            child: Center(
              child: Text("Không có dữ liệu"),
            ),
          );
        } else {
          return ListView.separated(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        Container(
                          height: 30,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 40.0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              !snapshot.data[index].listKeywords.isEmpty  ?
                                              snapshot.data[index].listKeywords[0] :
                                              "Không có",
                                              style: TextStyle(
                                                  color:
                                                      Colors.lightBlueAccent),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              !snapshot.data[index].listKeywords.isEmpty ?
                                              snapshot.data[index].listKeywords[1] :
                                              "Không có",
                                              style: TextStyle(
                                                  color:
                                                      Colors.lightBlueAccent),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              !snapshot.data[index].listKeywords.isEmpty ?
                                              snapshot.data[index].listKeywords[2] :
                                              "Không có",
                                              style: TextStyle(
                                                  color:
                                                      Colors.lightBlueAccent),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    snapshot.data[index].amount.toString(),
                                    style: TextStyle(
                                        color: Colors.blueAccent, fontSize: 18),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          child: Text(
                            snapshot.data[index].title,
                            style: TextStyle(fontSize: 23),
                          ),
                        ),
                        Container(
                          height: 20,
                          child: snapshot.data[index].description != null
                              ? Text(
                                  snapshot.data[index].description,
                                  overflow: TextOverflow.ellipsis,
                                  style: widget.numberJob != 3
                                      ? TextStyle(color: Colors.grey)
                                      : TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 18,
                                        ),
                                )
                              : Text("Không có mô tả"),
                        ),
                        Container(
                          height: 50,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: snapshot.data[index].createdDate !=
                                          null
                                      ? Text('Created at ' +
                                          snapshot.data[index].createdDate
                                              .substring(11, 13) +
                                          ":" +
                                          snapshot.data[index].createdDate
                                              .substring(14, 16) +
                                          " | " +
                                          snapshot.data[index].createdDate
                                              .substring(8, 10) +
                                          "/" +
                                          snapshot.data[index].createdDate
                                              .substring(5, 7) +
                                          "/" +
                                          snapshot.data[index].createdDate
                                              .substring(0, 4))
                                      : Text("Created at 21:40 | 27/10/2020"),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 5),
                                  child: Container(
                                    child: widget.strButton == "Accepted"
                                        ? FlatButton(
                                            onPressed: () {
                                              print(snapshot.data[index].id);
                                              pressSubmit(snapshot.data[index].id);
                                            },
                                      child: Text(
                                        'Submit',
                                        style: TextStyle(
                                            color: Colors.white),
                                      ),
                                    color:Colors.pink ,
                                    )
                                        : FlatButton(
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return PostDetailScreen(
                                                  userLogin: widget.userLogin,
                                                  writerPost:
                                                      snapshot.data[index],
                                                  numberJob: widget.numberJob,
                                                  isRequested:
                                                      widget.isRequested,
                                                  strButton: widget.strButton,
                                                );
                                              }));
                                            },
                                            child: Text(
                                              'Preview',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: Colors.blue,
                                          ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ));
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          );
        }
      },
    ));
  }
}
