import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  final List list;
  final Widget nextScreen;
  final String subText;
  final String icon;

  const CustomListView({
    Key key,
    @required this.list,
    this.nextScreen,
    this.subText,
    this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final newlist = list;
    return Container(
      width: double.infinity,
      height: size.height * 0.75,
      margin: EdgeInsets.symmetric(vertical: size.height * 0.0),
      child: ListView.separated(
        itemCount: newlist.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              icon,
              width: size.width * 0.15,
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return nextScreen;
              }));
            },
            title: Text(newlist[index]),
            trailing: Icon(Icons.keyboard_arrow_right),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.black,
            endIndent: 20.0,
            indent: 20.0,
          );
        },
      ),
    );
  }
}
