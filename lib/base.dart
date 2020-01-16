import 'dart:async';

import 'package:coderrb_clock/CustomText/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'ClockParts/clock.dart';

class Base extends StatefulWidget {
  static DateTime date = DateTime.now();

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  Timer _timer;
  DateTime dateTime;
  String onlyDate;
  bool isNight = false;

  @override
  void initState() {
    setFullscreen();
    super.initState();
    dateTime = new DateTime.now();
    this._timer = new Timer.periodic(Duration(seconds: 1), setTime);
    settingDateToScreen();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: isNight ? Colors.black : Colors.white,
      body: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Clock(
                    isDark: isNight ? true : false,
                    dateTime: dateTime,
                  ),
                ),
                width: double.infinity,
              ),
              onDoubleTap: () {
                if (isNight) {
                  isNight = false;
                  setState(() {});
                } else {
                  isNight = true;
                  setState(() {});
                }
              },
            ),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Center(
                  child: CustomText(
                    isdark: isNight,
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Setting up Timer
  void setTime(Timer timer) {
    setState(() {
      dateTime = new DateTime.now();
    });
  }

  // Full Screen And Orientation Lock
  void setFullscreen() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  // Getting Day And Messages
  void settingDateToScreen() {
    DateTime now = DateTime.now();
    String formatedDate = DateFormat('dd-MM-yyyy').format(now);
    setState(() {
      onlyDate = formatedDate;
    });
  }

  // Disposing Timer
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
