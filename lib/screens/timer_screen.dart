import 'package:flutter/material.dart';
import 'package:yogi/constants.dart';

int timeNeeded = 30;

class TimerPage1 extends StatefulWidget {
  @override
  _TimerPage1State createState() => _TimerPage1State();
}

class _TimerPage1State extends State<TimerPage1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                timeNeeded.toString(),
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF900c3f),
                ),
              ),
              Text(
                's',
                style: kAppHeadingStyle,
              ),
            ],
          ),
        ),
        Slider(
          value: timeNeeded.toDouble(),
          min: 15.0,
          max: 90.0,
          onChanged: (double newValue) {
            setState(() {
              timeNeeded = newValue.round();
            });
          },
        ),
      ],
    );
  }
}

class TimerPage extends StatelessWidget {
  TimerPage({this.asanaNumber});
  final int asanaNumber;
  @override
  Widget build(BuildContext context) {
    String asanaName = asanaList.getAsanaName(asanaNumber - 1);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'yogi',
          style: kAppTitleStyle,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              alignment: Alignment.center,
              child: Text(
                'Get Ready to do $asanaName',
                style: kAppHeadingStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Color(0xFFffcac2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(16.0),
                      child: Text(
                        'Time Needed to get into $asanaName Pose',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF900c3f),
                        ),
                      ),
                    ),
                    TimerPage1(),
                  ],
                )),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              child: Container(
                margin: EdgeInsets.only(top: 15.0),
                color: Color(0xFF900c3f),
                child: Center(
                  child: Text(
                    'START',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
