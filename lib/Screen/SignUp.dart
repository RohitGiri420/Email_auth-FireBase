import 'package:email_auth/Widget/UiHelper.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController emailController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign Up",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 30,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 8,),
            Text(
              "Create an so you can order your favourite watch easily and Quickly. ",
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8,),
            Uihelper().CustomTextField(emailController,"Email")

          ],
        ),
      ),
    );
  }
}
