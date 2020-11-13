import 'package:flutter/cupertino.dart';

class WriterPost{
  int id;
  String title;
  String description;
  int characterLimit;
  int amount;
  String postType;
  String relatedDocument;
  bool isPublic;
  String createdDate;
  String status;
  List<String> listKeywords;



  WriterPost({this.id, this.title, this.description, this.characterLimit, this.amount, this.postType,
  this.relatedDocument, this.isPublic, this.createdDate, this.status, this.listKeywords });
}