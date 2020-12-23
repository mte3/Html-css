import 'package:flutter/material.dart';

///详情模块封装
///创建人：华佑

class QuestionDetailsWidget extends StatefulWidget {
  final String name;
  final String money;

  const QuestionDetailsWidget({
    Key key,
    this.name = '李清照',
    this.money = '20.20',
  }) : super(key: key);

  @override
  _QuestionDetailsWidgetState createState() => _QuestionDetailsWidgetState();
}

class _QuestionDetailsWidgetState extends State<QuestionDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '详情',
            style: TextStyle(
              color: Color(0xff262626),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '详情',
                style: TextStyle(
                  color: Color(0xff595959),
                  fontSize: 14,
                ),
              ),
              Text(
                widget?.name ?? 'null',
                style: TextStyle(
                  color: Color(0xff1890FF),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '报酬总额',
                style: TextStyle(
                  color: Color(0xff595959),
                  fontSize: 14,
                ),
              ),
              Text(
                '￥${widget?.money ?? '0.00'}',
                style: TextStyle(
                  color: Color(0xff1890FF),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
