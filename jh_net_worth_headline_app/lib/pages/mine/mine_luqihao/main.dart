import 'package:flutter/material.dart';
import 'bond_page.dart';
import 'bond_Paid_page.dart';
import 'grabage.dart';
import 'Administration_page.dart';
import 'records_page2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:Bond(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('ceceec'),
            onPressed:(){

            }
        ),
      ),
    );
  }
}

final ThemeData mDefaultTheme = ThemeData(
  primaryColor:Colors.redAccent,
);
