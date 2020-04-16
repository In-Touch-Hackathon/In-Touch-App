import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intouch/messageHandler.dart';
import 'package:intouch/ui/welcomePage.dart';
import 'package:http/http.dart' as http;

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

  Future<void> _onNotification (Map<String, dynamic> message) async {
    await http.post('https://intouch.tk/connect/${message['data']['id']}',
        headers: { 'Authorization': 'Bearer ' + ((await (await _auth.currentUser()).getIdToken()).token),
          'Content-Type': 'application/json' });
  }

  @override
  void initState() {
    super.initState();
    _messaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        // not sure what we're doing here
      },
      onBackgroundMessage: messageHandler,
      onLaunch: _onNotification,
      onResume: _onNotification
    );

    _messaging.onTokenRefresh.listen((String token) async {
      print('new token: $token');
      var currentUser = await _auth.currentUser();
      if (currentUser == null) return;

      var uid = currentUser.uid;

      var userDoc = await _firestore.document('users/$uid').get();
      if (!userDoc.data['verified']) return;

      await _firestore.document('fcmtokens/$token').setData({ 'uid': uid });
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
