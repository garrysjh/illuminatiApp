import 'package:androidquiz/constants.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'package:androidquiz/Screens/HomePage/homepage_screen.dart';
import 'package:androidquiz/components/rounded_button.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    Size size =  MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: size.width,
            height: size.height,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 200,
                  height: 200,
                  child: RiveAnimation.asset("assets/check.riv",),
                ),
                const Spacer(flex: 3,),
                const Positioned(
                  top: 220,
                  left: 137,
                  child: Text(
                    "Finished !",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                Spacer(flex: 3,),
                Positioned(
                  top: 500,
                  child: RoundedButton(
                    text: "Return to Home", 
                    color: kPrimaryLightColor,
                    textColor: Colors.black,
                    press: () {
                      Future.delayed(Duration.zero, () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => const HomePageScreen()
                          ),
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}