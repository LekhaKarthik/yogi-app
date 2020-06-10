import 'package:flutter/material.dart';
import '../constants.dart';

Color fillcolor = Color(0xFFffcac2);

class AsanaButton extends StatelessWidget {
  AsanaButton({this.asanaName, this.asanaNumber, this.onPressed});
  final String asanaName;
  final int asanaNumber;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: RawMaterialButton(
        onPressed: onPressed,
        elevation: 6.0,
        highlightColor: Color(0xFFfc9d9d),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        fillColor: fillcolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/asana$asanaNumber.png',
              height: 160.0,
            ),
            Text(
              asanaName,
              style: kAsanaNameStyle,
            ),
          ],
        ),
      ),
    );
  }
}
