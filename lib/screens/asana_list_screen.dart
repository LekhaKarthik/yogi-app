import 'package:flutter/material.dart';
import 'package:yogi/constants.dart';
import 'package:yogi/screens/loading_screen.dart';
import 'package:yogi/screens/profile_screen.dart';
import '../constants.dart';
import '../components/asana_button.dart';
import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'welcome_screen.dart';

class AsanaPage extends StatefulWidget {
  final CameraDescription camera;
  const AsanaPage({
    Key key,
    @required this.camera,
  }) : super(key: key);
  @override
  _AsanaPageState createState() => _AsanaPageState();
}

class _AsanaPageState extends State<AsanaPage> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              //Implement logout functionality
              _auth.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/welcome_screen', (Route<dynamic> route) => false);
            },
          ),
        ],
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
      body: GridView.count(
        primary: false,
        crossAxisCount: 2,
        children: <Widget>[
          AsanaButton(
            asanaNumber: 1,
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoadingScreen(
                      asanaNumber: 1,
                      camera: widget.camera,
                    ),
                  ),
                );
              });
            },
          ),
          AsanaButton(
            asanaNumber: 2,
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoadingScreen(
                      asanaNumber: 2,
                      camera: widget.camera,
                    ),
                  ),
                );
              });
            },
          ),
          AsanaButton(
            asanaNumber: 3,
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoadingScreen(
                      asanaNumber: 3,
                      camera: widget.camera,
                    ),
                  ),
                );
              });
            },
          ),
          AsanaButton(
            asanaNumber: 4,
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoadingScreen(
                      asanaNumber: 4,
                      camera: widget.camera,
                    ),
                  ),
                );
              });
            },
          ),
          AsanaButton(
            asanaNumber: 5,
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoadingScreen(
                      asanaNumber: 5,
                      camera: widget.camera,
                    ),
                  ),
                );
              });
            },
          ),
          AsanaButton(
            asanaNumber: 6,
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoadingScreen(
                      asanaNumber: 6,
                      camera: widget.camera,
                    ),
                  ),
                );
              });
            },
          ),
          AsanaButton(
            asanaNumber: 7,
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoadingScreen(
                      asanaNumber: 7,
                      camera: widget.camera,
                    ),
                  ),
                );
              });
            },
          ),
          AsanaButton(
            asanaNumber: 8,
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoadingScreen(
                      asanaNumber: 8,
                      camera: widget.camera,
                    ),
                  ),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
