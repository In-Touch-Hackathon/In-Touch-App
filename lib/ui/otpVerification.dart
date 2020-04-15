import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:http/http.dart' as http;

class OTPVerification extends StatefulWidget {
  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore();
  final _messaging = FirebaseMessaging();
  FirebaseUser currentUser;

  @override
  void initState() {
    super.initState();
    sendVerification()
      .catchError((onError) => print(onError));
  }

  Future<dynamic> sendVerification() async {
    currentUser = await _auth.currentUser();
    try {
      var response = await http.post('https://intouch.tk/verify', headers: {
        'Authorization': 'Bearer ${(await currentUser.getIdToken()).token}'
      });
      print(response.statusCode);
      print('sent...');
    } catch (e) {
      print('An error occurred: $e');
    }
    print('code is ${(await currentUser.getIdToken()).token}');
  }

  void _checkVerificationCode(String code) async {
    var docRef = _firestore.document('/codes/${currentUser.uid}');
    var message;
    if ((await docRef.get()).data['code'] == code) {
      await docRef.delete();

      await _firestore.document('/users/${currentUser.uid}').setData({ 'verified': true }, merge: true);
      message = 'Registered';

      var registrationToken = await _messaging.getToken();
      await _firestore.document('/fcmtokens/$registrationToken').setData({
        'uid': currentUser.uid
      });
    } else {
      message = 'Invalid Code';
    }

    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Color(
                0xfff3a183,
              ),
              Color(
                0xffec6f66,
              ),
            ],
          ),
        ),
        child: Center(
          child: new ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              left: 40.0,
              right: 40,
            ),
            children: [
              header(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                ),
              ),
              OTPTextField(
                length: 5,
                width: MediaQuery.of(context).size.width - 80,
                style: TextStyle(
                  fontSize: 17,
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                onCompleted: _checkVerificationCode,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget header() {
    final _media = MediaQuery.of(
      context,
    ).size;

    return Center(
      child: Column(
        children: <Widget>[
          Center(
            child: Icon(
              Icons.phonelink_setup,
              size: min(
                _media.width / 2,
                _media.height / 2,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "PLEASE TYPE YOUR VERIFICATION CODE",
            style: TextStyle(
              letterSpacing: 4,
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
