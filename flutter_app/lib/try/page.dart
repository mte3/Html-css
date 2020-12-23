import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/try/actions.dart';


import 'notice.dart';

class DemoPageTwo extends StatefulWidget {
  @override
  _DemoPageTwoState createState() => _DemoPageTwoState();
}

class _DemoPageTwoState extends State<DemoPageTwo> {
  String backData = "BackData";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Notice.send(JHActions.demo(),backData);
          Navigator.pop(context);
        },
        child: Center(
          child: Text("带着数据返回"),
        ),
      ),
    );
  }
}
