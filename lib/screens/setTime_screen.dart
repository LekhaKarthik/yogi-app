import 'package:flutter/material.dart';
import 'package:yogi/constants.dart';
import 'camera_screen.dart';
import 'package:camera/camera.dart';

int timeNeeded = 1;

Level selectedLevel = Level.easy;

class SetTimePage1 extends StatefulWidget {
  @override
  _SetTimePage1State createState() => _SetTimePage1State();
}

class _SetTimePage1State extends State<SetTimePage1> {
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
              time1 = newValue.round();
            });
          },
        ),
      ],
    );
  }
}

class SetTimePage2 extends StatefulWidget {
  final CameraDescription camera;
  SetTimePage2({this.camera});
  @override
  _SetTimePage2State createState() => _SetTimePage2State();
}

class _SetTimePage2State extends State<SetTimePage2> {
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
                selectedLevel: selectedLevel,
                timeNeeded: timeNeeded,
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

class SetTimePage extends StatefulWidget {
  SetTimePage({@required this.asanaNumber, @required this.camera});
  final int asanaNumber;
  final CameraDescription camera;
  @override
  _SetTimePageState createState() => _SetTimePageState();
}

class _SetTimePageState extends State<SetTimePage> {
  @override
  Widget build(BuildContext context) {
    String asanaName = asanaList.getAsanaName(widget.asanaNumber - 1);
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
            flex: 8,
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Color(0xFFffcac2),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
//                    margin: EdgeInsets.all(16.0),
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'How long do you wanna stay in $asanaName Pose',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF900c3f),
                      ),
                    ),
                  ),
                  SetTimePage1(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20.0),
                    margin: EdgeInsets.all(16.0),
                    child: Text(
                      'Select the accuracy level you want to attain in $asanaName Pose',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF900c3f),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RawMaterialButton(
                        fillColor: selectedLevel == Level.easy
                            ? Color(0xFF900c3f)
                            : Color(0xFF252a34),
                        child: Text(
                          'Easy',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        elevation: 6.0,
//                        highlightColor: Color(0xFFfc9d9d),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: () {
                          setState(() {
                            selectedLevel = Level.easy;
                          });
                        },
                      ),
                      RawMaterialButton(
                        fillColor: selectedLevel == Level.medium
                            ? Color(0xFF900c3f)
                            : Color(0xFF252a34),
                        child: Text(
                          'Medium',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        elevation: 6.0,
//                        highlightColor: Color(0xFFfc9d9d),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: () {
                          setState(() {
                            selectedLevel = Level.medium;
                          });
                        },
                      ),
                      RawMaterialButton(
                        fillColor: selectedLevel == Level.hard
                            ? Color(0xFF900c3f)
                            : Color(0xFF252a34),
                        child: Text(
                          'Hard',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        elevation: 6.0,
//                        highlightColor: Color(0xFFfc9d9d),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: () {
                          setState(() {
                            selectedLevel = Level.hard;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SetTimePage2(camera: widget.camera),
          ),
        ],
      ),
    );
  }
}
