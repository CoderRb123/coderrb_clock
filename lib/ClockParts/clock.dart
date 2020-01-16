import 'package:coderrb_clock/ClockParts/DialerContainer.dart';
import 'package:flutter/material.dart';
import './clock_hands.dart';
import 'clock_face.dart';
import 'clock_text.dart';

typedef TimeProducer = DateTime Function();

class Clock extends StatefulWidget {
  final ClockText clockText;
  final bool isDark;
  final DateTime dateTime;
  final TimeProducer getCurrentTime;

  Clock({
    this.clockText = ClockText.arabic,
    this.getCurrentTime = getSystemTime,
    this.isDark = false,
    this.dateTime,
  });

  static DateTime getSystemTime() {
    return new DateTime.now();
  }

  @override
  State<StatefulWidget> createState() {
    return _Clock();
  }
}

class _Clock extends State<Clock> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return buildClockCircle(context);
  }

  Container buildClockCircle(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return new Container(
      width: double.infinity,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        border: Border.all(
            color: widget.isDark ? Colors.white : Colors.transparent,
            width: height > 375 ? 3 : 1.5),
        boxShadow: widget.isDark
            ? []
            : [
                 BoxShadow(
                  offset: new Offset(0.0, 5.0),
                  blurRadius: 0.0,
                  color: widget.isDark ? Color(0xFF182228) : Color(0XFFe6eefb),
                ),
                BoxShadow(
                    offset: new Offset(0.0, 5.0),
                    blurRadius: 10.0,
                    color:
                        widget.isDark ? Color(0xFF1d292f) : Color(0xFFe6eefb),
                    spreadRadius: -15)
              ],
      ),
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new DialerContainer(
              clockText: widget.clockText,
              dateTime: widget.dateTime,
              isDark: widget.isDark,
            ),
            new ClockFace(
              clockText: widget.clockText,
              dateTime: widget.dateTime,
              isDark: widget.isDark,
            ),
            new ClockHands(
              dateTime: widget.dateTime,
              isDark: widget.isDark,
            ),
          ],
        ),
      ),
    );
  }
}
