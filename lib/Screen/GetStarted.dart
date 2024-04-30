import 'dart:ui';

import 'package:email_auth/Screen/Login.dart';
import 'package:email_auth/Screen/SignUp.dart';
import 'package:email_auth/Widget/UiHelper.dart';
import 'package:flutter/material.dart';

class Getstarted extends StatelessWidget {
  const Getstarted({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(

      // Main Stack Widget ....................
      body: Stack(
        children: [

          // BackGround Image ...........................
          Container(
              height: height,
              decoration: BoxDecoration(),
              clipBehavior: Clip.antiAlias,
              child: Image.asset("asset/image/watch.jpg", fit: BoxFit.cover)),

          //Blur Filter ..................................
          BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 3.0, sigmaX: 3.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      // Upper Blank Space ......................
                      Expanded(child: Container()),

                      //Start Your Shoping ....................
                      Text("Start Your Shopping Journey Now",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 32,
                          )),

                      //Description Text ......................
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text("Lorem ipsum dolor sit amet, consec tetur adipiscing elit, sed do",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            )),
                      ),

                      //Login Button ..........................
                      Uihelper().CustomButton("Log In", Colors.black,() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                      },),

                      //Sign Up Button ........................
                      Uihelper().CustomButton("Sign Up", Colors.orange.shade300,() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                      },)

                    ],
                  ),
                ),
              )),
        ],
      ),

    );
  }
}
