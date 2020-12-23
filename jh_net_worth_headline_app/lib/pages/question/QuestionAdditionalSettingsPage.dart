import 'package:flutter/material.dart';

class AdditionalSettings extends StatefulWidget {
  @override
  _AdditionalSettingsState createState() => _AdditionalSettingsState();
}

class _AdditionalSettingsState extends State<AdditionalSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '附加设置',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Image.asset(
            'assets/images/question/fabu/fanhui.png',
            width: 24,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              'assets/images/question/fabu/baocun.png',
              width: 24,
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(margin: EdgeInsets.only(left: 20),
            child: Text('评论中插入图片，视频，音频或链接的收费标准',style: TextStyle(color: Color.fromRGBO(140, 140, 140, 1),fontSize: 12),),
          ),
          Card(text1: '图片类',),
          Card(text1: '视频类',),
          Card(text1: '音频类',),
          Card(text1: '链接类',),
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
final String text1;

  const Card({Key key, this.text1}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: ListTile(
            leading: Text(
              text1,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        InkWell(
          onTap: () {
          },
          child: Container(
            color: Colors.white,
            height: 50,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: <Widget>[
                  Text(
                    '单词点击起价',
                  ),
                  Spacer(),
                  Text(
                    '￥0.05/CPC',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}
