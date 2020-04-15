import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';

import 'shared/components.dart';

class LoginModel {
  String email;
  String password;
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _model = new LoginModel();
  final FirebaseAuth _auth = FirebaseAuth.instance;


  void _submitForm() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      var message;
      try {
        var result = await _auth.signInWithEmailAndPassword(email: _model.email, password: _model.password);

        print((await result.user.getIdToken()).token);
        message = 'Logged in';
      } on PlatformException catch (e) {
        switch (e.code) {
          case 'ERROR_USER_NOT_FOUND':
          case 'ERROR_WRONG_PASSWORD':
            message = 'Invalid email or password';
            break;

          case 'ERROR_INVALID_EMAIL':
            message = 'Invalid email';
            break;

          case 'ERROR_TOO_MANY_REQUESTS':
            message = 'There have been too many failed sign in attempts, please try again later';
            break;

          case 'ERROR_USER_DISABLED':
            message = 'Your account is locked';
            break;

          default:
            message = 'An unexpected error has occurred';
            break;
        }
      }

      _scaffoldKey.currentState.showSnackBar(
          new SnackBar(content: new Text(message))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Form(
          key: _formKey,
          child: new ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              left: 40.0,
              right: 40,
            ),
            children: <Widget>[
              header(),
              entryField("Email",
                  onSaved: (value) => _model.email = value.trim()),
              entryField("Password",
                  onSaved: (value) => _model.password = value,
                  isPassword: true),
              login(),
            ],
          ),
        ),
      ),
    );
  }

  Widget login() {
    return Container(
      width: MediaQuery.of(
        context,
      ).size.width,
      padding: EdgeInsets.symmetric(
        vertical: 15,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 30,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            5,
          ),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Theme.of(
              context,
            ).focusColor,
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
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
      child: InkWell(
        onTap: _submitForm,
        child: Text(
          'Login',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
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
              Icons.group,
              size: min(
                _media.width / 2,
                _media.height / 2,
              ),
            ),
          ),
          Text(
            "LOG-IN TO IN-TOUCH!",
            style: TextStyle(
              letterSpacing: 4,
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
