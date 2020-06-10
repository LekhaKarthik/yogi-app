import 'package:flutter/material.dart';
import 'package:yogi/constants.dart';
import '../constants.dart';
import '../components/asana_button.dart';
import 'timer_screen.dart';

class AsanaPage extends StatefulWidget {
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
                            )));
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
                            )));
              });
            },
          ),
        ],
      ),
    );
  }
}
