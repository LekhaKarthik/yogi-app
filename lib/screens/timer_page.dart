import 'package:flutter/material.dart';
import 'package:yogi/api.dart';
import 'package:yogi/constants.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class TimerPage extends StatefulWidget {
  TimerPage({this.timeNeeded});
  final int timeNeeded;
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  Timer _timer;
  int _start = time1 * 60;
  bool showHomeButton = false;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            showHomeButton = true;
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    startTimer();
  }

  Widget goHomeButton() {
    if (showHomeButton == true) {
      url = 'http://127.0.0.1:5000';
      url +=
          '/updateActivity?userid=${loggedInUser.email}&minutes=${widget.timeNeeded}';
      data = getData(url);
      print(data);
    }
    return showHomeButton == true
        ? FloatingActionButton(
            backgroundColor: Color(0xFF900c3f),
            child: Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/asanaPage', (Route<dynamic> route) => false);
            },
          )
        : Container();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Image.asset(
                'images/logo3.png',
                fit: BoxFit.contain,
                height: 32,
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 16.0, left: 8.0),
              child: Text(
                'yogi',
                style: kAppTitleStyle,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Color(0xFFffcac2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Expanded(
                child: Text(
                  'Hold Tight!!',
                  style: kAppHeadingStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  "$_start",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF900c3f),
                  ),
                ),
              ),
            ),
            Expanded(
              child: goHomeButton(),
            ),
          ],
        ),
      ),
    );
  }
}
