import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:androidquiz/Screens/HomePage/components/recent_quiz.dart';
import 'package:androidquiz/Screens/HomePage/components/recent_quiz_model.dart';
import 'package:androidquiz/constants.dart';

import 'components/quiz_header.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:androidquiz/main.dart';
import 'package:androidquiz/entities/quiz.dart';
import 'package:androidquiz/Screens/HomePage/components/recent_quiz_model.dart';




class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    super.initState();
    // fetchQuiz(0);
  }
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
    child:  Scaffold(
      backgroundColor: kBGColor,
      body: SafeArea(
        child: Column(
          children: [
            //Quiz Header Card Widget
            QuizHeader(),
            //List of View of Quizzes
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top:25, left: 15, bottom: 15, right: 15,),
                children: [
                  Text(
                    "Quizz(es)",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 15,),
                  ... List.generate(
                    recentQuizzes.length, 
                    (index){
                      return RecentQuiz(
                        recentQuizModel: recentQuizzes[index],
                      );
                    },
                  ),

                  const SizedBox(height: 15,),

                ],
              ),
            ),

          ],
        )),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline), 
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.ribbon_outline), 
            label: "Awards",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.chatbox_ellipses_outline), 
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline), 
            label: "Profile",
          ),
        ],
      ),
    ));
  }
}