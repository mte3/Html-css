import 'package:flutter/material.dart';

import 'article_reward.dart';
import 'article_source.dart';

///文章性质
class Article extends StatefulWidget {
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  int radioValue = 0;
  bool checkValue = false;
  bool checkValue1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {}),
        title: Text(
          '文章性质',
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
          RadioListTile(
            title: Text('原创作品'),
            value: 1,
            controlAffinity: ListTileControlAffinity.trailing,
            groupValue: this.radioValue,
            onChanged: (value) {
              setState(
                () {
                  this.radioValue = value;
                },
              );
            },
          ),
          CheckboxListTile(
            title: Row(
              children: <Widget>[
                Text(
                  '版权声明',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
                Icon(
                  Icons.ac_unit,
                  color: Colors.grey,
                  size: 14.0,
                ),
              ],
            ),
            value: this.checkValue,
            onChanged: (value) {
              setState(
                () {
                  this.checkValue = value;
                },
              );
            },
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10.0,
            color: Colors.grey.withOpacity(0.2),
          ),
          RadioListTile(
            title: Text('转载引用'),
            value: 2,
            controlAffinity: ListTileControlAffinity.trailing,
            groupValue: this.radioValue,
            onChanged: (value) {
              setState(
                () {
                  this.radioValue = value;
                },
              );
            },
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '文章出处',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios, color: Colors.grey),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ArticleSource(),
                    ));
                  },
                ),
              ],
            ),
          ),
          CheckboxListTile(
            title: Row(
              children: <Widget>[
                Text(
                  '文责申明',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
                Icon(
                  Icons.ac_unit,
                  color: Colors.grey,
                  size: 14.0,
                ),
              ],
            ),
            value: this.checkValue1,
            onChanged: (value) {
              setState(
                () {
                  this.checkValue1 = value;
                },
              );
            },
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10.0,
            color: Colors.grey.withOpacity(0.2),
          ),
          RadioListTile(
            title: Text('商业推广'),
            value: 3,
            controlAffinity: ListTileControlAffinity.trailing,
            groupValue: this.radioValue,
            onChanged: (value) {
              setState(
                () {
                  this.radioValue = value;
                },
              );
            },
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              children: <Widget>[
                Text(
                  '阅读奖励',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
                Icon(
                  Icons.ac_unit,
                  color: Colors.grey,
                  size: 14.0,
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios, color: Colors.grey),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ArticleReward(),
                    ));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
