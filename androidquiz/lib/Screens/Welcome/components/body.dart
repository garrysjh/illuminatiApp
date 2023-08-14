import 'package:androidquiz/Screens/Login/login_screen.dart';
import 'package:androidquiz/Screens/Welcome/components/background.dart';
import 'package:androidquiz/components/rounded_button.dart';
import 'package:androidquiz/constants.dart';
import 'package:flutter/material.dart';
import 'package:androidquiz/Screens/Signup/signup_screen.dart';


class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    //gives us total ht and width of screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "ILLUMINATI", 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20, 
              ),
            ),
            SizedBox(height: size.height *  0.02),
            Image.asset(
              "assets/icons/main.png", 
              height: size.height * 0.5,
            ),
            SizedBox(height: size.height *  0.02),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Future.delayed(Duration.zero, () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                });
                
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Future.delayed(Duration.zero, () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen()));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

