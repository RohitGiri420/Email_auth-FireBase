import 'package:flutter/material.dart';

class Uihelper{

  CustomTextField(TextEditingController controller, String text,bool obscure,IconData icon, VoidCallback ontap, ){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        color: Colors.white70,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white70)
        ),
        child: TextField(
          obscureText: obscure,
          cursorColor: Colors.black54,
          controller: controller,
          style: TextStyle(color: Colors.black54),
          decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(color: Colors.black54),
            suffixIcon: IconButton(onPressed:(){ontap;},icon: Icon(icon),),

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

  CustomButton(String text, Color color,VoidCallback ontap){
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: ontap,
        child: Container(
          child: Center(
            child: Text(
                text,style : TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 18)
            ),
          ),
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.orange.shade300,width: 2,style: BorderStyle.solid),

          ),
        ),
      ),
    );
  }
}