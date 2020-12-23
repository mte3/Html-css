
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'article_success.dart';
import 'button_choose.dart';

class CatalogPoetry extends StatefulWidget {
  final String poemTitle;

  CatalogPoetry({this.poemTitle});

  @override
  _CatalogPoetryState createState() => _CatalogPoetryState();
}

class _CatalogPoetryState extends State<CatalogPoetry> {
  final List poemList = [
    ['如梦令', '2', true, 0],
    ['醉花阴', '1', false, 1],
  ];
  int index1 = 0;
  int number2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.poemTitle),
        elevation: 0.0,
        centerTitle: true,
      ),
      bottomNavigationBar: CatalogButton(
        yesOntap: () {
          showChooseDialog(number2);
        },
      ),
      body: Container(
        child: ListView(
            children: List.generate(poemList.length, (index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              poemList[index][2] == true
                  ? Container(
                      alignment: Alignment.centerLeft,
                      margin:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      child: Text(
                        '2020>' + widget.poemTitle,
                        style: TextStyle(color: Colors.blue, fontSize: 12.0),
                      ),
                    )
                  : Container(),
              CatalogList(
                catalogTitle: poemList[index][0],
                subTitle: poemList[index][1],
                actionWidget: Radio(
                    value: poemList[index][3],
                    groupValue: index1,
                    onChanged: (i) {
                      number2 = index;
                      index1 = i;
                      setState(() {});
                    }),
                catalogOntap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CatalogPoetry(
                              poemTitle: poemList[index][0],
                            ))),
              ),
            ],
          );
        })),
      ),
    );
  }

  void showChooseDialog(int number) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            content: Container(
                margin: EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  '确定发布至【${poemList[number][0]}】？',
                  style: TextStyle(fontSize: 16.0),
                )),
            actions: <Widget>[
              CupertinoButton(child: Text('取消'), onPressed: () {}),
              CupertinoButton(
                  child: Text('确定'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => ArticleSuccess(
                                  articleTitle: poemList[number][0],
                                )));
                  }),
            ],
          );
        });
  }
}
