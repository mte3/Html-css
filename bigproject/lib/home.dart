import 'package:bigproject/capital_treatment.dart';
import 'package:flutter/material.dart';

import 'discount_price.dart';
import 'my_library_serial/library_serial.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('导航页'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return DiscountPrice();
              }));
            },
            child: Text('批量字数折扣价'),
          ),
          FlatButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return MyLibrarySerial();
              }));
            },
            child: Text('我的文库'),
          ),
          FlatButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return CapitalTreatment();
              }));
            },
            child: Text('竞猜性质-公益类-资金处理'),
          ),
        ],
      ),
    );
  }
}
