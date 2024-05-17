import 'package:email_auth/Screen/HomePage.dart';
import 'package:email_auth/Screen/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return CheckUser();
  }

  CheckUser(){
    final user = FirebaseAuth.instance.currentUser;

    if(user != null){
      return Homepage();
    }
    else{
      return Login();

    }

  }
}
