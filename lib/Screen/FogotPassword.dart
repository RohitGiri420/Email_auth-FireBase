import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widget/UiHelper.dart';
import 'Login.dart';

class Fogotpassword extends StatefulWidget {
  const Fogotpassword({super.key});

  @override
  State<Fogotpassword> createState() => _FogotpasswordState();
}

class _FogotpasswordState extends State<Fogotpassword> {

  TextEditingController forgotpasscontroller = TextEditingController();

  forgotPass(String email){
    if(email.isEmpty){
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter Email")));
    }

    try{
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Link Sent Successfully")));
    } catch (ex){
      if(ex is FirebaseAuthException){
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ex.code)));
      }
      else{
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Unknown Error Occured")));
      }

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reset Gateway: Reclaim Access",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 30,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Every master was once a beginner. Don't worry, resetting your password is just a step in your journey to mastering your account",
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),

            SizedBox(
              height: 35,
            ),

            Uihelper().CustomTextField(
              forgotpasscontroller,
              "Enter Email",
              false,
              Icons.key,
                  () {},
            ),

            SizedBox(
              height: 15,
            ),

            Uihelper().CustomButton("Reclaim Access", Colors.orange.shade300, () {
              forgotPass(forgotpasscontroller.text);
            },),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already Have an Account?",style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w600),),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                }, child:Text("Log In",style: TextStyle(color: Colors.orange.shade300),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
