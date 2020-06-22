import 'package:flutter/material.dart';
import 'asana_list.dart';

AsanaList asanaList = AsanaList();

bool showTimerPage = false;

bool repeat = true;

String picName;

enum Level {
  easy,
  medium,
  hard,
}

int time1 = 1;

Level selectedLevel;

String url = 'http://127.0.0.1:5000';
var data;

const kAppTitleStyle = TextStyle(
  fontFamily: 'Pacifico',
  fontWeight: FontWeight.bold,
  fontSize: 25.0,
  color: Colors.white,
);

const kAsanaNameStyle = TextStyle(
  fontSize: 17.0,
  fontWeight: FontWeight.bold,
  color: Color(0xFF900c3f),
);

const kAppHeadingStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: Color(0xFF900c3f),
);

const kTimerTitleStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  color: Color(0xFF900c3f),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a Value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF900c3f), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF900c3f), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  filled: true,
  fillColor: Color(0xFFe8e4e1),
  focusColor: Colors.white,
  hoverColor: Colors.white,
);
