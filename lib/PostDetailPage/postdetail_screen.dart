import 'package:flutter/material.dart';
import 'package:mobileapp/Models/writer_post.dart';
import 'package:mobileapp/PostDetailPage/components/body.dart';

class PostDetailScreen extends StatelessWidget {

  WriterPost writerPost;

  PostDetailScreen({Key key, this.writerPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post Detail'
        ),
      ),
      body: Body(writerPost: writerPost,),
    );
  }
}
