import 'package:coderrb_clock/base.dart';
import 'package:flutter/material.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Clock',
      home: new Base(),
      debugShowCheckedModeBanner: false,
    );
  }
}



