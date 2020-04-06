import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xfff3a183),
                    Color(0xffec6f66),
                  ]
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              signInButton(),
              signUpButton(),
              divider(),
              signInWith(Colors.red, Colors.redAccent, "G", "Sign in with Google"),
              signInWith(Colors.indigo, Colors.indigoAccent, "f", "Continue with Facebook"),
            ],
          ),
        ),
      ),
    );
  }

  Widget signInButton() {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white,
        ),
        child: Text(
          'Login',
          style: TextStyle(
              fontSize: 20,
              color: Color(0xffef8573),
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  Widget signUpButton() {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 13),
        margin: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          'Register',
          style: TextStyle(
              fontSize: 20, color: Colors.white,
              fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }

  Widget divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or',
              style: TextStyle(
                  color: Colors.white70,
              )
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget signInWith(Color logo, Color accent, String logoChar, String text) {
    return InkWell(
      child: Container(
        height: 54,
        margin: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: logo,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text(logoChar,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600
                    )
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: accent,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text(text,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}