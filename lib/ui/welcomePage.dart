import 'package:flutter/material.dart';
import 'package:intouch/ui/signUpPage.dart';
import 'package:intouch/ui/loginPage.dart';
import 'dart:math';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
              signInButton(),
              signUpButton(),
              divider(),
              signInWith(
                Colors.red,
                Colors.redAccent,
                "G",
                "Sign in with Google",
              ),
              signInWith(
                Colors.indigo,
                Colors.indigoAccent,
                "f",
                "Continue with Facebook",
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
              Icons.group,
              size: min(
                _media.width / 2,
                _media.height / 2,
              ),
              color: Colors.black87,
            ),
          ),
          Text(
            "WELCOME TO IN-TOUCH!",
            style: TextStyle(
              letterSpacing: 4,
              fontWeight: FontWeight.bold,
              fontSize: 23,
              color: Colors.black87,
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget signInButton() {
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
              return new LoginPage();
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
          'Login',
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

  Widget signUpButton() {
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
              return new SignUpPage();
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
        padding: EdgeInsets.symmetric(
          vertical: 13,
        ),
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              5,
            ),
          ),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: Text(
          'Register',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget divider() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text(
            'or',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
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
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: logo,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      5,
                    ),
                    topLeft: Radius.circular(
                      5,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  logoChar,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: accent,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(
                      5,
                    ),
                    topRight: Radius.circular(
                      5,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
