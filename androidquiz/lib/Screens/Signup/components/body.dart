import 'package:androidquiz/Screens/Signup/components/background.dart';
import 'package:androidquiz/Screens/Signup/components/or_divider.dart';
import 'package:androidquiz/Screens/Signup/components/social_icon.dart';
import 'package:androidquiz/components/rounded_firstname.dart';
import 'package:androidquiz/components/rounded_lastname.dart';
import 'package:androidquiz/components/rounded_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../components/already_have_an_account_checked.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import '../../../components/rounded_password_field.dart';
import '../../Login/login_screen.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:androidquiz/main.dart';

String emailOut = "";
String passwordOut = "";
String firstnameOut  = "";
String lastnameOut = "";
String mobileOut = "";

Future<http.Response> register() async{
  final response = await http.post(
    Uri.parse('$URL/user/register'),
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
        'username': emailOut,
        'password': passwordOut,
        'firstname': firstnameOut,
        'lastname': lastnameOut,
        'mobile': mobileOut
    }),
  );
  if (response == null) {
    print("noresponse");
    Fluttertoast.showToast(
      msg: "Error connecting to server! Try again later.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    return jsonDecode(response.body);
  }
  else {
    print(response.body);
    Fluttertoast.showToast(
      msg: response.body.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 54, 244, 86),
        textColor: Colors.white,
        fontSize: 16.0
    );
    return response;
  }
}

void fieldsCheck(){
  bool mobileIsNumeric = int.tryParse(mobileOut)!=null;
  if(emailOut==""||passwordOut==""||firstnameOut==""||lastnameOut==""||mobileOut==""){
    Fluttertoast.showToast(
      msg: "Please fill up all fields!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  else if(!emailOut.contains('@')){
    Fluttertoast.showToast(
      msg: "Invalid Email!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  else if (!mobileIsNumeric){
    Fluttertoast.showToast(
      msg: "Invalid Mobile number!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  else{
    register();
  }
}

class Body extends StatelessWidget {
  final Widget child;
  const Body({
    Key? key,
    required this.child,
  }): super(key:key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "SIGN UP", 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
            ),
            SizedBox(height: size.height * 0.00004,),
            Image.asset(
              "assets/icons/signup.png", 
              height: size.height * 0.2,
            ),
            SizedBox(height: size.height * 0.005,),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                emailOut = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value){
                passwordOut = value;
              },
            ),
            RoundedFirstname(
              hintText: "First Name",
              onChanged: (value) {
                firstnameOut = value;
              },
            ),
             RoundedLastname(
              hintText: "First Name",
              onChanged: (value) {
                lastnameOut =  value;
              },
            ),
             RoundedMobile(
              hintText: "First Name",
              onChanged: (value) {
                mobileOut = value;
              },
            ),
            RoundedButton(
              text: "SIGN UP", 
              press: () {
                fieldsCheck();
              },
            ),
            SizedBox(height: size.height * 0.002,),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: (){
                Future.delayed(Duration.zero, () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                });
              },
            ),
            const OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: "assets/icons/facebook.png",
                  press: (){},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/twitter.png",
                  press: (){},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/google.png",
                  press: (){},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

