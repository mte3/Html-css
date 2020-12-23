import 'package:bigproject/my_library_serial/read_setting.dart';
import 'package:bigproject/my_library_serial/serial.dart';
import 'package:bigproject/widget/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_serial_widget.dart';
import 'library_serial.dart';

///新建连载页面
///
class AddSerial extends StatefulWidget {
  @override
  _AddSerialState createState() => _AddSerialState();
}

bool settingIsOpen = true;

class _AddSerialState extends State<AddSerial> {
  TextEditingController nameController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  bool choiceVolume = false; //卷
  bool choicePiece = false; //篇
  bool choiceChapter = false; //章
  bool choiceSection = false; //节

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white70,
      appBar: MainAppBar(
        title: '新建连载',
      ),
      bottomSheet: Btm(
        //确定新建连载
        addHandel: () {
          setState(() {
            //新建连载点击确定后添加数组
            _addSerial();
            Navigator.pop(context,);
          });
        },
      ),
      body: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {
              //点击添加封面
            },
            child: Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 1 / 3,
                  right: MediaQuery.of(context).size.width * 1 / 3,
                  bottom: 8,
                  top: 8),
              width: MediaQuery.of(context).size.width * 1 / 3,
              height: MediaQuery.of(context).size.width * 4 / 9,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/drawable-xxxhdpi/add1.png',
                    width: 24,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '添加封面',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          AddSerialContent(
            title: '名称',
            rightIcon: false,
            widgets: TextField(
              textAlign: TextAlign.end,
              controller: nameController,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
          Container(
            height: 240,
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 8),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  height: 48,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Text(
                        '连载架构',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '(可复选)',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    ],
                  ),
                ),
                ChapterChoice(
                  title: '卷',
                  isChoice: choiceVolume,
                  handel: () {
                    setState(() {
                      this.choiceVolume = !this.choiceVolume;
                    });
                  },
                ),
                ChapterChoice(
                  title: '篇',
                  isChoice: choicePiece,
                  handel: () {
                    setState(() {
                      this.choicePiece = !this.choicePiece;
                    });
                  },
                ),
                ChapterChoice(
                  title: '章',
                  isChoice: choiceChapter,
                  handel: () {
                    setState(() {
                      this.choiceChapter = !this.choiceChapter;
                    });
                  },
                ),
                ChapterChoice(
                  title: '节',
                  isChoice: choiceSection,
                  handel: () {
                    setState(() {
                      this.choiceSection = !this.choiceSection;
                    });
                  },
                ),
              ],
            ),
          ),
          AddSerialContent(
              onTaps: () {},
              title: '作品简介',
              widgets: Text(
                '最多显示十六个字，超出用省略号.'
                '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊..........',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
                maxLines: 1,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              )),
          AddSerialContent(
            title: '作品属性',
            onTaps: () {
              setState(() {
                settingIsOpen = !settingIsOpen;
              });
            },
            widgets: Text(
              settingIsOpen ? '所有人可见' : '仅自己可见',
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          AddSerialContent(
            title: '阅读设置',
            onTaps: () {
              print(settingIsCharge);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ReadSetting();
              }));
            },
            widgets: Text(
              settingIsCharge ? '免费阅读' : '付费阅读',
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 148,
          )
        ],
      ),
    );
  }

  _addSerial() {
    //新建连载 确定触发的方法
    print(nameController.text);
    anthologyList.add(Anthology(
      img:
          "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1593774319,3121494245&fm=26&gp=0.jpg",
      title: nameController.text == "" ? '未命名' : nameController.text,
      introduction: '暂无介绍',
      isCharge: !settingIsCharge,
      isOpen: settingIsOpen,
    ));
  }
}
