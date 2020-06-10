import 'package:flutter/material.dart';
import 'package:yogi/screens/asana_list_page.dart';

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
      ),
      home: AsanaPage(),
    );
  }
}
