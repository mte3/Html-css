import 'package:flutter/material.dart';
import 'package:flutterapp/hw/first.dart';
import 'package:flutterapp/hw/forth.dart';
import 'package:flutterapp/hw/second.dart';
import 'package:flutterapp/try/page.dart';
import 'hw/third.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DemoPageTwo(),
    );
  }
}
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: Lis(),
      ),
    );
  }
  List<Widget> Lis() => List.generate(lis.length, (index){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return lis[index];
        }));
      },
      child: Container(
        margin: EdgeInsets.all(16),
        width: 120,
        height: 60,
        color: Colors.orange,
        alignment: Alignment.center,
        child: Text('第${index+1}个页面'),
      ),
    );
  });
  List lis = [
    First(),
    Second(),
    Third(),
    Forth()
  ];

}
