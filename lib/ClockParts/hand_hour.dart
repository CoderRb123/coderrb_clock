import 'dart:math';

import 'package:flutter/material.dart';

class HourHandPainter extends CustomPainter {
  final bool isDark;
  final Paint hourHandPaint;
  int hours;
  int minutes;

  HourHandPainter({this.isDark, this.hours, this.minutes})
      : hourHandPaint = new Paint() {
//    hourHandPaint.color = Color(0xFF200d23);
    hourHandPaint.color = isDark?Colors.white:Color(0xFF200d23);
    hourHandPaint.style = PaintingStyle.stroke;
    hourHandPaint.strokeWidth = 6.0;
    hourHandPaint.strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    // To draw hour hand
    canvas.save();

    canvas.translate(radius, radius);

    //checks if hour is greater than 12 before calculating rotation
    canvas.rotate(this.hours >= 12
        ? 2 * pi * ((this.hours - 12) / 12 + (this.minutes / 720))
        : 2 * pi * ((this.hours / 12) + (this.minutes / 720)));

    Path path = new Path();

    //hour hand stem
    path.moveTo(0.0, -radius * 0.5);
    path.lineTo(0.0, radius * 0.1);

    canvas.drawPath(path, hourHandPaint);
    canvas.drawShadow(path, Colors.black, 2.0, false);

    canvas.restore();
  }

  @override
  bool shouldRepaint(HourHandPainter oldDelegate) {
    return true;
  }
}
