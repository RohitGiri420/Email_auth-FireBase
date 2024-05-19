import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_auth/Screen/Login.dart';
import 'package:email_auth/Screen/fetchdata.dart';
import 'package:email_auth/Widget/UiHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descContrller = TextEditingController();

  File? PickedImage;
  Future<void> pickImage(ImageSource imageSource) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageSource);
      if (photo == null) return; // Check if no photo was picked
      final tempImg = File(photo.path);

      setState(() {
        PickedImage = tempImg; // Ensure this is the correct state variable
      });
    } catch (ex) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ex.toString())));
    }
  }


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

              PickedImage ==null?CircleAvatar(
                radius: 80,
                backgroundColor: Colors.black12,
                child: IconButton(onPressed: () {
                  _ShowDialog();

                },icon: Icon(CupertinoIcons.profile_circled,size: 140,color: Colors.black45,),),
              ):CircleAvatar(
                radius: 80,
                backgroundColor: Colors.black12,
                backgroundImage: FileImage(PickedImage!),
                child: GestureDetector(
                  onTap: () {
                    _ShowDialog();
                  },
                )
              ),
              SizedBox(height: 10,),
              Uihelper().CustomTextField(titleController,"Title", false, Icons.title_rounded, (){}),
              Uihelper().CustomTextField(descContrller, "Description", false, Icons.description, (){}),
              Uihelper().CustomButton("Save", Colors.orange, (){
                Adddata(titleController.text, descContrller.text);
                auth(titleController.text);
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
        return Navigator.push(context, MaterialPageRoute(builder: (context) => Fetchdata(),));
      });

    }

}

_ShowDialog(){
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: Text("Select Image From",style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w700,fontSize: 18),)),
        content:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(onPressed: () {

                      pickImage(ImageSource.camera);
                      Navigator.pop(context);

                    },icon: Icon(Icons.camera)),
                    Text("Camer",style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w700,fontSize: 18),)
                  ],
                ),
                Column(
                  children: [
                    IconButton(onPressed: () {

                      pickImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },icon: Icon(Icons.photo)),
                    Text("Gallery",style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w700,fontSize: 18),)
                  ],
                ),

              ],
            )
          ],
        ),
      );
    },);
}

auth(String title){
    if(title.isEmpty || PickedImage == null){
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter title")));
    }else{
      uploadImage();
    }

}
  Future<void> uploadImage() async {
    try {
      if (PickedImage == null) throw "No image selected";

      UploadTask uploadTask = FirebaseStorage.instance.ref("ProfilePictures").child(titleController.text).putFile(PickedImage!);
      TaskSnapshot taskSnapshot = await uploadTask;

      String imageUrl = await taskSnapshot.ref.getDownloadURL();
      String imageName = titleController.text;

      FirebaseFirestore.instance.collection("Images").doc(imageName).set({
        "Image name": imageName,
        "Image Url": imageUrl
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Image uploaded successfully")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to upload image: $e")));
    }
  }

}

