import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QaType extends StatefulWidget {
  @override
  _QaTypeState createState() => _QaTypeState();
}

class _QaTypeState extends State<QaType> {
  List lists = ['网络', '知识', '体育', '互动', '趣味', '商业', '男性', '女性'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '问答类型',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
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
            onPressed: () {},
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
            color: Colors.white,
            padding: EdgeInsets.only(left: 10, right: 10, top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '默认类型',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 14,
                ),
                Center(
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 10,
                    children: lists.map((item) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(245, 245, 245, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          padding: EdgeInsets.only(
                              left: 24, right: 24, top: 8, bottom: 8),
                          child: Text(item),
                        ),
                      );
                    }).toList(),
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
            color: Colors.white,
            child: ListTile(
                onTap: () {},
                leading: Text('自定义'),
                trailing: IconButton(
                  icon: Image.asset('assets/images/add.png'),
                )),
          )
        ],
      ),
    );
  }
}
