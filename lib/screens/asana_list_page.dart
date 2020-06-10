import 'package:flutter/material.dart';
import 'package:yogi/constants.dart';
import '../constants.dart';
import '../components/asana_button.dart';

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
            asanaName: 'Trikonasana',
            asanaNumber: 1,
            onPressed: () {
              setState(() {
                print('Button Clicked!!');
              });
            },
          ),
          AsanaButton(
            asanaName: 'Vrukshasana',
            asanaNumber: 2,
            onPressed: () {
              setState(() {
                print('Button Clicked!!');
              });
            },
          ),
          AsanaButton(
            asanaName: 'Virabhadrasana',
            asanaNumber: 3,
            onPressed: () {
              setState(() {
                print('Button Clicked!!');
              });
            },
          ),
          AsanaButton(
            asanaName: 'Paravakonasana',
            asanaNumber: 4,
            onPressed: () {
              setState(() {
                print('Button Clicked!!');
              });
            },
          ),
          AsanaButton(
            asanaName: 'Ardha chandrasana',
            asanaNumber: 5,
            onPressed: () {
              setState(() {
                print('Button Clicked!!');
              });
            },
          ),
          AsanaButton(
            asanaName: 'Tadasana',
            asanaNumber: 6,
            onPressed: () {
              setState(() {
                print('Button Clicked!!');
              });
            },
          ),
          AsanaButton(
            asanaName: 'Natrajasana',
            asanaNumber: 7,
            onPressed: () {
              setState(() {
                print('Button Clicked!!');
              });
            },
          ),
          AsanaButton(
            asanaName: 'Anjaneasana',
            asanaNumber: 8,
            onPressed: () {
              setState(() {
                print('Button Clicked!!');
              });
            },
          ),
        ],
      ),
    );
  }
}
