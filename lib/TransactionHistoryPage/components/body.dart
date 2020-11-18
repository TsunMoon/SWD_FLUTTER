import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobileapp/InfoPage/components/body.dart';
import 'package:mobileapp/Models/transaction_history.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/Models/user_login.dart';
import 'package:mobileapp/global.dart';


class Body extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C', 'D', 'F', 'G', 'H'];
  final List<int> colorCodes = <int>[600, 500, 100];

  UserLogin userLogin;
  var currentBean;

  Body({Key key, this.userLogin}): super(key: key);

  // Lấy số đậu hiên tại theo username
  Future<int> _getCurrentBean() async {
    http.Response response = await http.post(
      Uri.encodeFull(GET_CURRENT_BEAN_BY_USERNAME),
        headers: {"Content-type": "application/json"},
        body: jsonEncode(<String, String>{
          'username' : userLogin.username
        })
    );
    var jsonDataBean = json.decode(utf8.decode(response.bodyBytes));
    print(jsonDataBean);
    currentBean = jsonDataBean.toString();

    return -1;
  }


  //Lấy danh sách lịch sử giao dịch
  Future<List<TransactionHistory>> _fetchTransactionHistory() async {
    http.Response response = await http.post(
      Uri.encodeFull(GET_TRANSACTION_HISTORY_BY_USERNAME),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(<String, String>{
          'username' : userLogin.username
      })
    );


    var jsonData = json.decode(utf8.decode(response.bodyBytes));
    List<TransactionHistory> listTransaction = [];

    for(var u in jsonData){
      TransactionHistory newTransaction = new TransactionHistory(
        postTitle: u["postTitle"],
        amount: u["amount"],
        transactionDate: u["transactionDate"]
      );
      listTransaction.add(newTransaction);
    }
   await _getCurrentBean();
    return listTransaction;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: FutureBuilder(
        future: _fetchTransactionHistory(),
        builder: (context, snapshot){
          if(snapshot.data != null){
            return Container(
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
                                  currentBean != null ? currentBean :
                                  userLogin.amount.toString() + " Bean",
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
                                      itemCount: snapshot.data.length,
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
                                                                  snapshot.data[index].postTitle,
                                                                  style: TextStyle(
                                                                      fontSize: 18
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 20,
                                                              child: Text(
                                                                snapshot.data[index].transactionDate.substring(8,10)
                                                                + "/" + snapshot.data[index].transactionDate.substring(5,7) +
                                                                    "/" + snapshot.data[index].transactionDate.substring(0,4),
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
                                                          "+ " +(snapshot.data[index].amount.toString()) +'   Beans',
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
            );
          }else{
            return Container(
              child: Center(
                child: Text("Không có dữ liệu giao dịch"),
              ),
            );
          }

        },

      ),
      //
    );
  }
}
