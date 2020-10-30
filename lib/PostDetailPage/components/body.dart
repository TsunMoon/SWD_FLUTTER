import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
