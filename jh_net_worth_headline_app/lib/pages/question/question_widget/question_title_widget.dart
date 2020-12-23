import 'package:flutter/material.dart';

///问答详情标题封装
///创建人：华佑

class QuestionTitleWidget extends StatefulWidget {
  final String title;
  final String name;
  final String startTime;
  final String endDate;
  final String endTime;

  const QuestionTitleWidget({
    Key key,
    this.title = '为什么有些人喝完牛奶会拉肚子？',
    this.name = '李清照',
    this.startTime = '2020-03-28',
    this.endDate = '2020-03-29',
    this.endTime = '23:59',
  }) : super(key: key);

  @override
  _QuestionTitleWidgetState createState() => _QuestionTitleWidgetState();
}

class _QuestionTitleWidgetState extends State<QuestionTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget?.title ?? 'null',
            style: TextStyle(
              color: Color(0xff212121),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 9),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 3,
                      horizontal: 8,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '回答',
                      style: TextStyle(
                        color: Color(0xff7EBFFC),
                        fontSize: 10,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xff7EBFFC)),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    widget?.name ?? 'null',
                    style: TextStyle(
                      color: Color(0xff595959),
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    widget?.startTime ?? 'null',
                    style: TextStyle(
                      color: Color(0xff8C8C8C),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              Text(
                '截止日期：${widget?.endDate ?? 'null'} ${widget?.endTime ?? 'null'}？',
                style: TextStyle(
                  color: Color(0xff8C8C8C),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
