import 'package:email_auth/Screen/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: (){LogOut();}, icon: Icon(Icons.logout))
      ],),
      body: Center(
        child: Text("User Login Sucessfully"),
      ),
    );
  }

  LogOut(){
    FirebaseAuth.instance.signOut().then((value) {
      return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));

    },);


}
}
