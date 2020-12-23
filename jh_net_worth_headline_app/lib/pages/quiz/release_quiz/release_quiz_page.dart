import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:networth/components/appbar_widget/navigation_bar.dart';
import 'package:networth/components/zefyr/edit_rich_view.dart';
import 'package:networth/pages/quiz/release_quiz/quiz_style_page.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';

///发布竞猜
///
///
class ReleaseQuizPage extends StatefulWidget {
  @override
  _ReleaseQuizPageState createState() => _ReleaseQuizPageState();
}

class _ReleaseQuizPageState extends State<ReleaseQuizPage> {
  static Delta getDelta() =>
      Delta.fromJson(json.decode(r'[{"insert":"\n"}]') as List);
  final ZefyrController _questionC =
      ZefyrController(NotusDocument.fromDelta(getDelta()));

  List _menuList = [
    {"title": "竞猜类型", "label": "竞猜类型", "value": "", "page": ""},
    {"title": "竞猜性质", "label": "竞猜性质", "value": "", "page": ""},
    {"title": "结果判定", "label": "结果判定", "value": "", "page": ""},
    {"title": "竞猜规则", "label": "竞猜规则", "value": "", "page": ""},
    {"title": "截止时间", "label": "截止时间", "value": "", "page": ""},
    {"title": "竞猜费用", "label": "竞猜费用", "value": "", "page": ""},
    {"title": "开放程度", "label": "开放程度", "value": "", "page": ""},
    {"title": "推送范围", "label": "推送范围", "value": "", "page": ""},
    {"title": "评论管理", "label": "评论管理", "value": "", "page": ""},
    {"title": "私聊设置", "label": "私聊设置", "value": "", "page": ""},
    {"title": "发布承诺", "label": "发布承诺", "value": "", "page": ""},
    {"title": "免审押金", "label": "免审押金", "value": "", "page": ""},
  ];

  @override
  Widget build(BuildContext context) {
    TextStyle _style = TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);
    return Scaffold(
      appBar: NavigationBar(
        title: '发竞猜',
        rightDMActions: <Widget>[
          InkWell(
            child: Image.asset('assets/images/ic_preview.png', width: 24),
            onTap: () {},
          ),
          SizedBox(width: 16),
          InkWell(
            child: Image.asset('assets/images/ic_post.png', width: 24),
            onTap: () {},
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            // 标题
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '标题',
                    hintStyle: _style),
              ),
            ),
            // 正文
            Container(
              padding: EdgeInsets.symmetric(vertical: 9, horizontal: 16),
              child: Row(
                children: <Widget>[
                  Text('正文', style: _style),
                  SizedBox(width: 32),
                  Row(
                    children: [
                      'ic_select_picture',
                      'ic_select_font',
                      'ic_select_link',
                      'ic_take_photo'
                    ]
                        .map(
                          (e) => GestureDetector(
                            onTap: () => handle(e),
                            child: Padding(
                              padding: EdgeInsets.only(right: 24),
                              child: Image.asset(
                                'assets/images/$e.png',
                                width: 16,
                                height: 16,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            // 富文本编辑框
            Container(
              height: 388,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: EditRichView(
                contentC: _questionC,
                hintText: '请录入正文并排版',
              ), //
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 8),
            //   height: 388,
            //   color: Colors.grey[200],
            //   child: TextField(
            //     maxLines: 6,
            //     maxLength: 20000,
            //     decoration: InputDecoration(
            //         border: InputBorder.none,
            //         hintText: '请录入正文并排版',
            //         hintStyle: TextStyle(
            //           color: Color(0xffa6a6a6),
            //         )),
            //   ),
            // ),
          ]
            ..add(Container(
              margin: EdgeInsets.only(top: 8),
              height: 8,
              color: Colors.grey.withOpacity(0.2),
            ))
            // 列表选项
            ..addAll(
              _menuList.map((item) {
                return ListItem(
                  title: item["title"],
                  value: item["value"],
                  function: () {
                    action(item["title"]);
                  },
                );
              }).toList(),
            ),
        ),
      ),
    );
  }

  action(label) {
    switch (label) {
      case '竞猜类型':
        Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => QuizStylePage()))
            .then((value) {
          {
            if (value != null && value != '') {
              setState(() {
                _menuList[0]['value'] = value;
              });
            }
          }
        });
        break;
      case '竞猜性质':
        // routePush(QuizNaturepage());
        break;
      case '结果判定':
        // routePush(ResultJudgmentPage());
        break;
      case '竞猜规则':
        break;
      case '截止时间':
        break;
      case '竞猜费用':
        // routePush(QuizFeePage());
        break;
      case '开放程度':
        break;
      case '推送范围':
        break;
      case '评论管理':
        break;
      case '私聊设置':
        break;
      case '发布承诺':
        break;
      case '免审押金':
        break;
    }
  }

  handle(name) {
    switch (name) {
      case 'ic_select_picture':
        print(name);
        break;
      case 'ic_select_font':
        print(name);
        break;
      case 'ic_select_link':
        print(name);
        break;
      case 'ic_take_photo':
        print(name);
        break;
    }
  }
}

// 列表选项item
class ListItem extends StatelessWidget {
  final String title;
  final Function function;
  final String value;

  const ListItem({
    Key key,
    this.title,
    this.function,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.only(top: 13, bottom: 13, left: 16, right: 12),
        child: Row(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            Text(
              value ?? '',
              style: TextStyle(fontSize: 14, color: Color(0xffBFBFBF)),
            ),
            SizedBox(width: 3),
            Icon(
              Icons.chevron_right,
              color: Colors.grey[500],
            )
          ],
        ),
      ),
    );
  }
}
