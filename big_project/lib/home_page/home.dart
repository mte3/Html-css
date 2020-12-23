import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'consultDetail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ConsultDetail();
              }));
            },
            child: Text('点击跳转'),
          )
        ],
      ),
    );
  }

}

