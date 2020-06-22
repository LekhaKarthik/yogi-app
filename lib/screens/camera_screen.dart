import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yogi/constants.dart';
import 'dart:async';
import 'package:path/path.dart' show join;
import 'package:yogi/api.dart';
import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:audioplayers/audio_cache.dart';
import 'package:yogi/screens/timer_page.dart';

class TakePictureScreen extends StatefulWidget {
  TakePictureScreen(
      {@required this.camera,
      @required this.selectedLevel,
      @required this.timeNeeded});
  final CameraDescription camera;
  final Level selectedLevel;
  final int timeNeeded;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  File _image;
  final picker = ImagePicker();
  double accuracy;
  void click() async {
    // Take the Picture in a try / catch block. If anything goes wrong,
    // catch the error.
    try {
      // Ensure that the camera is initialized.
      await _initializeControllerFuture;

      // Construct the path where the image should be saved using the
      // pattern package.
      String tempDir = (await getTemporaryDirectory()).path;
      print(tempDir);
      picName = DateTime.now().toString();
      final path1 = join(
        // Store the picture in the temp directory.
        // Find the temp directory using the `path_provider` plugin.
        (await getTemporaryDirectory()).path,
        '$picName.png',
      );
//      final pickedFile = await picker.getImage(source: ImageSource.values);

      // Attempt to take a picture and log where it's been saved.
      await _controller.takePicture(path1);

      final pickedFile = File(path1);

      setState(() {
        _image = File(pickedFile.path);
      });

      final fileName = _image.path.split('/').last;
      final StorageReference storageReference =
          await FirebaseStorage.instance.ref().child(fileName);
      final StorageUploadTask storageUploadTask =
          await storageReference.putFile(_image);
//      final StreamSubscription<StorageTaskEvent> streamSubscription =
//          storageUploadTask.events.listen((event) {
//        print('EVENT ${event.type}');
//      });
      await storageUploadTask.onComplete;

      url = 'http://127.0.0.1:5000';
      url += '/compareImage?imagefile=$picName.png';
      data = await getData(url);
      Duration threeSeconds = Duration(seconds: 10);
      double error;
      repeat = true;
      await Future.delayed(threeSeconds, () {
        var decodedData = jsonDecode(data);
        error = decodedData['avgerr'];
        print(error);
      });
      if (widget.selectedLevel == Level.easy) {
        accuracy = 25.0;
      } else if (widget.selectedLevel == Level.medium) {
        accuracy = 15.0;
      } else if (widget.selectedLevel == Level.hard) {
        accuracy = 9.0;
      }

      if (error > accuracy) {
        repeat = true;
      } else {
        repeat = false;
      }
      if (repeat) {
        url = 'http://127.0.0.1:5000/geterror';
        data = await getData(url);
        await Future.delayed(threeSeconds, () {
          var decodedDataMsg = jsonDecode(data);
          String msg = decodedDataMsg['msg'];
          print(msg);
          void playSound(String numb) {
            final player = AudioCache();
            player.play('inst$numb.mp3');
          }

          playSound(msg);
        });
      }
    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }

  // Add two variables to the state class to store the CameraController and
  // the Future.
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();

    Future noIdea() async {
      repeat = true;
      do {
        Duration fiveSeconds = Duration(seconds: 10);
        await Future.delayed(fiveSeconds, () {
          click();
        });
      } while (repeat);
      setState(() {
        showTimerPage = true;
//        Navigator.of(context).pushReplacementNamed('/timerPage');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TimerPage(
              timeNeeded: widget.timeNeeded,
            ),
          ),
        );
      });
    }

    noIdea();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fill this out in the next steps.
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Image.asset(
                'images/logo3.png',
                fit: BoxFit.contain,
                height: 32,
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 16.0, left: 8.0),
              child: Text(
                'yogi',
                style: kAppTitleStyle,
              ),
            ),
          ],
        ),
      ),
      // Wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner
      // until the controller has finished initializing.
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                'Get to the pose',
                style: kAppHeadingStyle,
              ),
            ),
          ),
          Expanded(
            flex: 14,
            child: Container(
              margin: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFFffcac2),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the Future is complete, display the preview.
                    return CameraPreview(_controller);
                  } else {
                    // Otherwise, display a loading indicator.
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
