import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'ClockParts/clock.dart';
import 'CustomText/CustomText.dart';

class Base extends StatefulWidget {
  static DateTime date = DateTime.now();

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  Timer _timer;
  DateTime dateTime;
  String onlyDate;
  String onlyDay;
  String onlyMonth;
  String onlyYear;
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
    double width = MediaQuery.of(context).size.width;
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
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.date_range,
                            color: isNight ? Colors.white : Color(0xFF200d23),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: CustomText(
                              isdark: isNight,
                              Title: onlyYear,
                              textsize: 30,
                            ),
                          ),
                        ],
                      )),
                ),
                Expanded(
                  child: Center(
                    child: CustomText(
                      isdark: isNight,
                      Title: onlyDate + " " + onlyMonth,
                      textsize: 75,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.view_day,
                              color: isNight ? Colors.white : Color(0xFF200d23),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: CustomText(
                                isdark: isNight,
                                Title: onlyDay,
                                textsize: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.ac_unit,
                              color: isNight ? Colors.white : Color(0xFF200d23),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: CustomText(
                                isdark: isNight,
                                Title: "22°C",
                                textsize: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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

    if (dateTime.minute < 7 || dateTime.hour > 17) {
      if (!isNight) {
        setState(() {
          isNight = true;
        });
      }
      settingDateToScreen();
    } else {
      if (isNight) {
        setState(() {
          isNight = false;
        });
      }
    }
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
    String formatedDate = DateFormat('dd').format(now);
    String month = DateFormat('MMM').format(now);
    String day = DateFormat('EEEE').format(dateTime);
    String year = DateFormat('yyyy').format(dateTime);
    setState(() {
      onlyDate = formatedDate;
      onlyDay = day;
      onlyMonth = month;
      onlyYear = year;
    });
  }

  // Disposing Timer
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
