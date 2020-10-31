import 'package:flutter/material.dart';
import 'package:mobileapp/PostDetailPage/components/body.dart';

class PostDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post Detail'
        ),
      ),
      body: Body(),
    );
  }
}
