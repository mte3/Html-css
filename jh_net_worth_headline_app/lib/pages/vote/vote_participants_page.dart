import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///投票-参与者
class VoteParticipantsPage extends StatefulWidget {
  @override
  _VoteParticipantsPageState createState() => _VoteParticipantsPageState();
}

class _VoteParticipantsPageState extends State<VoteParticipantsPage> {
  String selectedItem = "";
  bool isVotes = false;

  List<Map<String, dynamic>> votesList = [
    {
      "name": "苏轼",
      "votes": 0,
      "percentage": 0,
    },
    {
      "name": "李清照",
      "votes": 0,
      "percentage": 0,
    },
    {
      "name": "李煜",
      "votes": 0,
      "percentage": 0,
    },
    {
      "name": "辛弃疾",
      "votes": 0,
      "percentage": 0,
    },
  ];
  List<Map<String, dynamic>> commentList = [
    {
      "avatarUrl": "assets/images/vote/libai.webp",
      "name": "苏东坡",
      "gender": "assets/images/vote/man.png",
      "content": "长恨此身非我有，何时忘却营营。",
    },
    {
      "avatarUrl": "assets/images/vote/dufu.png",
      "name": "苏东坡",
      "gender": "assets/images/vote/man.png",
      "content": "娘子好文采~❤❤❤",
    },
  ];
  List<Map<String, dynamic>> bottomList = [
    {
      "icon": "assets/images/vote/comment.png",
      "title": "评论",
    },
    {
      "icon": "assets/images/vote/chat.png",
      "title": "私聊",
    },
    {
      "icon": "assets/images/vote/give.png",
      "title": "赠送",
    },
    {
      "icon": "assets/images/vote/invite.png",
      "title": "邀约",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset("assets/images/vote/ic_back.png"),
          onPressed: () {},
        ),
        title: Text(
          "投票",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Color(0xff262626),
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          InkWell(
            onTap: () {},
            child: Image.asset("assets/images/vote/share.png"),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        children: bottomList.map((item) {
          return bottomsItem(item);
        }).toList(),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          //投票-顶部
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "谁是历史上人气最高的词人？",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.0,
                        vertical: 2.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff7EBFFC),
                        ),
                      ),
                      child: Text(
                        "投票",
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Color(0xff7EBFFC),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "李清照",
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Color(0xff595959),
                        ),
                      ),
                    ),
                    Text(
                      "2020-03-28",
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Color(0xff8C8C8C),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "截止日期：2020-06-30 23:59",
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Color(0xff8C8C8C),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //投票选项
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 9.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "投票选项",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "0人投票",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xff8C8C8C),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: votesList.map((item) {
                    return votesListItem(item);
                  }).toList(),
                ),
              ],
            ),
          ),
          //投票按钮
          Container(
            height: 48.0,
            color: Colors.white,
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: 5.0,
              bottom: 8.0,
            ),
            padding: EdgeInsets.symmetric(vertical: 9.0),
            child: RaisedButton(
              onPressed: () {
                if (isVotes) {
                  _showDialog();
                } else {
                  if (selectedItem == "") {
                    print("请选择投票选项");
                  } else {
                    isVotes = true;
//                    print("投票成功");
                    _showDialog();
                    print(selectedItem);
                  }
                }
                setState(() {});
              },
              color: buttonColor(),
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Text(
                isVotes ? "已投票" : "投票",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          //评论列表
          Container(
            color: Colors.white,
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 13.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "评论",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "共${commentList.length}条",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xffBFBFBF),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return commentListItem(index);
                  },
                  itemCount: commentList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 8.0,
                      color: Color(0xfff5f5f5),
                    );
                  },
                ),
                Container(
                  height: 9.0,
                  color: Color(0xffF5F5F5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //底部功能项
  Widget bottomsItem(item) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      height: kToolbarHeight,
      alignment: Alignment.center,
      color: Colors.white,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          switch (item["title"]) {
            case "评论":
              print("评论");
              break;
            case "私聊":
              print("私聊");
              break;
            case "赠送":
              print("赠送");
              break;
            case "邀约":
              print("邀约");
              break;
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(item["icon"]),
            SizedBox(height: 4.0),
            Text(
              item["title"],
              style: TextStyle(
                fontSize: 10.0,
                color: Color(0xff595959),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //单个投票选项
  Widget votesListItem(item) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          selectedItem = item["name"];
          setState(() {});
        },
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 8.0),
              child: Text(
                "${item["name"]}",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xff595959),
                ),
              ),
            ),
            selectedItem == item["name"]
                ? Image.asset(
                    "assets/images/vote/selected.png",
                  )
                : SizedBox(),
            Spacer(),
            Text(
              "${item["votes"]}票",
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xff8C8C8C),
              ),
            ),
            SizedBox(width: 24.0),
            Text(
              "${item["percentage"]}%",
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xff8C8C8C),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //评论列表项
  Widget commentListItem(int index) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //发表评论用户信息
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage(commentList[index]["avatarUrl"]),
                  radius: 28 / 2,
                ),
                SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          commentList[index]['name'],
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(width: 8.0),
                        Image.asset(commentList[index]["gender"]),
                      ],
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      "2020-04-20  20:00",
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Color(0xff8C8C8C),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                ToolWidget(
                  number: "",
                  imageUrl: "assets/images/vote/comment_grey.png",
                ),
                ToolWidget(
                  number: "10",
                  imageUrl: "assets/images/vote/like.png",
                ),
                ToolWidget(
                  number: "",
                  imageUrl: "assets/images/vote/news.png",
                )
              ],
            ),
          ),
          //评论内容
          Container(
            margin: EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 36.0,
            ),
            child: Text(
              "${commentList[index]["content"]}",
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
          //作者回复
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                color: Color(0xffF5F5F5),
                margin: EdgeInsets.only(
                  left: 36.0,
                  bottom: 8.0,
                ),
                padding: EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    text: "李清照：",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff262626),
                    ),
                    children: [
                      TextSpan(
                        text: "苏老，营营是谁啊…👩‍👩‍👦‍👦,苏老",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      WidgetSpan(
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 10.0,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.0,
                            vertical: 2.0,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xff7EBFFC),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          child: Text(
                            "作者回复",
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: 1,
          ),
        ],
      ),
    );
  }

  //投票按钮颜色
  Color buttonColor() {
    Color buttonColor;
    if (isVotes) {
      buttonColor = Color(0xff7EBFFC);
    } else {
      if (selectedItem != "") {
        buttonColor = Color(0xff1890FF);
      } else {
        buttonColor = Color(0xffBFBFBF);
      }
    }
    return buttonColor;
  }

  //缴费提示框
  _showDialog() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Text(
                  "您已参与投票",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff1890FF),
                  ),
                ),
              ),
              Text(
                "本日剩余投票次数：0",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff1890FF),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("确认"),
            ),
          ],
        );
      },
    );
  }
}

class ToolWidget extends StatelessWidget {
  final String number;
  final String imageUrl;
  ToolWidget({this.number, this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            left: 16.0,
            right: 4.0,
          ),
          child: Text(
            "$number",
            style: TextStyle(
              fontSize: 10.0,
              color: Color(0xffBFBFBF),
            ),
          ),
        ),
        Image.asset("$imageUrl"),
      ],
    );
  }
}
