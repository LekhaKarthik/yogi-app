import 'package:flutter/material.dart';
import 'package:yogi/constants.dart';
import '../constants.dart';
import '../components/asana_button.dart';
import 'timer_screen.dart';
import 'package:camera/camera.dart';

class AsanaPage extends StatefulWidget {
  final CameraDescription camera;
  const AsanaPage({
    Key key,
    @required this.camera,
  }) : super(key: key);
  @override
  _AsanaPageState createState() => _AsanaPageState();
}

class _AsanaPageState extends State<AsanaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'yogi',
          style: kAppTitleStyle,
        ),
      ),
      body: GridView.count(
        primary: false,
        crossAxisCount: 2,
//        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          AsanaButton(
            asanaNumber: 1,
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TimerPage(
                      asanaNumber: 1,
                      camera: widget.camera,
                    ),
                  ),
                );
              });
            },
          ),
          AsanaButton(
            asanaNumber: 2,
            onPressed: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TimerPage(
                              asanaNumber: 2,
                              camera: widget.camera,
                            )));
              });
            },
          ),
          AsanaButton(
            asanaNumber: 3,
            onPressed: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TimerPage(
                              asanaNumber: 3,
                              camera: widget.camera,
                            )));
              });
            },
          ),
          AsanaButton(
            asanaNumber: 4,
            onPressed: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TimerPage(
                              asanaNumber: 4,
                              camera: widget.camera,
                            )));
              });
            },
          ),
          AsanaButton(
            asanaNumber: 5,
            onPressed: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TimerPage(
                              asanaNumber: 5,
                              camera: widget.camera,
                            )));
              });
            },
          ),
          AsanaButton(
            asanaNumber: 6,
            onPressed: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TimerPage(
                              asanaNumber: 6,
                              camera: widget.camera,
                            )));
              });
            },
          ),
          AsanaButton(
            asanaNumber: 7,
            onPressed: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TimerPage(
                              asanaNumber: 7,
                              camera: widget.camera,
                            )));
              });
            },
          ),
          AsanaButton(
            asanaNumber: 8,
            onPressed: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TimerPage(
                              asanaNumber: 8,
                              camera: widget.camera,
                            )));
              });
            },
          ),
        ],
      ),
    );
  }
}
