import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String Title;
  final bool isdark;

  const CustomText({Key key, this.Title, this.isdark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Text(
            '14 FEb',
            style: TextStyle(
              fontSize: 100,
              color: Colors.transparent,
              shadows: [
                BoxShadow(
                  offset: new Offset(0.0, 5.0),
                  blurRadius: 0.0,
                  color: isdark ? Color(0xFF182228) : Color(0XFFe6eefb),
                ),
                BoxShadow(
                    offset: new Offset(0.0, 5.0),
                    blurRadius: 10.0,
                    color:
                    isdark? Color(0xFF1d292f) : Color(0xFFe6eefb),
                    spreadRadius: -15)
              ],
            ),
          ),
        ),
        Container(
          child: Text(
            '14 FEb',
            style: TextStyle(
              fontSize: 95,
              color: Color(0xFFfed989),
            ),
          ),
        )
      ],
    );
  }
}
