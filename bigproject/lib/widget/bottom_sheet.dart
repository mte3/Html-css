import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///封装底部按钮（新建、添加）
class BottomAdd extends StatelessWidget {
  final Function onTaps;
  final String title;
  final String img;

  const BottomAdd({Key key, this.onTaps, this.title,this.img ='assets/images/drawable-xxxhdpi/add.png' }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 48,
      child: InkWell(
        onTap:onTaps,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              img,
              width: 16,
            ),
            Text(
              title,
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}

