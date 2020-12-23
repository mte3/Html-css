import 'package:flutter/material.dart';
import 'QuestionInvisiblePersonnelPage.dart';
import 'QuestionVisiblePersonnelPage.dart';

class OpenDegree extends StatefulWidget {
  @override
  _OpenDegreeState createState() => _OpenDegreeState();
}

class _OpenDegreeState extends State<OpenDegree> {
  int _radioGroupA = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '开放程度',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
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
          Container(
            margin: EdgeInsets.only(bottom: 10),
            color: Colors.white,
            child: ListTile(
              title: Text('完全开放'),
              subtitle: Text(
                '所有人可见',
                style: TextStyle(fontSize: 10),
              ),
              trailing: Radio(
                value: 1,
                groupValue: _radioGroupA,
                onChanged: (v) {
                  setState(() {
                    _radioGroupA = v;
                  });
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            color: Colors.white,
            child: ListTile(
              title: Text('仅供自己保存'),
              subtitle: Text(
                '仅自己可见',
                style: TextStyle(fontSize: 10),
              ),
              trailing: Radio(
                value: 2,
                groupValue: _radioGroupA,
                onChanged: (v) {
                  setState(() {
                    _radioGroupA = v;
                  });
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            color: Colors.white,
            child: ListTile(
              title: Text('仅好友可见'),
              subtitle: Text(
                '仅好友可见',
                style: TextStyle(fontSize: 10),
              ),
              trailing: Radio(
                value: 3,
                groupValue: _radioGroupA,
                onChanged: (v) {
                  setState(() {
                    _radioGroupA = v;
                  });
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('部分好友可见'),
                  subtitle: Text(
                    '指定的好友可见',
                    style: TextStyle(fontSize: 10),
                  ),
                  trailing: Radio(
                    value: 4,
                    groupValue: _radioGroupA,
                    onChanged: (v) {
                      setState(() {
                        _radioGroupA = v;
                      });
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return VisiblePersonnel();
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 24),
                    child: Row(
                      children: <Widget>[
                        Text('可见人员名单'),
                        Spacer(),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('指定人员可见'),
                  subtitle: Text(
                    '指定的人员可见',
                    style: TextStyle(fontSize: 10),
                  ),
                  trailing: Radio(
                    value: 5,
                    groupValue: _radioGroupA,
                    onChanged: (v) {
                      setState(() {
                        _radioGroupA = v;
                      });
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return VisiblePersonnel();
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 24),
                    child: Row(
                      children: <Widget>[
                        Text('可见人员名单'),
                        Spacer(),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('指定人员不可见'),
                  subtitle: Text(
                    '指定的人员不可见',
                    style: TextStyle(fontSize: 10),
                  ),
                  trailing: Radio(
                    value: 6,
                    groupValue: _radioGroupA,
                    onChanged: (v) {
                      setState(() {
                        _radioGroupA = v;
                      });
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return InvisiblePersonnel();
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 24),
                    child: Row(
                      children: <Widget>[
                        Text('不可见人员名单'),
                        Spacer(),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
