import 'package:bigproject/my_library_serial/library_serial.dart';
import 'package:flutter/material.dart';

///我的文库-连载内容
class Serial extends StatefulWidget {
  @override
  _SerialState createState() => _SerialState();
}
class _SerialState extends State<Serial> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: anthologyList.length,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.only(
                bottom: 8,
              ),
              padding: EdgeInsets.only(top: 8, bottom: 6),
              color: Colors.white,
              height: 100,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Image.network(
                            anthologyList[index].img,
                            fit: BoxFit.cover,
                            width:
                            MediaQuery.of(context).size.width * 1 / 4 - 16,
                            height: MediaQuery.of(context).size.width * 1 / 3,
                          ),
                        ),
                        Positioned(
                          left: 0,
                          child: Container(
                            width: 32,
                            height: 18,
                            color: Colors.blue,
                            alignment: Alignment.center,
                            child: Text(
                              anthologyList[index].isCharge ? '收费' : '免费',
                              style:
                              TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: ListTile(
                      title: Text(anthologyList[index].title),
                      subtitle: Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '更新至： 第1卷第2篇第2章第1节',
                                    style: MiniStyle,
                                  ),
                                  Text(
                                    '05.20',
                                    style: MiniStyle,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '共27个章节',
                                    style: MiniStyle,
                                  ),
                                  Text(
                                    '总字数5W',
                                    style: MiniStyle,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          anthologyList[index].isOpen ? '公开' : '私有',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: anthologyList[index].isOpen
                                                  ? Colors.blue
                                                  : Colors.pink),
                                        ),
                                        width: 32,
                                        height: 18,
                                        margin: EdgeInsets.only(right: 8),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: anthologyList[index].isOpen
                                                    ? Colors.blue
                                                    : Colors.pink,
                                                width: 1)),
                                        alignment: Alignment.center,
                                      ),
                                      Text(
                                        '创建于： 2020.03.28',
                                        style: MiniStyle,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '4万阅读',
                                    style: MiniStyle,
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                  )
                ],
              ));
        });
  }


}

class Anthology {
  final String img;
  final String title;
  final bool isOpen; //是否公开
  final bool isCharge; //是否收费
  final String introduction;

  Anthology(
      {this.img, this.title, this.isOpen, this.isCharge, this.introduction});
}

const MiniStyle = TextStyle(color: Colors.grey, fontSize: 12);
