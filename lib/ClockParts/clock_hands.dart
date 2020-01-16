import 'package:flutter/material.dart';

import './hand_hour.dart';
import './hand_minute.dart';
import './hand_second.dart';

class ClockHands extends StatelessWidget {
  final DateTime dateTime;
  final bool isDark;
  final bool showHourHandleHeartShape;

  ClockHands(
      {this.dateTime, this.showHourHandleHeartShape = false, this.isDark});

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: 1.0,
      child: new Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new CustomPaint(
              painter: new HourHandPainter(
                  hours: dateTime.hour,
                  minutes: dateTime.minute,
                  isDark: isDark),
            ),
            new CustomPaint(
              painter: new MinuteHandPainter(
                  minutes: dateTime.minute,
                  seconds: dateTime.second,
                  isdark: isDark),
            ),
            new CustomPaint(
              painter: new SecondHandPainter(seconds: dateTime.second),
            ),
          ],
        ),
      ),
    );
  }
}
