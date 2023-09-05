import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:grock/grock.dart';

class FirebaseNotificationService {
  late final FirebaseMessaging messaging;

  void settingNotification() async {
    await messaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
    );
  }

  void connectNotification() async {
    await Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );

    settingNotification();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      Grock.snackBar(
          title: "${event.notification?.title}",
          description: "${event.notification?.body}",opacity: 0.5,position: SnackbarPosition.top);
    });

    messaging
        .getToken()
        .then((value) => log("Token:$value", name: "FCM Token"));
  }
}
