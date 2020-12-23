import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Article extends StatefulWidget {
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  final List _list = [
    [Icons.delete,'0'],
    [Icons.format_align_justify,'0'],
    [Icons.gamepad,'0'],
    [Icons.accessibility_new,'']
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('一剪梅-红藕香残玉润秋'),
                          Text(
                            '最新',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 40.0,
                            height: 23.0,
                            margin: EdgeInsets.only(right: 5.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                            ),
                            child: Text(
                              '原创',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          Text('2020.04.20'),
                          SizedBox(width: 20.0,),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: _list.map((e) {
                                return Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(e[0]),
                                      Text(e[1])
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            );
          }),
    );
  }
}
