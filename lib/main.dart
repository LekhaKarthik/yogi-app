import 'package:flutter/material.dart';
import 'package:yogi/screens/asana_list_screen.dart';

void main() {
  runApp(Asanas());
}

class Asanas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF900c3f),
        primaryColorDark: Color(0xFF252a34),
        primaryColorLight: Color(0xFFfc9d9d),
        accentColor: Color(0xFF252a34), //ff2e63
        dividerColor: Color(0xFFccafaf),
        sliderTheme: SliderTheme.of(context).copyWith(
          inactiveTrackColor: Color(0xFF8D8E98),
          activeTrackColor: Colors.white,
          thumbColor: Color(0xFF900c3f),
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 15.0,
          ),
          overlayShape: RoundSliderOverlayShape(
            overlayRadius: 30.0,
          ),
          overlayColor: Color(0x29EB1555),
        ),
      ),
      home: AsanaPage(),
    );
  }
}
