import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'vote-option-page.dart';
import 'vote_rules_page.dart';

//发布投票
class ReleaseVotePage extends StatefulWidget {
  @override
  _ReleaseVotePageState createState() => _ReleaseVotePageState();
}

class _ReleaseVotePageState extends State<ReleaseVotePage> {
  TextEditingController _titleC = TextEditingController();
  TextEditingController _contentC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("发投票"),
        actions: <Widget>[
          InkWell(
            onTap: () {},
            child: Image.asset("assets/images/vote/Preview.png"),
          ),
          InkWell(
            onTap: () {},
            child: Image.asset("assets/images/vote/release.png"),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          //标题
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Text(
                  "标题",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Expanded(
                  child: Container(
                    child: TextField(
                      controller: _titleC,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          //正文
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 9.0),
            child: Row(
              children: <Widget>[
                Text(
                  "正文",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 32.0,
                      right: 24.0,
                    ),
                    child: Image.asset("assets/images/vote/image.png"),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(right: 24.0),
                    child: Image.asset("assets/images/vote/text.png"),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(right: 24.0),
                    child: Image.asset("assets/images/vote/link.png"),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(right: 24.0),
                    child: Image.asset("assets/images/vote/camera.png"),
                  ),
                ),
              ],
            ),
          ),
          //文本域
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(
              bottom: 8.0,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(8.0),
              color: Color(0xffF5F5F5),
              child: TextField(
                controller: _contentC,
                maxLines: 5,
                maxLength: 20000,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "请录入正文并排版",
                  hintStyle: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xffA6A6A6),
                  ),
                  contentPadding: EdgeInsets.all(0.0),
                ),
              ),
            ),
          ),
          //投票设置
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(bottom: 92.0),
            child: Column(
              children: dataList.map((item) {
                return rowItemWidget(
                  title: item['title'],
                  prompt: item['prompt'],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget rowItemWidget({
    String title,
    String prompt,
  }) {
    return InkWell(
      onTap: () {
        switch (title) {
          case "投票类型":
            break;
          case "投票选项":
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return VoteOptionPage();
            }));
            break;
          case "投票规则":
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return VoteRulesPage();
            }));
            break;
          case "截止时间":
            print("截止时间");
            break;
          case "投票费用":
            break;
          case "开放程度":
            break;
          case "推送范围":
            break;
          case "评论管理":
            break;
          case "私聊设置":
            break;
          case "发布承诺":
            break;
          case "免审押金":
            break;
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 13.0,
        ),
        child: Row(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Spacer(),
            Text(
              prompt,
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xffBFBFBF),
              ),
            ),
            SizedBox(width: 6.0),
            Image.asset("assets/images/vote/enter.png"),
          ],
        ),
      ),
    );
  }

  List<Map> dataList = [
    {"title": "投票类型", "prompt": ""},
    {"title": "投票选项", "prompt": "已设置"},
    {"title": "投票规则", "prompt": "按事件结果判定"},
    {"title": "截止时间", "prompt": "2020.06.30"},
    {"title": "投票费用", "prompt": "已编辑"},
    {"title": "开放程度", "prompt": "所有人可见"},
    {"title": "推送范围", "prompt": "不限"},
    {"title": "评论管理", "prompt": "开放"},
    {"title": "私聊设置", "prompt": "开放"},
    {"title": "发布承诺", "prompt": "已完成"},
    {"title": "免审押金", "prompt": "已缴纳"},
  ];
}
