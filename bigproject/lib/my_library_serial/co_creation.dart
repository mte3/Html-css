

import 'package:bigproject/widget/appbar.dart';
import 'package:flutter/material.dart';

///是否联合创作页面
class CoCreation extends StatefulWidget {
  @override
  _CoCreationState createState() => _CoCreationState();
}
bool coCreation = false;
class _CoCreationState extends State<CoCreation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: MainAppBar(
        title: '联合创作',
      ),
      body: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                coCreation = !coCreation;
              });
            },
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              height: 48,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('开启联合创作'),
                  Image.asset(
                    coCreation
                        ? 'assets/images/drawable-xxxhdpi/open.png'
                        : 'assets/images/drawable-xxxhdpi/shut.png',
                    width: 24,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
