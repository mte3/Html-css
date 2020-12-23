import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'article.dart';
import 'draft.dart';



class ArticleManage extends StatefulWidget {
  @override
  _ArticleManageState createState() => _ArticleManageState();
}

class _ArticleManageState extends State<ArticleManage> with TickerProviderStateMixin {
  final List<Tab> _tabs = [
    Tab(text: '文章'),
    Tab(text: '文集'),
    Tab(text: '连载'),
    Tab(text: '草稿'),
  ];
  TabController _controller;
  int initialIndex = 3;
  @override
  void initState() {
    super.initState();
    _controller =
        TabController(length: _tabs.length, vsync: this, initialIndex: initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('文章管理'),
        bottom: TabBar(
          tabs: _tabs,
          controller: _controller,
          indicator: BoxDecoration(),
          labelStyle: TextStyle(
            fontSize: 20.0,
          ),
          unselectedLabelColor: Colors.grey,
          unselectedLabelStyle: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        child: TabBarView(controller: _controller, children: [
          Article(),
          Text('文集'),
          Text('连载'),
          Draft(),
        ]),
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
    );
  }
}