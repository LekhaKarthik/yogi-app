import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:yogi/components/rounded_button.dart';
import 'package:camera/camera.dart';
import 'package:yogi/screens/login_screen.dart';
import 'package:yogi/screens/register_screen.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({@required this.camera});
  final CameraDescription camera;
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(begin: Color(0xFFfc9d9d), end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: animation.value,
      backgroundColor: Color(0xFFfc9d9d),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      height: 60.0,
                      child: Image.asset('images/logo3.png'),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'yogi',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                      color: Color(0xFF900c3f),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.white,
              text1: 'Log In',
              textColor: Color(0xFF900c3f),
              onPressed: () {
                //Go to registration screen.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(
                      camera: widget.camera,
                    ),
                  ),
                );
              },
            ),
            RoundedButton(
              color: Color(0xFF900c3f),
              text1: 'Register',
              textColor: Colors.white,
              onPressed: () {
                //Go to registration screen.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrationPage(
                      camera: widget.camera,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
