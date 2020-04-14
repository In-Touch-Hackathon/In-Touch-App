import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intouch/messageHandler.dart';
import 'package:intouch/ui/welcomePage.dart';

void main() => runApp(InTouchApp());

class InTouchApp extends StatefulWidget {
  @override
  InTouchAppState createState() {
    return new InTouchAppState();
  }
}

class InTouchAppState extends State<InTouchApp> {
  final _messaging = FirebaseMessaging();
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;

  @override
  void initState() {
    super.initState();
    _messaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
//        _showItemDialog(message);
      },
      onBackgroundMessage: messageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
//        _navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
//        _navigateToItemDetail(message);
      },
    );

    _messaging.onTokenRefresh.listen((String token) async {
      print('new token: $token');
      var uid = (await _auth.currentUser())?.uid;
      if (uid == null) return;

      await _firestore.document('users/$uid').setData({ 'fcmToken': token}, merge: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'In-Touch',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
