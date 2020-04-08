import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Align(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 40
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10),
                  header(),
                  entryField("Username"),
                  entryField("Email"),
                  entryField("Password", isPassword: true),
                  entryField("Phone Number"),
                  register(),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 10
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.black12,
                  filled: true
              )
          )
        ],
      ),
    );
  }

  Widget register() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
          vertical: 30
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xfff3a183),
                Color(0xffec6f66),
              ]
          )
      ),
      child: Text(
        'Register Now',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget header() {
    final _media = MediaQuery.of(context).size;

    return Center(
      child: Column(
        children: <Widget>[
          Center(
            child: Icon(
              Icons.group,
              size: _media.width / 2,
            ),
          ),
          Text(
            "SIGN-UP TO IN-TOUCH!",
            style: TextStyle(
              letterSpacing: 4,
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
          SizedBox(
              height: 40
          ),
        ],
      ),
    );
  }
}