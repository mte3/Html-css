import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'button_choose.dart';
import 'catalog_poetry.dart';

class CatalogYear extends StatefulWidget {
  final String catalogTitle;

  CatalogYear({this.catalogTitle});

  @override
  _CatalogYearState createState() => _CatalogYearState();
}

class _CatalogYearState extends State<CatalogYear> {
  List _item = [
    ['诗歌', '3', true],
    ['文章', '2', false]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(widget.catalogTitle),
      ),
      bottomNavigationBar: CatalogButton(),
      body: Container(
        color: Colors.grey[200],
        child: ListView(
          padding: EdgeInsets.zero,
          children: _item.map((e) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                e[2] == true
                    ? Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        child: Text(
                          widget.catalogTitle,
                          style: TextStyle(color: Colors.blue, fontSize: 12.0),
                        ),
                      )
                    : Container(),
                CatalogList(
                  catalogTitle: e[0],
                  subTitle: e[1],
                  actionWidget: Icon(
                    Icons.chevron_right,
                  ),
                  catalogOntap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CatalogPoetry(
                                poemTitle: e[0],
                              ))),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
