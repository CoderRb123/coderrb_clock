import 'package:flutter/material.dart';

import 'clock_text.dart';

class ClockFace extends StatelessWidget {
  final DateTime dateTime;
  final ClockText clockText;
  final bool isDark;

  ClockFace({this.clockText = ClockText.arabic, this.dateTime, this.isDark});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: new Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: new Container(
          width: width,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: isDark ? Colors.transparent : Color(0xFFFFFFFF),
            border: Border.all(
                color: isDark ? Colors.white : Colors.transparent,
                width: height > 375 ? 3 : 1.5),
            boxShadow: isDark
                ? []
                : [
                    new BoxShadow(
                      offset: new Offset(0.0, 5.0),
                      blurRadius: 0.0,
                      color: Color(0xFFFFFFFF).withOpacity(0.2),
                    ),
                    BoxShadow(
                        offset: new Offset(0.0, 5.0),
                        blurRadius: 20.0,
                        color: Color(0xFF232020),
                        spreadRadius: -15)
                  ],
          ),
        ),
      ),
    );
  }
}
