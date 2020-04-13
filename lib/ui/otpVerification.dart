import 'package:flutter/material.dart';
import 'dart:math';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OTPVerification extends StatefulWidget {
  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onCompleted: (
                  pin,
                ) {
                  print(
                    "Completed: " + pin,
                  );
                },
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
