import 'package:flutter/material.dart';
import 'package:mobileapp/Models/writer_post.dart';

class Body extends StatelessWidget {

  WriterPost writerPost;

  Body({Key key, this.writerPost}) : super(key: key);


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
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Request',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                    ))
              ],
            )),
      ),
    );
  }

  
}
