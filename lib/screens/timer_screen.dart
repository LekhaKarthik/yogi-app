import 'package:flutter/material.dart';
import 'package:yogi/constants.dart';
import 'camera_screen.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

int timeNeeded = 1;

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
                'min',
                style: kAppHeadingStyle,
              ),
            ],
          ),
        ),
        Slider(
          value: timeNeeded.toDouble(),
          min: 1.0,
          max: 5.0,
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

class TimerPage2 extends StatefulWidget {
  final CameraDescription camera;
  TimerPage2({this.camera});
  @override
  _TimerPage2State createState() => _TimerPage2State();
}

class _TimerPage2State extends State<TimerPage2> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TakePictureScreen(
                camera: widget.camera,
              ),
            ),
          );
        });
      },
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
    );
  }
}

class TimerPage extends StatelessWidget {
  TimerPage({this.asanaNumber, @required this.camera});
  final int asanaNumber;
  final CameraDescription camera;
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
                        'How long do you wanna stay in $asanaName Pose',
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
            child: TimerPage2(camera: camera),
          ),
        ],
      ),
    );
  }
}
