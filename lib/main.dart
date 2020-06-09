import 'package:flutter/material.dart';

void main() {
  runApp(Asanas());
}

class Asanas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFffd1bd),
        primaryColorDark: Color(0xFFffb0cd),
        primaryColorLight: Color(0xFFffffff),
        accentColor: Color(0xFFc2f0fc),
        dividerColor: Color(0xFFBDBDBD),
      ),
      home: Scaffold(
//        backgroundColor: Colors.cyan.shade100,
        appBar: AppBar(
//          backgroundColor: Colors.teal,
          title: Text(
            'yogi',
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
        ),
        body: GridView.count(
          primary: false,
//          padding: const EdgeInsets.all(3),
//          crossAxisSpacing: 10,
//          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
//            Center(
//              child: Padding(
//                padding: const EdgeInsets.fromLTRB(16.0, 3.0, 3.0, 3.0),
//                child: Text(
//                  'Pick Your Asana!',
//                  style: TextStyle(
//                    fontSize: 35.0,
//                    fontWeight: FontWeight.w700,
////                    fontFamily: 'Pacifico',
//                    color: Colors.teal[900],
//                  ),
//                ),
//              ),
//            ),
            FlatButton(
              onPressed: () {
                print('Trikonasana');
              },
              child: Image.asset(
                'images/asana1.png',
//                width: 170.0,
              ),
            ),
            FlatButton(
              onPressed: () {
                print('Vrukshasana');
              },
              child: Image.asset(
                'images/asana2.jpeg',
//                width: 170.0,
              ),
            ),
            FlatButton(
              onPressed: () {
                print('Virabhadrasana');
              },
              child: Image.asset(
                'images/asana3.png',
//                width: 170.0,
              ),
            ),
            FlatButton(
              onPressed: () {
                print('Paravakonasana');
              },
              child: Image.asset(
                'images/asana4.png',
//                width: 170.0,
              ),
            ),
            FlatButton(
              onPressed: () {
                print('Ardha chandrasana');
              },
              child: Image.asset(
                'images/asana5.png',
//                width: 170.0,
              ),
            ),
            FlatButton(
              onPressed: () {
                print('Tadasana');
              },
              child: Image.asset(
                'images/asana6.png',
//                width: 170.0,
              ),
            ),
            FlatButton(
              onPressed: () {
                print('Natrajasana');
              },
              child: Image.asset(
                'images/asana7.png',
//                width: 170.0,
              ),
            ),
            FlatButton(
              onPressed: () {
                print('Anjaneasana');
              },
              child: Image.asset(
                'images/asana8.png',
//                width: 170.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
