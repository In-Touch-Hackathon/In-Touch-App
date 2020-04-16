import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intouch/constants.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(
      context,
    ).size;

    return Scaffold(
      body: Container(
        child: Center(
          child: new ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            children: [
              header(),
              changeTheme(),
              disableButton(),
              logOutButton(),
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
          SizedBox(
            height: 20,
          ),
          Center(
            child: Icon(
              Icons.person,
              size: min(
                _media.width / 2,
                _media.height / 2,
              ),
            ),
          ),
          Text(
            'FROSTRIXZ',
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 4,
              fontWeight: FontWeight.bold,
              fontSize: _media.width / 18,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'frostrixz@gmail.com',
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 2,
              fontSize: _media.width / 24,
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget changeTheme() {
    return Container(
      width: MediaQuery.of(
        context,
      ).size.width,
      padding: EdgeInsets.symmetric(
        vertical: 15,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 20,
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
            Colors.blueGrey[300],
            Colors.blueGrey
          ],
        ),
      ),
      child: InkWell(
        onTap: () {
          DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);
        },
        child: Text(
          'Change Theme',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget disableButton() {
    return Container(
      width: MediaQuery.of(
        context,
      ).size.width,
      padding: EdgeInsets.symmetric(
        vertical: 15,
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
            Colors.redAccent[100],
            Colors.red[400],
          ],
        ),
      ),
      child: InkWell(
        child: Text(
          'Disable Account',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget logOutButton() {
    return Container(
      width: MediaQuery.of(
        context,
      ).size.width,
      padding: EdgeInsets.symmetric(
        vertical: 15,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 20,
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
            Constants.secondaryColor,
            Constants.mainColor,
          ],
        ),
      ),
      child: InkWell(
        child: Text(
          'Logout',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
