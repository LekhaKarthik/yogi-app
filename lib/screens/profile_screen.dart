import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:yogi/constants.dart';
import 'package:yogi/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:yogi/components/rounded_button.dart';

bool showSpinner = false;
String newWeight;
String newMonth;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final nameHolder1 = TextEditingController();
  final nameHolder2 = TextEditingController();
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  var decodedData;
  List<Map<String, String>> userData = [];
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        setState(() {
          showSpinner = true;
        });
        loggedInUser = user;
        print(loggedInUser.email);
        url = 'http://127.0.0.1:5000';
        url += '/userReport?userid=${loggedInUser.email}';
        data = await getData(url);
        decodedData = jsonDecode(data);
        setState(() {
          for (var d in decodedData) {
            userData.add({
              "Date": d['Date'].toString(),
              "Duration": d['Duration'],
              "Calories": d['Calories']
            });
          }
          showSpinner = false;
        });
        print(userData);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
                Navigator.pop(context);
              }),
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
      backgroundColor: Color(0xFFffcac2),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: ListView(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: 170.0,
                    child: TextField(
                      controller: nameHolder1,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        newMonth = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Month Number',
                      ),
                    ),
                  ),
                  Container(
                    width: 170.0,
                    child: RoundedButton(
                      color: Color(0xFF900c3f),
                      text1: 'Get Report',
                      textColor: Colors.white,
                      onPressed: () async {
                        url = 'http://127.0.0.1:5000';
                        url +=
                            '/prevUserReport?userid=${loggedInUser.email}&&month=$newMonth';
                        data = await getData(url);
                        decodedData = jsonDecode(data);
                        setState(() {
                          userData = [];
                          for (var d in decodedData) {
                            userData.add({
                              "Date": d['Date'].toString(),
                              "Duration": d['Duration'],
                              "Calories": d['Calories']
                            });
                          }
                          print(data);
                          nameHolder1.clear();
                        });
                      },
                    ),
                  ),
                ],
              ),
              Container(
                width: 170.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Color(0xFF900c3f),
                    borderRadius: BorderRadius.circular(30.0),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async {
                        url = 'http://127.0.0.1:5000';
                        url += '/userReport?userid=${loggedInUser.email}';
                        data = await getData(url);
                        data = await getData(url);
                        decodedData = jsonDecode(data);
                        setState(() {
                          userData = [];
                          for (var d in decodedData) {
                            userData.add({
                              "Date": d['Date'].toString(),
                              "Duration": d['Duration'],
                              "Calories": d['Calories']
                            });
                          }
                          print(data);
                          nameHolder1.clear();
                        });
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Current Month',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              DataTable(
                columns: [
                  DataColumn(
                    label: Text(
                      'Date',
                      style: kAppHeadingStyle,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Duration',
                      style: kAppHeadingStyle,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Calories',
                      style: kAppHeadingStyle,
                    ),
                  ),
                ],
                rows: userData
                    .map(
                      ((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text(
                                  element['Date'],
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(
                                  element['Duration'],
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(
                                  element['Calories'],
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    )
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: 170.0,
                    child: TextField(
                      controller: nameHolder2,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        newWeight = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'New Weight',
                      ),
                    ),
                  ),
                  Container(
                    width: 170.0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Material(
                        color: Color(0xFF900c3f),
                        borderRadius: BorderRadius.circular(30.0),
                        elevation: 5.0,
                        child: MaterialButton(
                          onPressed: () async {
                            url = 'http://127.0.0.1:5000';
                            url +=
                                '/UpdateWeight?userid=${loggedInUser.email}&weight=$newWeight';
                            data = await getData(url);
                            print(data);
                            nameHolder2.clear();
                          },
                          minWidth: 200.0,
                          height: 42.0,
                          child: Text(
                            'Update Weight',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 170.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Color(0xFF900c3f),
                    borderRadius: BorderRadius.circular(30.0),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async {
                        url = 'http://127.0.0.1:5000';
                        url += '/resetProgress?userid=${loggedInUser.email}';
                        data = await getData(url);
                        print(data);
                        nameHolder2.clear();
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Reset Progress',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
