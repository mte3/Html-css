

import 'package:bigproject/my_library_serial/add_serial_widget.dart';
import 'package:bigproject/widget/appbar.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'my_library_serial/add_serial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
