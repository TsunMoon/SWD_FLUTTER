import 'package:flutter/material.dart';
import 'package:mobileapp/Models/user_login.dart';
import 'package:mobileapp/Models/writer_post.dart';
import 'package:mobileapp/PostDetailPage/components/body.dart';

class PostDetailScreen extends StatelessWidget {

  WriterPost writerPost;
  UserLogin userLogin;
  int numberJob;
  bool isRequested;
  String strButton;


  PostDetailScreen({Key key, this.writerPost, this.userLogin, this.numberJob, this.isRequested,this.strButton }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post Detail'
        ),
      ),
      body: Body(writerPost: writerPost,userLogin: userLogin,numberJob: numberJob,isRequested: isRequested,strButton: strButton,),
    );
  }
}
