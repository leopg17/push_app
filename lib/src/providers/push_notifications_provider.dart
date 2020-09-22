import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajesStream => _mensajesStreamController.stream;

  static Future<dynamic> onBackgroundMessage(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }

  initNotifications() async {
    //Este método lo vamos a llamar para tener el consentimiento del usuario para
    //recibir notificaciones.
    await _firebaseMessaging.requestNotificationPermissions();
    final token = await _firebaseMessaging.getToken();
    //fwgqRtszRtCHGPINRLleV5:APA91bFHCOJAutoo7Cv8Odld1vEpjmDdz8FHrQjnxMtf32lM8eQ8nRwsjyOFqL8otoed6ahajJL137mIVAFuoEqhnK2OZAJVDw1JCLHpJd-V7RHSowvUNASuYeAhfOtO79yoPrzIAt_D
    print('===FCM Token===');
    print(token);

    _firebaseMessaging.configure(
      onMessage: onMessage,
      onBackgroundMessage: onBackgroundMessage,
      onLaunch: onLaunch,
      onResume: onResume,
    );
  }

  Future<dynamic> onMessage(Map<String, dynamic> message) async {
    // Or do other work.
    print('====== onMessage ======');
    // print('message: $message');
    // print('argumento: $argumento');

    final argumento = message['data']['comida'] ?? 'no-data';
    _mensajesStreamController.sink.add(argumento);
  }

  Future<dynamic> onLaunch(Map<String, dynamic> message) async {
    // Or do other work.
    print('====== onLaunch ======');
    // print('message: $message');
    // print('argumento: $argumento');
    final argumento = message['data']['comida'] ?? 'no-data';
    _mensajesStreamController.sink.add(argumento);
  }

  Future<dynamic> onResume(Map<String, dynamic> message) async {
    // Or do other work.
    print('====== onResume ======');
    // print('message: $message');
    // print('argumento: $argumento');
    final argumento = message['data']['comida'] ?? 'no-data';
    _mensajesStreamController.sink.add(argumento);
  }

  dispose() {
    _mensajesStreamController?.close();
  }
}
