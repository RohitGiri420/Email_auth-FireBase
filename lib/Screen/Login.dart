import 'package:email_auth/Screen/GetStarted.dart';
import 'package:email_auth/Screen/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widget/UiHelper.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  
  LoginAuth(String email , String password)async{
    
    if(email.isEmpty||password.isEmpty){
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter Required Field")));
    }
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return Navigator.push(context, MaterialPageRoute(builder: (context) => Getstarted(),));
    } catch (ex){
      if(ex is FirebaseAuthException){
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ex.code)));
      }
      else{

      }
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
          children: [
            SizedBox(
              height: 150,
            ),
            Text(
              "Welcome Back!",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 30,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Sign in to your account",
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),
            Uihelper().CustomTextField(
              emailcontroller,
              "Email",
              false,
              Icons.mail,
              () {},
            ),
            Uihelper().CustomTextField(
              passwordcontroller,
              "Password",
              true,
              CupertinoIcons.eye,
              () {},
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {

                }, child:Text("Forgot Password?",style: TextStyle(color: Colors.black54),)),
              ],
            ),

            Uihelper().CustomButton(
              "Log In",
              Colors.orange.shade300,
              () {
                LoginAuth(emailcontroller.text, passwordcontroller.text);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Divider(
                      height: 1,
                      color: Colors.black12,
                    ),
                  ),
                  Center(
                    child: Container(
                      color: Colors.white,
                      width: 150,
                      child: Center(
                          child: Text(
                        "Or Continue With",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      )),
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
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child:
                            Image.asset('asset/image/facebook-app-symbol.png'),
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
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Have an Account?",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.orange.shade300),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
