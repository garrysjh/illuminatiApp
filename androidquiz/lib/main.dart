import 'package:flutter/material.dart';
import 'package:androidquiz/Screens/Welcome/welcome_screen.dart';
import 'package:androidquiz/constants.dart';
import 'package:androidquiz/storedValues/current_user.dart';

import 'package:google_fonts/google_fonts.dart';

var URL = 'http://10.91.249.196:8080/api/v1';
var URL2 = 'http://10.91.249.196:8080';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Android Quiz',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
         textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ), 
      home: WelcomeScreen(),
    );
  }
}
