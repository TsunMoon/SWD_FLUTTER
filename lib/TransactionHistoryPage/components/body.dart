import 'package:flutter/material.dart';
import 'package:mobileapp/InfoPage/components/body.dart';

class Body extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C', 'D', 'F', 'G', 'H'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.archive,
                              color: Colors.white,
                            ),
                            Text(
                              'Amount',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: Text(
                      '123 Beans',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ))
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        // flex: 9,
                        child: Container(
                            child: ListView.separated(
                              itemCount: entries.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: (){
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (context) {
                                    //       return ;
                                    //     }));
                                  },
                                  child: Container(
                                      height: 55,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 20, right: 20),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 5),
                                                      child: Container(
                                                        height: 25,
                                                        child: Text(
                                                          'Paid My Post',
                                                          style: TextStyle(
                                                              fontSize: 18
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 20,
                                                      child: Text(
                                                        '02/11/2020 - 18:00',
                                                        style: TextStyle(
                                                            color: Colors.grey
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                  child: Text(
                                                    '+500 Beans',
                                                    style: TextStyle(
                                                        fontSize: 18
                                                    ),
                                                  ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
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