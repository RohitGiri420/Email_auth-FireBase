import 'dart:developer';

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

  bool password = true;

  bool cnfpassword = true;

  SignUp(String email, String password, String cnfpassword)async{
    if(email ==""|| password==""||cnfpassword==""){
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter Required Field")));
    }

    else if(password == cnfpassword){
      UserCredential userCredential;
      try{
        userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Created")));
      }
      on FirebaseException catch(ex){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ex.code.toString())));
      }
    }
    else{
      UserCredential userCredential;
      try{
        userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Created")));
      }
      on FirebaseException catch(ex){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ex.code.toString())));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              SizedBox(height: 130,),
              Text(
                "Sign Up",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Create an so you can order your favourite watch easily and Quickly. ",
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 8,
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
                SignUp(emailController.toString(), password.toString(), cnfpassword.toString());

              },),


              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
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
                    Container(

                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset('asset/image/google.png'),
                      ),
                      height: 60,
                      width: 160,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(8),
                      ),
                    ),

                    Container(

                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset('asset/image/facebook-app-symbol.png'),
                      ),
                      height: 60,
                      width: 160,
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemBlue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have an Account?",style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w600),),
                  TextButton(onPressed: () {
                    
                  }, child:Text("Log In",style: TextStyle(color: Colors.orange.shade300),))
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}
