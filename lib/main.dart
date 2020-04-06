import 'package:flutter/material.dart';
import 'package:intouch/ui/welcome.dart';

void main() => runApp(InTouchApp());

class InTouchApp extends StatefulWidget {
  @override
  InTouchAppState createState() {
    return new InTouchAppState();
  }
}

class InTouchAppState extends State<InTouchApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'In-Touch',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}