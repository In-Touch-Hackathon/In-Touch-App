import 'package:flutter/material.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

class CallHistoryScreen extends StatefulWidget {
  @override
  _CallHistoryScreenState createState() => _CallHistoryScreenState();
}

class _CallHistoryScreenState extends State<CallHistoryScreen> {
  List<Call> calls = <Call>[];
  List<MaterialColor> callColors = <MaterialColor>[];
  final random = Random();

  @override
  void initState() {
    createCallingColors();
    createDummyData();
    super.initState();
  }

  void createCallingColors() {
    callColors.add(Colors.orange);
    callColors.add(Colors.purple);
    callColors.add(Colors.blue);
    callColors.add(Colors.deepOrange);
    callColors.add(Colors.lightGreen);
    callColors.add(Colors.lightBlue);
  }

  void createDummyData() {
    calls.add(
      Call(from: "963808326", callTime: "April 16, 2020 at 12:00:00 AM"),
    );
    calls.add(
      Call(from: "963808326", callTime: "April 16, 2020 at 12:00:00 AM"),
    );
    calls.add(
      Call(from: "963808326", callTime: "April 16, 2020 at 12:00:00 AM"),
    );
    calls.add(
      Call(from: "963808326", callTime: "April 16, 2020 at 12:00:00 AM"),
    );
    calls.add(
      Call(from: "963808326", callTime: "April 16, 2020 at 12:00:00 AM"),
    );
    calls.add(
      Call(from: "963808326", callTime: "April 16, 2020 at 12:00:00 AM"),
    );
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    children.add(header());

    for (var i = 0; i < calls.length; i++) {
      children.add(buildCall(i));
    }

    return Scaffold(
      body: Container(
        child: Center(
          child: new ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20,
            ),
            children: children,
          ),
        ),
      ),
    );
  }

  Widget buildCall(int index) {
    return InkWell(
      onTap: () => launch("tel://" + calls[index].from),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListTile(
              title: Text(
                '${calls[index].from}',
              ),
              subtitle: Text(
                '${calls[index].callTime}',
              ),
            ),
          ),
          Icon(
            Icons.add_call,
          ),
          SizedBox(
            width: 10,
          ),
        ],
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
            height: 60,
          ),
          Center(
            child: Icon(
              Icons.call,
              size: min(
                _media.width / 3,
                _media.height / 3,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'CALL HISTORY',
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 4,
              fontWeight: FontWeight.bold,
              fontSize: _media.width / 18,
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

class Call {
  String from;
  String callTime;
  MaterialColor backgroundColor;

  Call({this.from, this.callTime, this.backgroundColor});
}
