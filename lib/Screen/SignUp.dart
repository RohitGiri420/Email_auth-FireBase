import 'dart:developer';

import 'package:email_auth/Screen/Login.dart';
import 'package:email_auth/Widget/UiHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  signUp(String email, String password, String cnfpassword, BuildContext context) async {
    if (email.isEmpty || password.isEmpty || cnfpassword.isEmpty) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter Required Field")));
    }

    if (password != cnfpassword) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Passwords do not match")));
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Created")));
    } catch (ex) {
      if (ex is FirebaseAuthException) {
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ex.code)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Unknown error occurred")));
      }
    }
  }

  bool password = true;
  bool cnfpassword = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView(

          children: [

            SizedBox(height: 100,),
            Text(
              "Sign Up",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 30,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Create an so you can order your favourite watch easily and Quickly. ",
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Uihelper().CustomTextField(
              emailController,
              "Email",
              false,
              Icons.mail,
              () {},
            ),
            Uihelper().CustomTextField(
              Password,
              "Password",
              password,
              password ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash,
              () {
                password = password ? false : true;
                setState(() {});
              },
            ),
            Uihelper().CustomTextField(
              confirmpassword,
              "Confirm Password",
              cnfpassword,
              cnfpassword ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash,
              () {
                cnfpassword = cnfpassword ? false : true;
                setState(() {});
              },
            ),

            Uihelper().CustomButton("Sign Up", Colors.orange.shade300, () {
              signUp(emailController.text.toString(),Password.text.toString(), confirmpassword.text.toString(), context);
            },),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Divider(height: 1,color: Colors.black12,),
                  ),

                  Center(
                    child: Container(
                      color: Colors.white,
                      width: 150,
                      child: Center(child: Text("Or Continue With",style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w500),)),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(

                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset('asset/image/google.png'),
                      ),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),

                  Expanded(child: SizedBox(width: double.infinity,),flex: 1,),

                  Expanded(
                    flex: 4,
                    child: Container(

                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset('asset/image/facebook-app-symbol.png'),
                      ),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemBlue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),

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
