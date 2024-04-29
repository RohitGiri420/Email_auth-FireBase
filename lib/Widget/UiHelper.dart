import 'package:flutter/material.dart';

class Uihelper{

  CustomTextField(TextEditingController controller, String text){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        color: Colors.white70,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white70)
        ),
        child: TextField(
          cursorColor: Colors.black54,
          controller: controller,
          style: TextStyle(color: Colors.black54),
          decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(color: Colors.black54),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.white70)
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.white70)
            ),
          ),
        ),
      ),
    );
  }

}