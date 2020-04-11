import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';

class LoginModel {
  String email;
  String password;
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _model = new LoginModel();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String Function(String) _emailValidator = (String value) {
    RegExp regex = new RegExp(r"^.+@.+\..+$");
    if (!regex.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  };

  String Function(String) _passwordValidator = (String value) {
    if (value.length < 6) {
      return 'The password needs to be at least 6 characters long';
    }
    return null;
  };

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      _auth
          .signInWithEmailAndPassword(
              email: _model.email, password: _model.password)
          .then((result) => result.user)
          .then((user) => print('${user.displayName} logged in!'))
          .catchError((onError) => print('An error occurred: $onError'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: new ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 40.0, right: 40),
            children: <Widget>[
              header(),
              entryField("Email",
                  onSaved: (value) => _model.email = value,
                  validator: _emailValidator),
              entryField("Password",
                  onSaved: (value) => _model.password = value,
                  validator: _passwordValidator,
                  isPassword: true),
              login(),
            ],
          ),
        ),
      ),
    );
  }

  Widget entryField(String title,
      {void Function(String) onSaved,
      String Function(String) validator,
      bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              onSaved: (value) {
                onSaved(value);
              },
              validator: validator ?? (value) => null,
              obscureText: isPassword,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.black12,
                filled: true,
              ))
        ],
      ),
    );
  }

  Widget login() {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
          vertical: 15,
        ),
        margin: EdgeInsets.symmetric(
          vertical: 30,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Theme.of(context).focusColor,
                blurRadius: 15,
                spreadRadius: 1,
              )
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xfff3a183),
                  Color(0xffec6f66),
                ])),
        child: InkWell(
          onTap: _submitForm,
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ));
  }

  Widget header() {
    final _media = MediaQuery.of(context).size;

    return Center(
      child: Column(
        children: <Widget>[
          Center(
            child: Icon(
              Icons.group,
              size: min(_media.width / 2, _media.height / 2),
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
