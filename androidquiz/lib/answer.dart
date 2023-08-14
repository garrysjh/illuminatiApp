import 'package:androidquiz/Screens/Waiting/Waiting.dart';
import 'package:androidquiz/Screens/End/EndScreen.dart';
import 'package:androidquiz/main.dart';
import 'package:androidquiz/storedValues/current_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:androidquiz/Screens/Waiting/WaitingScreen.dart';

int count=1;
void incCount() {
  count +=1;
}
void resetCount() {
  count = 1;
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

Future<http.Response> submitAns(int answer) async{
  final response = await http.post(
    Uri.parse('$URL/answer'),
    body: jsonEncode(<String, dynamic>{
        'question_id': waitCheck,
        'user_id': currentUser.getId(),
        'answer': answer,
    }),
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response == null) {
    print("noresponse");
    return jsonDecode(response.body);
  }
  else {
    print(response);
    return response;
  }

}

// Future<void> testGet() async {
//   final url = Uri.parse('https://10.0.2.2/8080/B');
//   Response response = await get(url);
//   print('Status code: ${response.statusCode}');
//   print('Headers: ${response.headers}');
//   print('Body: ${response.body}');
class Answer extends StatefulWidget {
  @override
  State<Answer> createState() => AnswerState();
}

Timer? timer;

class AnswerState extends State<Answer> {
  @override
  void initState(){
    super.initState();
    timer = Timer.periodic(Duration(seconds:1), (Timer t) => {
      checkServer(),
      if(waitCheck==0){
        resetCount(),
        timer!.cancel(),
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => EndScreen()))

      }
      
      });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Text('A random lololol TEST idea:'),
          ElevatedButton(
            onPressed: () {

              incCount();
              print("count is $count");
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Waiting()));
            },
            child: Text('Next'),
          ),
          Text('YOU ARE ON ANSWER PAGE'),
          ElevatedButton(
            onPressed: () {
              submitAns(1);
              incCount();
              print("count is $count");
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Waiting()));
            },
            child: Text('1'),
          ),
          ElevatedButton(
            onPressed: () {
              submitAns(2);
              incCount();
              print("count is $count");
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Waiting()));
            },
            child: Text('2'),
          ),
          ElevatedButton(
            onPressed: () {
              submitAns(3);
              incCount();
              print("count is $count");
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Waiting()));
            },
            child: Text('3'),
          ),
        ],
      ),
    );
  }
}