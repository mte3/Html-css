import 'package:flutter/material.dart';

///底部导航栏封装
///创建人：华佑

class QuestionBottomBarWidget extends StatefulWidget {
  final String url;
  final String text;
  final GestureTapCallback onTap;

  const QuestionBottomBarWidget({
    Key key,
    this.url,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  _QuestionBottomBarWidgetState createState() =>
      _QuestionBottomBarWidgetState();
}

class _QuestionBottomBarWidgetState extends State<QuestionBottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: <Widget>[
          Image.asset(widget.url, width: 16, height: 16),
          SizedBox(height: 5),
          Text(
            widget.text,
            style: TextStyle(color: Color(0xff595959), fontSize: 10),
          ),
        ],
      ),
    );
  }
}
