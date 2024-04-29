import 'package:flutter/material.dart';

class Uihelper{

  CustomTextField(TextEditingController controller, Text text, IconData icon){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          label: text,
          suffixIcon: Icon(icon),
        ),
      ),
    );
  }

}