import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:networth/model/DetailsPublisherListItemModel.dart';

import 'QuestionDetailsAnswerDetailPage.dart';
import 'QuestionDetailsAnswerListPage.dart';
import 'question_widget/QuestionDetailsAnsweListItemWidget.dart';

///问答-详情-发布者页面
///创建人:李鸿杰
class QuestionDetailsPublisherPage extends StatefulWidget {
  @override
  _QuestionDetailsPublisherPageState createState() =>
      _QuestionDetailsPublisherPageState();
}

class _QuestionDetailsPublisherPageState
    extends State<QuestionDetailsPublisherPage> {
  //问题是否完结
  bool finish = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('问答', style: TextStyle(color: Colors.black)),
        leading: GestureDetector(
          onTap: () => Navigator.maybePop(context),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Image.asset(
              'assets/icons/question/icon_back.png',
              color: Color(0xff595959),
            ),
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/icons/question/icon_share.png',
              width: 24,
              color: Color(0xff595959),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: ListView(
        children: <Widget>[
          ///问题
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ///标题
                Text('为什么有些人喝完牛奶会拉肚子？'),
                SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff7EBFFC), width: 1),
                      ),
                      child: Text('问答',
                          style: questionTextStyle(color: Color(0xff7EBFFC))),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '李清照',
                      style: questionTextStyle(color: Color(0xff595959)),
                    ),
                    SizedBox(width: 8),

                    ///发布日期
                    Text(
                      '2020-03-28',
                      style: questionTextStyle(color: Color(0xff8C8C8C)),
                    ),
                    Spacer(),

                    ///截止日期
                    Text(
                      '截止日期: 2020-06-30 23 :59',
                      style: questionTextStyle(color: Color(0xff8C8C8C)),
                    ),
                  ],
                ),
                SizedBox(height: 23),

                ///问答活动开始时间
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("问题",
                        style: questionTextStyle(
                            color: Color(0xff212121),
                            size: 16,
                            weight: FontWeight.w700)),
                    finish
                        ? Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffff7ae0), width: 1)),
                            child: Text(
                              '已完结',
                              style:
                                  questionTextStyle(color: Color(0xffff7ae0)),
                            ),
                          )
                        : Text(
                            '本活动将于2020-05-30 00:00开始',
                            style: questionTextStyle(color: Color(0xff7EBFFC)),
                          ),
                  ],
                ),
                SizedBox(height: 17),
                Text('我每次喝牛奶肚子都不舒服，这是为什么？总不能从此就不喝牛奶了吧，有大神能给个解释吗？',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        questionTextStyle(color: Color(0xff212121), size: 14)),
                SizedBox(height: 18),
              ],
            ),
          ),

          Divider(thickness: 10, color: Color(0xffF5F5F5)),

          ///详情
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('详情',
                    style: questionTextStyle(
                        color: Color(0xff212121),
                        size: 16,
                        weight: FontWeight.w700)),

                SizedBox(height: 20),

                ///发布者
                Row(
                  children: <Widget>[
                    Text('发布者',
                        style: questionTextStyle(
                            color: Color(0xff595959), size: 14)),
                    Spacer(),
                    Text('李清照',
                        style: questionTextStyle(
                            color: Color(0xff1890FF), size: 14)),
                  ],
                ),

                SizedBox(height: 20),

                ///报酬总额
                Row(
                  children: <Widget>[
                    Text('报酬总额',
                        style: questionTextStyle(
                            color: Color(0xff595959), size: 14)),
                    Spacer(),
                    Text('￥20.00',
                        style: questionTextStyle(
                            color: Color(0xff1890FF), size: 14)),
                  ],
                ),

                SizedBox(height: 10),
              ],
            ),
          ),

          Divider(thickness: 10, color: Color(0xffF5F5F5)),

          ///答案列表
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: <Widget>[
                    ///点击跳转到答案啊列表页面
                    InkWell(
                        child: Text(
                          '答案列表',
                          style: questionTextStyle(
                              color: Color(0xff212121),
                              size: 16,
                              weight: FontWeight.w700),
                        ),
                        onTap: () => _navigateAnswerListPage(context)),
                    SizedBox(width: 24),

                    ///评论列表跳转

                    InkWell(
                      child: Text('评论列表',
                          style: questionTextStyle(
                              color: Color(0xffbfbfbf), size: 16)),
                    ),
                    Spacer(),
                    Text('50人参与',
                        style: questionTextStyle(
                            color: Color(0xffbfbfbf), size: 12)),
                    finish ? SizedBox() : SizedBox(width: 16),
                    finish
                        ? SizedBox()
                        : InkWell(
                            child: Image.asset('assets/icons/question/list.png',
                                width: 25),
                          ),
                  ],
                ),
              ),

              ///答案列表ListView
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    ///点击跳转到回答详细页
                    return InkWell(
                      child: QuestionDetailsAnswerListItemWidget(
                        adopted: finish,
                        data: list[index],
                      ),
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => QuestionDetailsAnswerDetailPage(
                                    data: list[index])))
                      },
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }

  void _navigateAnswerListPage(context) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (_) => QuestionDetailsAnswerListPage()));
    //如果选择了 发布答案 显示弹窗
    if (result) {
      setState(() {
        showDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '答案已公布',
                      style:
                          questionTextStyle(color: Color(0xff1890ff), size: 14),
                    ),
                    Icon(
                      Icons.panorama_fish_eye,
                      size: 16,
                      color: Color(0xffbfbfbf),
                    ),
                  ],
                ),
                content: Text(
                  '报酬已按比例分配给参与者',
                  style: questionTextStyle(color: Color(0xff8c8c8c), size: 12),
                ),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('返回首页',
                        style: questionTextStyle(
                            color: Color(0xff8c8c8c), size: 16)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text('确认',
                        style: questionTextStyle(
                            color: Color(0xff1890FF),
                            size: 16,
                            weight: FontWeight.w700)),
                    onPressed: () {
                      //返回ALerDiaLog

                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      });
    }
    finish = result;
  }
}
