import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:androidquiz/Screens/HomePage/components/recent_quiz_model.dart';
import 'package:androidquiz/constants.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:androidquiz/entities/quiz.dart';
import 'package:androidquiz/main.dart';




class RecentQuiz extends StatefulWidget {
  const RecentQuiz({
    Key? key, 
    required this.recentQuizModel,
  }): super(key: key);
  
  final RecentQuizModel recentQuizModel;

  @override
  State<RecentQuiz> createState() => _RecentQuizState();
}

class _RecentQuizState extends State<RecentQuiz> {
  late Future<List<Quiz>> futureQuiz;
  

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){},
        contentPadding: EdgeInsets.all(15),
        leading: Container(
          width: 50, 
          height: 50,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            widget.recentQuizModel.icon,
            color: Colors.white,
          ),
        ),
        title: Text(widget.recentQuizModel.name),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: const[
            Icon(
              Ionicons.document_text_outline,
              size: 18,
            ),
            SizedBox(width: 5,),
            Text("10/10 Questions"),
          ],
        ),
      ),
    );
  }
}