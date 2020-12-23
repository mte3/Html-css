import 'package:flutter/material.dart';

///问题描述封装
///创建人：华佑

class QuestionDescribeWidget extends StatefulWidget {
  final int state;
  final String startDate;
  final String startTime;
  final String content;

  const QuestionDescribeWidget({
    Key key,
    this.state,
    this.startDate = '2020-05-30',
    this.startTime = '00:00',
    this.content,
  }) : super(key: key);

  @override
  _QuestionDescribeWidgetState createState() => _QuestionDescribeWidgetState();
}

class _QuestionDescribeWidgetState extends State<QuestionDescribeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '问答',
                  style: TextStyle(
                    color: Color(0xff262626),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                widget.state == -1
                    ? Text(
                        '本活动将于${widget?.startDate ?? 'null'} ${widget?.startTime ?? 'null'}开始',
                        style: TextStyle(
                          color: Color(0xff7EBFFC),
                          fontSize: 10,
                        ),
                      )
                    : widget.state == 0
                        ? TextColorStateWidget(
                            text: '正在进行', state: widget.state)
                        : TextColorStateWidget(
                            text: '已结束', state: widget.state),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              widget?.content ?? 'null',
              /*'我每次喝牛奶肚子都不舒服，这是为什么？总不能从此就不喝牛奶了吧，有大神能给个解释吗？',*/
              style: TextStyle(color: Color(0xff212121), fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class TextColorStateWidget extends StatefulWidget {
  final String text;
  final int state;

  const TextColorStateWidget({Key key, this.text, this.state})
      : super(key: key);

  @override
  _TextColorStateWidgetState createState() => _TextColorStateWidgetState();
}

class _TextColorStateWidgetState extends State<TextColorStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      alignment: Alignment.center,
      child: Text(
        widget.text,
        style: TextStyle(
          color: widget.state == 0
              ? Color(0xff7EBFFC)
              : widget.state == 1
                  ? Color(0xff8C8C8C)
                  : Color(0xff7EBFFC),
          fontSize: 10,
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: widget.state == 0
              ? Color(0xff7EBFFC)
              : widget.state == 1
                  ? Color(0xff8C8C8C)
                  : Color(0xff7EBFFC),
        ),
      ),
    );
  }
}
