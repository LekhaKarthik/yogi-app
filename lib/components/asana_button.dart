import 'package:flutter/material.dart';
import '../constants.dart';

Color fillColor = Color(0xFFffcac2);

class AsanaButton extends StatelessWidget {
  AsanaButton({this.asanaNumber, this.onPressed});
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
        fillColor: fillColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/asana$asanaNumber.png',
              height: 160.0,
            ),
            Text(
              asanaList.getAsanaName(asanaNumber - 1),
              style: kAsanaNameStyle,
            ),
          ],
        ),
      ),
    );
  }
}
