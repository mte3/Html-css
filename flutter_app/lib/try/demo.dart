import 'package:flutter/material.dart';
import 'package:flutterapp/try/actions.dart';
import 'package:flutterapp/try/notice.dart';
import 'package:flutterapp/try/page.dart';

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  String demoText;

  @override
  void initState() {
    super.initState();
    demoText = "demoText";
    Notice.addListener(JHActions.demo(), (data) {
      setState(() {
        demoText = data;
      });
    });
  }
  @override
  void dispose() {
    Notice.removeListenerByEvent(JHActions.demo());

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DemoPageTwo(),
            )),
        child: Center(
          child: Text(demoText),
        ),
      ),
    );
  }
}
