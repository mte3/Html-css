import 'dart:ui';
import 'package:flutter/material.dart';

///评论模块封装
///创建人：华佑

class QuestionCommentWidget extends StatefulWidget {
  final bool sex;
  final String startDate;
  final String startTime;
  final String link;
  final bool reply;

  const QuestionCommentWidget({
    Key key,
    this.sex,
    this.startDate,
    this.startTime,
    this.link = '20',
    this.reply = true,
  }) : super(key: key);

  @override
  _QuestionCommentWidgetState createState() => _QuestionCommentWidgetState();
}

class _QuestionCommentWidgetState extends State<QuestionCommentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/icons/question/icon_photo.png',
              width: 35,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: <Widget>[
                    Text(
                      '苏东坡',
                      style: TextStyle(
                        color: Color(0xff262626),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    widget.sex
                        ? Image.asset(
                            'assets/icons/question/icon_male.png',
                            width: 9,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/icons/question/icon_women.png',
                            width: 9,
                            fit: BoxFit.cover,
                          ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  '${widget?.startDate ?? 'null'}    ${widget?.startTime ?? 'null'}',
                  style: TextStyle(
                    color: Color(0xff8c8c8c),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            Spacer(),

            //icon
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/icons/question/icon_comment.png',
                  width: 16,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 16),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: <Widget>[
                      Text(
                        widget?.link ?? 'null',
                        style: TextStyle(
                          color: Color(0xffbfbfbf),
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(width: 4),
                      Image.asset(
                        'assets/icons/question/icon_like.png',
                        width: 16,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Image.asset(
                  'assets/icons/question/icon_more.png',
                  width: 16,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.only(left: 43),
          child: Text(
            '哈哈哈哈哈哈哈哈哈',
            style: TextStyle(
              color: Color(0xff262626),
              fontSize: 12,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
        widget.reply == false
            ? Container()
            : Container(
                margin: EdgeInsets.only(left: 43),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 91,
                      child: RichText(
                        text: TextSpan(
                          text: '李清照 ：',
                          style: TextStyle(
                            color: Color(0xff262626),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊',
                              style: TextStyle(
                                color: Color(0xff262626),
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //作者回复
                    /*Container(
                      height: 24,
                      width: 56,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 5),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '作者回复',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff7EBFFC),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),*/
                  ],
                ),
                decoration: BoxDecoration(color: Color(0xfff5f5f5)),
              ),
      ],
    );
  }
}
