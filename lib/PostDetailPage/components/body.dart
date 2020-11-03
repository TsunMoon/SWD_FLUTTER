import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobileapp/ListContentsPage/listcontents_screen.dart';
import 'package:mobileapp/Models/user_login.dart';
import 'package:mobileapp/Models/writer_post.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/global.dart';


class Body extends StatelessWidget {

  WriterPost writerPost;
  UserLogin userLogin;
  int numberJob;
  bool isRequested;
  String strButton;


  Body({Key key, this.writerPost, this.userLogin, this.numberJob, this.isRequested, this.strButton}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController documentController = TextEditingController();
    TextEditingController priceController = TextEditingController();

    titleController.text = writerPost.title != null ? writerPost.title : "Không có tiêu đề";
    descriptionController.text = writerPost.description != null ? writerPost.description : "Không có mô tả";
    documentController.text = writerPost.relatedDocument != null ? writerPost.relatedDocument : "Không có tài liệu";
    priceController.text = writerPost.amount != null ? writerPost.amount.toString()  : "0";

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            height: size.height,
            child: Wrap(
              // crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              runSpacing: 10,
              children: [
                Text('Title'),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Your Title',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                    controller: titleController,
                    readOnly: true,
                    style: TextStyle(
                      color: Colors.green
                    ),
                  ),
                ),
                Text('Description'),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Your Description',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                    controller: descriptionController,
                    readOnly: true,
                    style: TextStyle(
                        color: Colors.red
                    ),
                  ),
                ),
                Text('Related Document'),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Your Document',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                    controller: documentController,
                    readOnly: true,
                  ),
                ),
                Text('Price'),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Your Price',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                    controller: priceController,
                    readOnly: true,
                    style: TextStyle(
                        color: Colors.blue
                    ),
                  ),
                ),
                Container(
                    child: strButton.compareTo("Accepted") == 0 ? Container() : FlatButton(
                      onPressed: ()  async {

                        if(isRequested){
                          //Bỏ api xóa trong bằng UserHavingPost
                          http.Response response = await http.post(
                            Uri.encodeFull(DELETE_REUESTED_POST),
                            headers: {"Content-type": "application/json"},
                            body: jsonEncode({
                              'username': userLogin.username,
                              'postId': writerPost.id,
                              'status' : 'requested'
                            })
                          );

                          if(response.statusCode == 201){
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog( title: Text('Hủy thành công', style: TextStyle(color: Colors.cyan, fontSize: 25),),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[


                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('Đồng ý'),
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return ListContentsScreen(userLogin: userLogin, numberJob: numberJob,);
                                        }) );
                                      },
                                    ),
                                  ],

                                )
                            );


                          }

                        }else{
                          http.Response response = await http.post(
                              Uri.encodeFull(POST_REQUESTED_POST),
                              headers: {"Content-type": "application/json"},
                              body: jsonEncode({
                                'username' : userLogin.username,
                                'postId': writerPost.id,
                                'status': 'requested'
                              })
                          );


                          if(response.statusCode == 201){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return ListContentsScreen(userLogin: userLogin, numberJob: numberJob,);
                            }) );
                          }else{

                            showDialog(
                               context: context,
                              builder: (_) => AlertDialog( title: Text('KHÔNG THỂ REQUEST', style: TextStyle(color: Colors.red, fontSize: 25),),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text('Bạn đang thực hiện một bài POST khác rồi', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Đồng ý'),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return ListContentsScreen(userLogin: userLogin, numberJob: numberJob,);
                                      }) );
                                    },
                                  ),
                                ],

                              )
                            );
                          }
                        }



                      },
                      child: Text(
                        strButton,
                        style: TextStyle(color: Colors.white),
                      ),
                      color: isRequested ? Colors.red : Colors.blue,
                    ))
              ],
            )),
      ),
    );
  }

  
}
