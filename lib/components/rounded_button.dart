import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.color, this.text1, this.textColor, this.onPressed});
  final Color color;
  final String text1;
  final Color textColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text1,
            style: TextStyle(
              color: textColor,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
