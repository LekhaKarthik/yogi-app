import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:camera/camera.dart';
import 'package:yogi/constants.dart';
import 'package:yogi/api.dart';
import 'package:yogi/screens/setTime_screen.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({@required this.asanaNumber, @required this.camera});
  final int asanaNumber;
  final CameraDescription camera;
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void setAsanaName(String asanaName) async {
    url = 'http://127.0.0.1:5000';
    url += '/getValue?asana=$asanaName';
    data = await getData(url);
    print(data);
    setState(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SetTimePage(
            camera: widget.camera,
            asanaNumber: widget.asanaNumber,
          ),
        ),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String asanaName = asanaList.getAsanaName(widget.asanaNumber - 1);
    setAsanaName(asanaName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfc9d9d),
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
