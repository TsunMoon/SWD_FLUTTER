import 'package:flutter/material.dart';
import 'package:mobileapp/constants.dart';

class AlreadyHaveAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAccountCheck({
    Key key,
    this.login,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Bạn chưa có tài khoản ? " : "Bạn đã có tài khoản ? ",
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
            onTap: press,
            child: Text(
              login ? "Đăng kí" : "Đăng nhập",
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ))
      ],
    );
  }
}
