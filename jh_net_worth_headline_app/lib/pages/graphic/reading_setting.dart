import 'package:flutter/material.dart';

//阅读设置
class ReadingSettingPage extends StatefulWidget {
  @override
  _ReadingSettingPageState createState() => _ReadingSettingPageState();
}

class _ReadingSettingPageState extends State<ReadingSettingPage> {
  int groupValue = 1;
  _onChange(value) {
    if (mounted)
      setState(() {
        groupValue = value;
      });
  }

  //弹框选择
  bool sel =false;
  String _text = '按字数收费';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          child: Container(
            width: 60,
            height: 28,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Image.asset('assets/images/black.png'),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text('阅读设置', style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
        centerTitle: true,
        actions: <Widget>[
          InkWell(
            child: Container(
              width: 60,
              height: 28,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Image.asset('assets/images/keep.png',),
            ),
          ),
          SizedBox(width: 10,)
        ],
      ),
      body: Column(
        children: <Widget>[
          //免费阅读
          Container(
            margin: EdgeInsets.only(bottom: 10),
            color: Colors.white,
            child: ListTile(
              title: Text(
                '免费阅读',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
              trailing:
              Radio(value: 1, groupValue: groupValue, onChanged: _onChange),
            ),
          ),
          //向阅读者付费
          Container(
            color: Colors.white,
            child: ListTile(
              title: Text(
                '向阅读者付费',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
              trailing:
              Radio(value: 2, groupValue: groupValue, onChanged: _onChange),
            ),
          ),
          //按点击次数付费
          InkWell(
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: ListTile(
                title: Text(
                  '按点击次数付费',
                  style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                ),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
            onTap: (){
              print('按点击次数付费');
            },
          ),
          //向读者收费
          Container(
            color: Colors.white,
            child: ListTile(
              title: Text(
                '向阅读者收费',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
              trailing:
              Radio(value: 3, groupValue: groupValue, onChanged: _onChange),
            ),
          ),
          //按字数收费
          InkWell(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: ListTile(
                title: Text(
                  _text,
                  style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                ),
                trailing: Icon(Icons.keyboard_arrow_down),
              ),
            ),
            onTap: (){
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                builder: (BuildContext context) {
                  return Container(
                    height: 170,
                    child: new Column(
                      children: <Widget>[
                        ListTile(
                          title: Text('按字数收费'),
                          trailing: IconButton(
                              icon: Icon(
                                sel?Icons.check_circle_outline
                                    :Icons.radio_button_unchecked,
                                color: sel ? Colors.blue : Colors.grey,
                              ),
                              onPressed: () {
                                if (mounted) {
                                  setState(() {
                                    sel = true;
                                    _text = '按字幅收费';
                                  });
                                }
                              }),
                        ),
                        ListTile(
                          title: Text('按篇幅收费'),
                          trailing: IconButton(
                              focusColor: Colors.blue,
                              disabledColor: Colors.blue,
                              hoverColor: Colors.blue,
                              icon: Icon(
                                sel?Icons.radio_button_unchecked
                                    :Icons.check_circle_outline,
                                color: sel ? Colors.grey : Colors.blue,
                              ),
                              onPressed: () {
                                if (mounted) {
                                  setState(() {
                                    sel = false;
                                    _text = '按篇幅收费';
                                  });
                                }
                              }),
                        ),
                        Container(
                          height: 10,
                          color: Colors.grey[100],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('取消'))),
                            Expanded(
                                child: FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      '确认',
                                      style: TextStyle(
                                          color: Colors.black),
                                    ))),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            },
          ),
          //收费标准
          InkWell(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                title: Text(
                  '收费标准',
                  style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                ),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
            onTap: (){
              print('收费标准');
            },
          ),
     ],
    ),
    );
  }

}


