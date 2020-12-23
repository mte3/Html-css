
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'QuestionAdditionalSettingsPage.dart';


class CommentsManagement extends StatefulWidget {
  @override
  _CommentsManagementState createState() => _CommentsManagementState();
}

class _CommentsManagementState extends State<CommentsManagement> {
  bool val=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('评论管理',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:Image.asset('assets/images/question/fabu/fanhui.png',width: 24,),
        ),
        actions: <Widget>[
          IconButton(icon: Image.asset('assets/images/question/fabu/baocun.png',width: 24,),)
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(color: Colors.white,
            child: ListTile(
              leading: Text('允许评论',style: TextStyle(fontSize: 16),),
              trailing: CupertinoSwitch(
                value: val,
                activeColor: Color(0xFF2D88FF),
                onChanged: (v) {
                  setState(() {
                    val = v;
                  });
                  val == true ? print('开启') : print('关闭');
                },
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_){
                return AdditionalSettings();
              }));
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
                      '附加设置',
                    ),
                    Spacer(),
                    Text(
                      '默认免费',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
