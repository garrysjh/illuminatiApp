import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'package:androidquiz/Screens/HomePage/homepage_screen.dart';
import 'package:androidquiz/constants.dart';
import 'package:androidquiz/Screens/Questions/question_page.dart';
import 'package:androidquiz/main.dart';

int waitCheck = 0;
void resetWaitCheck(){
  waitCheck = 0;
}


Future<int> checkServer() async{
  final response = await http.get(
    Uri.parse('$URL2/server'),
    
  );
  if (response == null) {
    print("noresponse");
    return int.parse(response.body);
  }
  else {
    waitCheck = int.parse(response.body);
    print(waitCheck);
    return int.parse(response.body);
  }
}



class WaitingScreen extends StatefulWidget{
  const WaitingScreen({Key? key,}): super(key: key);

  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}
Timer? timer;

class _WaitingScreenState extends State<WaitingScreen> {
  @override
  void initState(){
    super.initState();
    // _navigateToQuestion();
    timer = Timer.periodic(Duration(seconds:1), (Timer t) => {
      checkServer(),
      if(waitCheck!=0){
        timer!.cancel(),
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuestionPage()))
      }
      });
  }

  _navigateToQuestion()async{
    await Future.delayed(
      Duration(milliseconds: 1500), 
      (){},
    );
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> QuestionPage(title: title,)),);
  }

  @override
  Widget build(BuildContext context){
     Size size =  MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          
          children: [
            Image.asset(
              'assets/images/load.gif',
              height: 125.0,
              width: 125.0,
            ),
          const Positioned(
            top: 400,
            left: 140,
            child: Text(
              "Waiting for host to start...",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          ],
        ),
          
        
      ),
      
    );
  }
}