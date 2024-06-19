import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../main.dart';

int notificationsCounter1 = 0;

final _firebaseMessaging = FirebaseMessaging.instance;
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  notificationsCounter1++;
  int counter = await FlutterDynamicIcon.getApplicationIconBadgeNumber();
  FlutterDynamicIcon.setApplicationIconBadgeNumber(counter++);
}

Future<void> initNotification() async {
  await _firebaseMessaging.requestPermission();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              enableLights: true,
            ),
          ));
    }
  });
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
}
