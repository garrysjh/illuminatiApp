import 'package:androidquiz/Screens/End/EndScreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'package:androidquiz/Screens/HomePage/homepage_screen.dart';
import 'package:androidquiz/constants.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:androidquiz/Screens/Waiting/WaitingScreen.dart';
import 'package:androidquiz/main.dart';
import 'package:androidquiz/Screens/Questions/question_page.dart';


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


class Waiting extends StatefulWidget{
  const Waiting({Key? key,}): super(key: key);

  @override
  State<Waiting> createState() => _WaitingState();
}
Timer? timer;
class _WaitingState extends State<Waiting> {
  @override
  void initState(){
    super.initState();
      timer = Timer.periodic(Duration(seconds:1), (Timer t) => {
      print("count is $count"),
      checkServer(),
      if(waitCheck == 0){
        timer!.cancel(),
        resetCount(),
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => EndScreen()))}
      else if(count == waitCheck){
        if(mounted){
        timer!.cancel(),
        print("popping"),
        Navigator.pop(context)}
      }
      

    });
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
              'assets/images/load2.gif',
              height: 125.0,
              width: 125.0,
            ),
          const Positioned(
            top: 400,
            left: 140,
            child: Text(
              "Waiting for others...",
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