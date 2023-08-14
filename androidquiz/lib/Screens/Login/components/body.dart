import 'package:androidquiz/Screens/HomePage/homepage_screen.dart';
import 'package:androidquiz/Screens/Login/components/background.dart';
import 'package:androidquiz/Screens/Signup/signup_screen.dart';
import 'package:androidquiz/components/rounded_button.dart';
import 'package:androidquiz/components/rounded_input_field.dart';
import 'package:androidquiz/components/text_field_container.dart';
import 'package:androidquiz/constants.dart';
import 'package:androidquiz/storedValues/current_user.dart';
import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_checked.dart';
import '../../../components/rounded_password_field.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:androidquiz/storedValues/current_user.dart';

import 'package:androidquiz/main.dart';

String emailOut = "";
String passwordOut = "";

Future<http.Response> login() async{
  final response = await http.post(
    Uri.parse('$URL/user/login'),
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
        'username': emailOut,
        'password': passwordOut,
    }),
  );
  if (response == null) {
    Fluttertoast.showToast(
      msg: "Error connnecting to server!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 54, 244, 86),
        textColor: Colors.white,
        fontSize: 16.0
    );
    return jsonDecode(response.body);
  }
  else if(response.body == '0'){
    Fluttertoast.showToast(
      msg: "Invalid user credentials!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 148, 46, 32),
        textColor: Colors.white,
        fontSize: 16.0
    );
    currentUser.setId(0);
    return response;
  }
  else {
    currentUser.setId(int.parse(response.body));
    currentUser.checkName();
    return response;
  }
}

class Body extends StatelessWidget {
  Body({
    Key? key,
  }): super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size =  MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "LOGIN", 
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
          ),
          SizedBox(height: size.height * 0.03,),
          Image.asset(
            "assets/icons/login.png", 
            height: size.height * 0.35,
          ),
          SizedBox(height: size.height * 0.03,),
          RoundedInputField(
            hintText: "Your Email",
            onChanged: (String emailValue) {
              emailOut = emailValue;
            },
          ),
          RoundedPasswordField(
            onChanged: (String passwordValue){

              passwordOut = passwordValue;
            },
          ),
          RoundedButton(
            text: "LOGIN", 
            press: () {
              login();
              Future.delayed(const Duration(milliseconds:500), () {
                  if(currentUser.getId()!=0){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePageScreen())); 
              }
                });
              
            },
            
          ),
          SizedBox(height: size.height * 0.03,),
          AlreadyHaveAnAccountCheck(press: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen()));
          },),
        ],
      ),
    );
  }
}





