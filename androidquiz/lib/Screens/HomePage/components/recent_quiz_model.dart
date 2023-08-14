import 'package:androidquiz/entities/quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:androidquiz/entities/quiz.dart';
import 'package:androidquiz/Screens/HomePage/components/recent_quiz.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:androidquiz/entities/quiz.dart';
import 'package:androidquiz/main.dart';

 var tempQuizTitle = "";
  var tempQuizDesc = ""; 

class RecentQuizModel {
  final int totalQuestions;
  final int answeredQuestions;
  final String name;
  final IconData icon;

  RecentQuizModel({
    required this.totalQuestions,
    required this.answeredQuestions,
    required this.name,
    required this.icon,
  });
}
Future<Quiz> fetchQuiz(int quizno) async {
  final response = await http
      .get(Uri.parse('$URL/quiz'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    print(jsonDecode(response.body));
  //   final List<dynamic> dataList = jsonDecode(response.body);
  //  print(dataList);
  //  final quiz = dataList[quizno];
  //  print(quiz['quiztitle']);
  //  print(quiz['quizdesc']);
  //  tempQuizTitle = quiz['quiztitle'];
  //  tempQuizDesc = quiz['quizdesc'];
    return Quiz.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print("failed lol");
    throw Exception('Failed to load quiz');
  }
}


List<dynamic> recentQuizzes = [
  RecentQuizModel(
  totalQuestions: 2,
  answeredQuestions: 0,
  name: "Test Quiz 1",
  icon: CupertinoIcons.question_circle,
  ),

  RecentQuizModel(
    totalQuestions: 10, 
    answeredQuestions: 10, 
    name: "Quiz 3", 
    icon: CupertinoIcons.question_circle,
  ),

  RecentQuizModel(
    totalQuestions: 10, 
    answeredQuestions: 10, 
    name: "Quiz 4", 
    icon: CupertinoIcons.question_circle,
  ),
  RecentQuizModel(
    totalQuestions: 10, 
    answeredQuestions: 10, 
    name: "Quiz 5", 
    icon: CupertinoIcons.question_circle,
  ),
  RecentQuizModel(
    totalQuestions: 10, 
    answeredQuestions: 10, 
    name: "Quiz 6", 
    icon: CupertinoIcons.question_circle,
  ),
  RecentQuizModel(
    totalQuestions: 10, 
    answeredQuestions: 10, 
    name: "Quiz 7", 
    icon: CupertinoIcons.question_circle,
  ),
];