import 'dart:ui';

import 'package:email_auth/Screen/SignUp.dart';
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
                      padding: const EdgeInsets.symmetric(horizontal: 36,vertical: 8),
                      child: Text("Lorem ipsum dolor sit amet, consec tetur adipiscing elit, sed do",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          )),
                    ),

                    //Login Button ..........................
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        child: Center(
                          child: Text(
                            "Log In",style : TextStyle(color: Colors.orange.shade400,fontWeight: FontWeight.w500,fontSize: 18)
                          ),
                        ),
                        height: 60,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.orange.shade400,width: 2,style: BorderStyle.solid),

                        ),
                      ),
                    ),

                    //Sign Up Button ........................
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                                "Sign Up",style : TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 18)
                            ),
                          ),
                          height: 60,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.orange.shade300,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.orange.shade300,width: 2,style: BorderStyle.solid),

                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              )),
        ],
      ),

    );
  }
}
