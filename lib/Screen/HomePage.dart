import 'package:cloud_firestore/cloud_firestore.dart';
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
              Uihelper().CustomButton("Save", Colors.orange, (){
                Adddata(titleController.text, descContrller.text);
              })
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

Adddata(String title, String description){

    if(title.isEmpty || description.isEmpty){
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter Required Field")));
    }
    else{
      FirebaseFirestore.instance.collection("Notes").doc(title).set({
        "title": title,
        "Decription": description
      }).then((value){
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("sucess...")));
      });

    }

}

}

