import 'package:androidquiz/Screens/Waiting/WaitingScreen.dart';
import 'package:androidquiz/storedValues/current_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:androidquiz/constants.dart';
import 'package:androidquiz/storedValues/current_user.dart';

class QuizHeader extends StatefulWidget {
  const QuizHeader({super.key});

  @override
  State<QuizHeader> createState() => _QuizHeaderState();
}

class _QuizHeaderState extends State<QuizHeader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          //BG IMAGE
          Container(
            height: 200,
            padding: const EdgeInsets.only(
              top: 40, 
              left: 20, right: 20, bottom: 15,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/quizbg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  
                  children: [
                    Text(
                      "Welcome, ${currentUser.getFirstname()}",
                      style: GoogleFonts.quicksandTextTheme().headlineLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    
                  ],
                ),
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: kPrimaryLightColor,
                  child: Text(
                    "G",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
           Positioned(
            bottom: -10,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,),
              child: SizedBox(
                height: 140,
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.black38,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10),),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ 
                        const SizedBox(height: 5),
                        Text(
                          "Quiz Code: ",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.normal, 
                          ),
                        ),
                        
                        const SizedBox(height: 15),
                        Row(
                          
                          children: [
                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Enter Code",
                                  filled: true,
                                  contentPadding: EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(Radius.circular(5),),
                                  ),
                                ),
                              )
                            ),
                            const SizedBox(width: 10,),
                            ElevatedButton(
                              onPressed: (){
                                print(currentUser.getFirstname());
                                print(currentUser.getId());
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => WaitingScreen()));
                              }, 
                              child: const Text("Join"),
                              style: ElevatedButton.styleFrom( backgroundColor: kPrimaryColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )


          //Join Quiz Card

        ],
      ),
    );
  }
}