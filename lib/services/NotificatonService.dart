import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService{
  static Future<void> initialized()async{
    NotificationSettings notificationSettings =await FirebaseMessaging.instance.requestPermission();

    if(notificationSettings.authorizationStatus == AuthorizationStatus.authorized){
      FirebaseMessaging.onBackgroundMessage(backgroundHandler);
      FirebaseMessaging.onMessage.listen((event) {
        log(event.notification!.title.toString());
      },);
      log("Notification Authorized");
    }
  }
}

Future<void> backgroundHandler(RemoteMessage remotmessage)async{
  log("Received Message ${remotmessage.notification!.title}");
}