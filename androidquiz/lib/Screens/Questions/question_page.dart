import 'package:androidquiz/Screens/End/EndScreen.dart';
import 'package:androidquiz/Screens/Waiting/WaitingScreen.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:androidquiz/Screens/Questions/components/question_model.dart';
import 'package:androidquiz/constants.dart';

import 'package:androidquiz/main.dart';
import 'package:androidquiz/storedValues/current_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:androidquiz/Screens/Waiting/Waiting.dart';


int outerbuttonValue = 0;
void setouterbuttonValue(int num){
  outerbuttonValue = num;
}
int count=1;
void incCount() {
  count +=1;
}
void resetCount() {
  count = 0;
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

class QuestionPage extends StatefulWidget {
  @override
  State<QuestionPage> createState() => _QuestionPageState();
}


class _QuestionPageState extends State<QuestionPage> {
  int currentQuestion = 0;
  final PageController _pageController = PageController();
Timer? timer;
  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }
  @override
  void initState(){
    super.initState();
    timer = Timer.periodic(Duration(seconds:1), (Timer t) => {
      if(waitCheck==0){
        resetCount(),
        timer!.cancel(),
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => EndScreen()))

      }
      
      });
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Ionicons.help_outline),
            splashRadius: 24,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question ${currentQuestion + 1}/${sampleQuestions.length}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15,),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: sampleQuestions.length,
                onPageChanged: (value){
                  setState(() {
                    currentQuestion = value;
                  });
                },
                physics:  const BouncingScrollPhysics(),
                itemBuilder: (context, index){
                  final question = sampleQuestions[index];
                  return ListView(
                    children: [
                      ... List.generate(
                        4, 
                        (optionIndex) {
                          final option = question.options[optionIndex];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: RadioListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),),
                              contentPadding: const EdgeInsets.all(8),
                              value: option, 
                              groupValue: question.userAnswer, 
                              selected: question.userAnswer == option,
                              selectedTileColor: kPrimaryLightColor,
                              tileColor: kBGColor,
                              title: Text(option,),
                              activeColor: kPrimaryColor,
                              onChanged: (buttonValue){
                                setState(() {
                                  question.userAnswer = buttonValue!;
                                  setouterbuttonValue(int.parse(buttonValue));
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  );
              },),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: (){
                  incCount();
              print("count is $count");
              submitAns(outerbuttonValue);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Waiting()));
                  if(currentQuestion < sampleQuestions.length-1){
                    setState(() {
                      currentQuestion++;
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300), 
                        curve: Curves.easeIn,
                      );
                    });
                  }
                }, 
                style: ElevatedButton.styleFrom( backgroundColor: kPrimaryColor),
                child: Text(
                  currentQuestion < sampleQuestions.length - 1 
                  ? "Next"
                  : "Submit",
                ),                
              ),
            ),
          ],
        ),
      ),
    );
  }
}