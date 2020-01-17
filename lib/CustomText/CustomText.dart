import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String Title;
  final double textsize;
  final bool isdark;

  const CustomText({Key key, this.Title, this.isdark, this.textsize = 20.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 8),
          child: Text(
            Title,
            style: GoogleFonts.rubik(
              fontSize: textsize,
              fontWeight: FontWeight.w600,
              color: isdark?Colors.transparent:Color(0xFFfed989),
            ),
          ),
        ),
        Container(
          child: Text(
            Title,
            style: GoogleFonts.rubik(
              fontSize: textsize,
              fontWeight: FontWeight.w600,
              color: isdark?Colors.white:Color(0xFF200d23),
            ),
          ),
        )
      ],
    );
  }
}
