import 'package:email_auth/Screen/Login.dart';
import 'package:email_auth/Widget/UiHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descContrller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: (){LogOut();}, icon: Icon(Icons.logout))
      ],),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Uihelper().CustomTextField(titleController,"Title", false, Icons.title_rounded, (){}),
              Uihelper().CustomTextField(descContrller, "Description", false, Icons.description, (){}),
              Uihelper().CustomButton("Save", Colors.orange, (){})
            ],
          ),
        ),
      ),
    );
  }

  LogOut(){
    FirebaseAuth.instance.signOut().then((value) {
      return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
    },);

}

}

