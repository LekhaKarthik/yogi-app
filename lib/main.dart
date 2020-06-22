import 'package:flutter/material.dart';
import 'package:yogi/screens/asana_list_screen.dart';
import 'package:camera/camera.dart';
import 'package:yogi/screens/camera_screen.dart';
import 'package:yogi/screens/profile_screen.dart';
import 'package:yogi/screens/setTime_screen.dart';
import 'package:yogi/screens/timer_page.dart';
import 'package:yogi/screens/welcome_screen.dart';
import 'package:yogi/screens/login_screen.dart';
import 'package:yogi/screens/register_screen.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras[0];

  runApp(
    Asanas(
      camera: firstCamera,
    ),
  );
}

class Asanas extends StatelessWidget {
  final CameraDescription camera;
  const Asanas({
    Key key,
    @required this.camera,
  }) : super(key: key);
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
      home: new WelcomePage(
        camera: camera,
      ),
      routes: <String, WidgetBuilder>{
        '/welcome_screen': (BuildContext context) => new WelcomePage(
              camera: camera,
            ),
        '/login_screen': (BuildContext context) => new LoginPage(
              camera: camera,
            ),
        '/registration_screen': (BuildContext context) => new RegistrationPage(
              camera: camera,
            ),
        '/profile_screen': (BuildContext context) => new ProfilePage(),
        '/asanaPage': (BuildContext context) => new AsanaPage(
              camera: camera,
            ),
        '/setTimePage': (BuildContext context) => new SetTimePage(
              asanaNumber: 0,
              camera: camera,
            ),
        '/takePictureScreen': (BuildContext context) => new TakePictureScreen(
              camera: camera,
              selectedLevel: selectedLevel,
              timeNeeded: 0,
            ),
        '/timerPage': (BuildContext context) => new TimerPage()
      },
    );
  }
}
