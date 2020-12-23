import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'button_choose.dart';
import 'collected_detail.dart';

class CollectedWork extends StatefulWidget {
  final String title;

  CollectedWork({this.title});

  @override
  _CollectedWorkState createState() => _CollectedWorkState();
}

class _CollectedWorkState extends State<CollectedWork> {
  var _textStyle = TextStyle(fontSize: 12.0, color: Colors.grey);
  List title = ['易安词', '易安词2', '未知名文集，最多一行，最多十六字'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('文章管理'),
      ),
      bottomNavigationBar: CatalogButton(
        cancelOntap: () => Navigator.pop(context),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        color: Colors.white,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                index == 0
                    ? Text(
                        '请选择文集目录',
                        style: TextStyle(fontSize: 18.0, color: Colors.grey),
                      )
                    : Container(),
                InkWell(
                  onTap: () {
                    print('点击了${title[index]}');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => CollectedDetail(
                                  title: title[index],
                                )));
                  },
                  child: Container(
                    height: 100.0,
                    margin:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                    child: Row(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              width: 60.0,
                              height: 80.0,
                              color: Colors.redAccent,
                            ),
                            Container(
                                width: 32.0,
                                height: 18.0,
                                color: Colors.amberAccent),
                          ],
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(title[index],
                                  style: TextStyle(fontSize: 16.0)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('更新至：一剪梅-红藕香残玉润秋', style: _textStyle),
                                  Text('05-20', style: _textStyle),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('共10个章节', style: _textStyle),
                                  Text('总字数1.2w', style: _textStyle),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 5.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue)),
                                    child: Text(
                                      '公开',
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  Text('创建于：2020.03.28', style: _textStyle),
                                  Expanded(
                                      child: Text('5w阅读',
                                          textAlign: TextAlign.right,
                                          style: _textStyle)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          itemCount: 3,
        ),
      ),
    );
  }
}
