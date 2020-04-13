import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intouch/ui/otpVerification.dart';

class PhoneNumberPage extends StatefulWidget {
  @override
  _PhoneNumberPageState createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
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
              phoneNumber(),
              SizedBox(
                height: 40,
              ),
              getVerification(),
            ],
          ),
        ),
      ),
    );
  }

  Widget phoneNumber() {
    return Row(
      children: <Widget>[
        Flexible(
          child: new Container(),
          flex: 1,
        ),
        Flexible(
          child: new TextFormField(
            textAlign: TextAlign.center,
            autofocus: false,
            enabled: false,
            initialValue: "+64",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          flex: 3,
        ),
        Flexible(
          child: new Container(),
          flex: 1,
        ),
        Flexible(
          child: new TextFormField(
            textAlign: TextAlign.start,
            autofocus: false,
            enabled: true,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          flex: 9,
        ),
        Flexible(
          child: new Container(),
          flex: 1,
        ),
      ],
    );
  }

  Widget getVerification() {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).push(
          new PageRouteBuilder(
            pageBuilder: (
              BuildContext context,
              _,
              __,
            ) {
              return OTPVerification();
            },
            transitionsBuilder: (
              _,
              Animation<double> animation,
              __,
              Widget child,
            ) {
              return new FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 13,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              5,
            ),
          ),
          color: Colors.white,
        ),
        child: Text(
          'Get Verification Code',
          style: TextStyle(
            fontSize: 20,
            color: Color(
              0xffef8573,
            ),
            fontWeight: FontWeight.bold,
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
            "ENTER YOUR PHONE NUMBER",
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
