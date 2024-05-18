import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Fetchdata extends StatefulWidget {
  const Fetchdata({super.key});

  @override
  State<Fetchdata> createState() => _FetchdataState();
}

class _FetchdataState extends State<Fetchdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseFirestore.instance.collection("Notes").snapshots(),builder:
        (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.active){
            if(snapshot.hasData){
              return ListView.builder(itemBuilder: (context, index) {
                return ListTile(
                  leading: Text((1+index).toString()),
                  title: Text(snapshot.data!.docs[index]["title"]),
                  subtitle: Text(snapshot.data!.docs[index]["Decription"]),
                );
              },itemCount: snapshot.data!.docs.length,);
            }
            else if(snapshot.hasError){
              return Center(child: Text(snapshot.hasError.toString()),);
            }
            else{
              return Center(child: Text("No data Found"),);
            }


          }
          else{
            return Center(child: Text("connection State is inactive"),);
          }
        },),
    );
  }
}
