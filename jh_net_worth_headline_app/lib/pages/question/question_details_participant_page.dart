import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'question_widget/questioin_details_widget.dart';
import 'question_widget/question_answer_widget.dart';
import 'question_widget/question_bottom_bar_widget.dart';
import 'question_widget/question_comment_widget.dart';
import 'question_widget/question_describe_widget.dart';
import 'question_widget/question_title_widget.dart';

///问答-详情-参与者-进行中
///创建人：华佑

class QuestionDetailsParticipantPage extends StatefulWidget {
  @override
  _QuestionDetailsParticipantPage createState() =>
      _QuestionDetailsParticipantPage();
}

class _QuestionDetailsParticipantPage
    extends State<QuestionDetailsParticipantPage> {
  //假定任务状态 -1：未开始  0:进行中  1:结束
  int _state;

  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _state = -1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          '问答',
          style: TextStyle(
            color: Color(0xff262626),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  //提问标题
                  QuestionTitleWidget(
                    title: '为什么有些人喝完牛奶会拉肚子',
                    name: '李清照',
                    startTime: '2020-03-28',
                    endDate: '2020-03-29',
                    endTime: '23:59',
                  ),

                  //问题描述
                  QuestionDescribeWidget(
                    state: _state,
                    startDate: '2020-05-30',
                    startTime: '00:00',
                    content: '我每次喝牛奶肚子都不舒服，这是为什么？总不能从此就不喝牛奶了吧，有大神能给个解释吗？',
                  ),
                  SizedBox(height: 8),

                  //详情模块
                  QuestionDetailsWidget(
                    name: '小红',
                    money: '20.00',
                  ),

                  //回答模块
                  QuestionAnswerWidget(),
                  SizedBox(height: 8),

                  //评论模块
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '评论',
                              style: TextStyle(
                                color: Color(0xff262626),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '共2条',
                              style: TextStyle(
                                color: Color(0xffbfbfbf),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        QuestionCommentWidget(
                          sex: true,
                          startDate: '2020-04-20',
                          startTime: '20:00',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //底部导航栏
            Container(
              color: Color(0xfffafafa),
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  QuestionBottomBarWidget(
                    url: 'assets/icons/question/icon_comment.png',
                    text: '评论',
                    onTap: () {
                      _showModalBottomSheet();
                    },
                  ),
                  QuestionBottomBarWidget(
                    url: 'assets/icons/question/icon_like.png',
                    text: '点赞',
                    onTap: () {},
                  ),
                  QuestionBottomBarWidget(
                    url: 'assets/icons/question/icon_collection.png',
                    text: '收藏',
                    onTap: () {},
                  ),
                  QuestionBottomBarWidget(
                    url: 'assets/icons/question/icon_share.png',
                    text: '分享',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showModalBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, state) {
            return GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        height: 56,
                        color: Color(0xfffafafa),
                        padding: EdgeInsets.only(
                          right: 10,
                          top: 8,
                          bottom: 8,
                          left: 16,
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                controller: _controller,
                                maxLines: 1,
                                maxLengthEnforced: true,
                                style: TextStyle(
                                  color: Color(0xffA6A6A6),
                                  fontSize: 14,
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(120)
                                ],
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xfff5f5f5),
                                  hintText: '请输入正文',
                                  hintStyle: TextStyle(
                                    color: Color(0xffA6A6A6),
                                    fontSize: 14,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 6),
                                child: Text(
                                  '发送',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xff1890FF),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      left: 0,
                      right: 0,
                      bottom: MediaQuery.of(context).viewInsets.bottom > 0
                          ? 0
                          : MediaQuery.of(context).viewInsets.bottom,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
