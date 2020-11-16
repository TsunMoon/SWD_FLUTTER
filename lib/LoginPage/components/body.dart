import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobileapp/LoginPage/components/background.dart';
import 'package:mobileapp/MainPage/main_screen.dart';
import 'package:mobileapp/Models/user_login.dart';
import 'package:mobileapp/components/rounded_button.dart';
import 'package:mobileapp/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/global.dart';

final FirebaseAuth _authTest = FirebaseAuth.instance;
final GoogleSignIn googleSignInTest = GoogleSignIn();
FirebaseUser user;

UserLogin userLogin;


class Body extends StatelessWidget {

  const Body({
    Key key,
  }) : super(key: key);

Future<String> postLoginUser() async{
  http.Response response = await http.post(
    Uri.encodeFull(POST_LOGIN_USER),
    headers: {"Content-type": "application/json"},
    body: jsonEncode(<String, String>{
      'username' : user.email,
      'fullname' : user.displayName,
      'avatar' : user.photoUrl
    })
  );

  if(response.statusCode == 200){
  var data =  jsonDecode(utf8.decode(response.bodyBytes));
  userLogin = new UserLogin(username: data["username"], displayName: data["fullname"], photoUrl: data["avatar"],
    amount: data["amount"], rating: data["rating"]
  );
  print(userLogin.amount);
  return "Success";
  }else{
  return "Not Success";
  }

}
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              'CONTRADE',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                  color: Colors.black),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Image.asset(
              "assets/images/login-anim.gif",
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedButton(
              text: 'Đăng nhập bằng Email',
              press: () async {
              await  signInWithGoogleTest();
              await postLoginUser();

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MainScreen(userLogin: userLogin == null ? new UserLogin(username: user.email,
                  displayName: user.displayName,
                  photoUrl: user.photoUrl
                  ) : userLogin );
                }));
              },
              color: kPrimaryColor,
            ),
            SizedBox(
              height: size.height * 0.04,
            ),

          ],
        ),
      ),
    );
  }

 
}

Future<String> signInWithGoogleTest() async{
  final GoogleSignInAccount googleSignInAccountTest = await googleSignInTest.signIn();
  final GoogleSignInAuthentication googleSignInAuthenticationTest = await googleSignInAccountTest.authentication;

  final AuthCredential credentialTest = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthenticationTest.idToken,
      accessToken: googleSignInAuthenticationTest.accessToken);

  AuthResult authResult = await _authTest.signInWithCredential(credentialTest);
   user = await _authTest.currentUser(); 
  return null;
}

void signOutGoogle() async {
  await googleSignInTest.signOut();
}