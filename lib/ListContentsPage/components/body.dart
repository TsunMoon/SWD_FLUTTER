import 'package:flutter/material.dart';
import 'package:mobileapp/InfoPage/info_screen.dart';
import 'package:mobileapp/Models/user_login.dart';
import 'package:mobileapp/Models/writer_post.dart';
import 'package:mobileapp/PostDetailPage/postdetail_screen.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/global.dart';
import 'dart:async';
import 'dart:convert';

class Body extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  UserLogin userLogin;

  Body({Key key, this.userLogin}) : super(key: key);

  //Hàm fetch api lấy list các bài post
  Future<List<WriterPost>> _fetchPostWriter() async {
    http.Response response = await http.get(GET_WRITER_POST);
    var jsonData = json.decode(utf8.decode(response.bodyBytes));
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
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  userLogin.photoUrl,
                ),
              ),
              title: Text(
                userLogin.displayName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              subtitle: Text('Xin chào!'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InfoScreen();
                }));
              },
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
                                    onPressed: () {},
                                    child: Text('All'),
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: FlatButton(
                                    onPressed: () {},
                                    child: Text('Requested'),
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: FlatButton(
                                    onPressed: () {},
                                    child: Text('Accepted'),
                                    color: Colors.orange,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: Container(
                            child: FutureBuilder(
                              future: _fetchPostWriter(),
                              builder: (context, snapshot) {
                                if (snapshot.data == null) {
                                  return Container(
                                    child: Center(
                                      child: Text("Loading..."),
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
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 30,
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 4,
                                                        child: Padding(
                                                          padding:
                                                          const EdgeInsets.only(
                                                              right: 40.0),
                                                          child: Container(
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child: Container(
                                                                    child: Text(
                                                                      '#News',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .lightBlueAccent),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Container(
                                                                    child: Text(
                                                                      '#News',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .lightBlueAccent),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Container(
                                                                    child: Text(
                                                                      '#News',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .lightBlueAccent),
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
                                                            '750000',
                                                            style: TextStyle(
                                                                color:
                                                                Colors.blueAccent,
                                                                fontSize: 18),
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
                                                  child: snapshot.data[index]
                                                      .description !=
                                                      null
                                                      ? Text(
                                                    snapshot
                                                        .data[index].description,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: Colors.grey),
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
                                                              snapshot.data[index]
                                                                  .createdDate
                                                                  .substring(
                                                                  11, 13) +
                                                              ":" +
                                                              snapshot.data[index]
                                                                  .createdDate
                                                                  .substring(
                                                                  14, 16) +
                                                              " | " +
                                                              snapshot.data[index]
                                                                  .createdDate
                                                                  .substring(
                                                                  8, 10) +
                                                              "/" +
                                                              snapshot.data[index]
                                                                  .createdDate
                                                                  .substring(5, 7) +
                                                              "/" +
                                                              snapshot.data[index]
                                                                  .createdDate
                                                                  .substring(0, 4))
                                                              : Text("Created at 21:40 | 27/10/2020"),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                          const EdgeInsets.only(
                                                              left: 20.0, right: 5),
                                                          child: Container(
                                                            child: FlatButton(
                                                              onPressed: () {
                                                                Navigator.push(context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) {
                                                                          return PostDetailScreen();
                                                                        }));
                                                              },
                                                              child: Text(
                                                                'Preview',
                                                                style: TextStyle(
                                                                    color:
                                                                    Colors.white),
                                                              ),
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
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                    const Divider(),
                                  );
                                }
                              },
                            )),
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
