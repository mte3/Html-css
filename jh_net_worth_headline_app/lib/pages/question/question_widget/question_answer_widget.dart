import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///回答模块封装
///创建人：华佑

class QuestionAnswerWidget extends StatefulWidget {
  @override
  _QuestionAnswerWidgetState createState() => _QuestionAnswerWidgetState();
}

class _QuestionAnswerWidgetState extends State<QuestionAnswerWidget> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Text(
                '我要回答',
                style: TextStyle(
                  color: Color(0xff262626),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 24),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/icons/question/icon_picture.png',
                  width: 16,
                  color: Color(0xff595959),
                ),
              ),
              SizedBox(width: 24),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/icons/question/icon_typeface.png',
                  width: 16,
                  color: Color(0xff595959),
                ),
              ),
              SizedBox(width: 24),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/icons/question/icon_link.png',
                  width: 16,
                  color: Color(0xff595959),
                ),
              ),
              SizedBox(width: 24),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/icons/question/icon_camera.png',
                  width: 16,
                  color: Color(0xff595959),
                ),
              ),
            ],
          ),
          SizedBox(height: 22),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _controller,
                  maxLines: 7,
                  maxLengthEnforced: true,
                  style: TextStyle(color: Color(0xffA6A6A6), fontSize: 14),
                  inputFormatters: [LengthLimitingTextInputFormatter(120)],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xfff5f5f5),
                    hintText: '请输入正文',
                    hintStyle:
                        TextStyle(color: Color(0xffA6A6A6), fontSize: 14),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10, right: 16),
                  color: Color(0xfff5f5f5),
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${_controller.text.length}/120',
                    style: TextStyle(color: Color(0xffa6a6a6), fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),

          //提交按钮
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 19, vertical: 6),
                  child: Text(
                    '提交',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: _controller.text.length > 0
                        ? Color(0xff1890FF)
                        : Color(0xffbfbfbf),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
