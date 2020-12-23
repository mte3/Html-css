import 'package:flutter/material.dart';

///文章性质-商业推广-阅读奖励
class ArticleReward extends StatefulWidget {
  @override
  _ArticleRewardState createState() => _ArticleRewardState();
}

class _ArticleRewardState extends State<ArticleReward> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text(
          '阅读奖励',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.access_time,
              color: Colors.black,
              size: 30.0,
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              '奖励标准',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '人均奖励次数',
                  style: TextStyle(fontSize: 18.0, color: Colors.grey),
                ),
                Text(
                  '1',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '人均奖励金额',
                  style: TextStyle(fontSize: 18.0, color: Colors.grey),
                ),
                Text(
                  '￥0.00',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '预付报酬费用',
                  style: TextStyle(fontSize: 18.0, color: Colors.grey),
                ),
                Text(
                  '不得低于最低标准￥300.00',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0),
            child: RaisedButton(
              onPressed: () {},
              child: Text(
                '提交并支付',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
