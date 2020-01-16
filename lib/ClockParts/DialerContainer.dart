import 'package:flutter/material.dart';

import 'clock_dial_painter.dart';
import 'clock_text.dart';

class DialerContainer extends StatelessWidget {
  final DateTime dateTime;
  final ClockText clockText;
  final bool isDark;

  DialerContainer(
      {this.clockText = ClockText.arabic, this.dateTime, this.isDark});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: new Padding(
        padding: EdgeInsets.all(width * 0.025),
        child: new AspectRatio(
          aspectRatio: 1,
          child: new Container(
            width: width,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
            child: new Container(
              margin: EdgeInsets.only(bottom: height * 0.04),
              width: width * 0.7,
              height: height * 0.7,
              child: new CustomPaint(
                painter: new ClockDialPainter(
                  clockText: clockText,
                  isDark: isDark,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
