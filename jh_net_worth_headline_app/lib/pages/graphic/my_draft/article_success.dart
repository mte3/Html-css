import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleSuccess extends StatefulWidget {
  final String articleTitle;

  ArticleSuccess({this.articleTitle});

  @override
  _ArticleSuccessState createState() => _ArticleSuccessState();
}

class _ArticleSuccessState extends State<ArticleSuccess> {
  final poemName = [
    ['一剪梅-红藕香残玉润秋', '2', true, 0],
    ['如梦令-昨夜雨疏风骤', '1', false, 1],
    ['如梦令-常记溪亭日暮', '1', false, 1],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.articleTitle),
        centerTitle: true,
        elevation: 0.0,
      ),
      bottomNavigationBar: Container(
        height: 50.0,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.add_circle_outline,color: Colors.blue,),
            Text('新建文章',style: TextStyle(color: Colors.blue),),
          ],
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView(
            children: List.generate(poemName.length, (index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              poemName[index][2] == true
                  ? Container(
                      alignment: Alignment.centerLeft,
                      margin:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      child: Text(
                        '2020>诗词>' + widget.articleTitle,
                        style: TextStyle(color: Colors.blue, fontSize: 12.0),
                      ),
                    )
                  : Container(),
              Container(
                color: Colors.white,
                height: 56.0,
                margin: EdgeInsets.symmetric(vertical: 10.0),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(child: Text(poemName[index][0])),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 35.0,
                              height: 20.0,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 10.0),
                              child: Text(
                                '原创',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 12.0),
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue)),
                            ),
                            Container(
                              width: 35.0,
                              height: 20.0,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 10.0),

                              child: Text(
                                '免费',
                                style: TextStyle(
                                    color: Colors.greenAccent, fontSize: 12.0),
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.greenAccent)),
                            ),
                            Container(                              margin: EdgeInsets.only(right: 10.0),
                              child: Text('李清照'),),
                            Container(child: Text('2020.01.20'),),
                          ],
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        print('dian');
                      },
                      child: Icon(Icons.email),
                    ),
                  ],
                ),
              ),
            ],
          );
        })),
      ),
    );
  }
}
