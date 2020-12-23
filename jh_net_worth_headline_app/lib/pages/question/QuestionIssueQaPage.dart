
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'QuestionCommentsManagementPage.dart';
import 'QuestionOpenDegreePage.dart';
import 'QuestionPushScopePage.dart';
import 'QuestionQaTypePage.dart';


class IssueQa extends StatefulWidget {
  @override
  _IssueQaState createState() => _IssueQaState();
}

class _IssueQaState extends State<IssueQa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('发问答', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset('assets/images/question/fabu/fanhui.png', width: 24),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/question/fabu/yulan.png', width: 24),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/question/fabu/fabu.png', width: 24),
          )
        ],
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '标题',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: <Widget>[
                    Text('正文'),
                    SizedBox(
                      width: 30,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/question/fabu/tupian.png',
                        width: 16,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/question/fabu/zimu.png',
                          width: 16),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/question/fabu/lianjie.png',
                          width: 16),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/question/fabu/xiangji.png',
                          width: 16),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10, right: 6),
                  height: 200,
                  color: Color.fromRGBO(245, 245, 245, 1),
                  child: TextField(
                    maxLines: 20000,
                    maxLength: 20000,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10, top: 10),
                      border: InputBorder.none,
                      hintText: '请录入正文并排版',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 8,
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 4),
            child: Text(
              '备注',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(bottom: 10, right: 6),
            height: 160,
            color: Color.fromRGBO(245, 245, 245, 1),
            child: TextField(
              maxLines: 120,
              maxLength: 120,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, top: 10),
                border: InputBorder.none,
                hintText: '选填',
              ),
            ),
          ),
          Container(
            height: 8,
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          ListTiles(
            text1: '问答类型',
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return QaType();
              }));
            },
          ),
          ListTiles(
            text1: '截止时间',
            text2: '2020.06.30',
            ontap: () {},
          ),
          ListTiles(
            text1: '问答费用',
            text2: '已编辑',
            ontap: () {},
            ontap1: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      content: new SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 4),
                              child: Text(
                                "付费规则",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(24, 144, 255, 1)),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(0, 1 / 3),
                              //1为 StrutStyle 的 leading的值
                              child: Text(
                                "1、自发布日起至结束日止，所支付费用直接由平台托管，直至活动结束按规则处理；\n2、无人参与的活动视为失效，资金将退还用户账号；\n3、发布者在活动期间内若对参与者所提供之答案无确认操作，活动结束时则自动判定最早时间参与者为获奖者，按时间先后和获奖规则自动分配奖金。",
                                style: TextStyle(
                                  color: Color.fromRGBO(51, 51, 51, 1),
                                  fontSize: 14,
                                ),
                                strutStyle: StrutStyle(
                                    forceStrutHeight: true,
                                    height: 1,
                                    leading: 0.6),
                              ),
                            )
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: Text(
                            "确定",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  });
            },
            tupian: 'assets/images/question/fabu/zhujie.png',
          ),
          ListTiles(
            text1: '开放程度',
            text2: '所有人可见',
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_){
                return OpenDegree();
              }));
            },
          ),
          ListTiles(
            text1: '推送范围',
            text2: '不限',
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_){
                return PushScope();
              }));
            },
          ),
          ListTiles(
            text1: '评论管理',
            text2: '开放',
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_){
                return CommentsManagement();
              }));
            },
          ),
          ListTiles(
            text1: '私聊设置',
            text2: '开放',
            ontap: () {},
          ),
          ListTiles(
            text1: '发布承诺',
            text2: '已完成',
            ontap: () {},
          ),
          ListTiles(
            text1: '免审押金',
            text2: '已缴纳',
            ontap: () {},
          ),
        ],
      ),
    );
  }
}

class ListTiles extends StatelessWidget {
  final String text1;
  final String text2;
  final String tupian;
  final Function ontap;
  final Function ontap1;

  const ListTiles(
      {Key key, this.text1, this.text2, this.ontap, this.tupian, this.ontap1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    text1,
                    style: TextStyle(fontSize: 16),
                  ),
                  Spacer(),
                  text2 == null
                      ? SizedBox()
                      : Text(
                          text2,
                          style: TextStyle(color: Colors.grey),
                        ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                  )
                ],
              ),
              tupian == null
                  ? SizedBox()
                  : Positioned(
                      left: 64,
                      child: InkWell(
                        onTap: ontap1,
                        child: Image.asset(
                          tupian,
                          width: 12,
                        ),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
