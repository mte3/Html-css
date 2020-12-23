
import 'package:flutter/material.dart';

import 'articleDetails.dart';

class ConsultDetail extends StatefulWidget {
  @override
  _ConsultDetailState createState() => _ConsultDetailState();
}

class _ConsultDetailState extends State<ConsultDetail>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = new TextEditingController();
  var tabs = <Tab>[
    Tab(
      text: "综合",
    ),
    Tab(
      text: "咨询",
    ),
    Tab(
      text: "视频",
    ),
    Tab(
      text: "用户",
    ),
    Tab(
      text: "话题",
    ),
  ];

  var _tabbarcontroller;

  @override
  void initState() {
    _tabbarcontroller = TabController(
      length: tabs.length,
      vsync: this, //动画效果的异步处理，默认格式，背下来即可
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Stack(
          children: <Widget>[
            Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  border: Border.all(width: 0.1)),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10.0),
                  icon: Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 34,
                    ),
                  ),
                  hintText: '关键词实例',
                ),
                autofocus: false,
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                width: 50,
                child: FlatButton(
                  onPressed: () {
                    _controller.clear();
                  },
                  child: Icon(
                    Icons.clear,
                    size: 28,
                  ),
                ),
              ),
            )
          ],
        ),
        actions: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.only(right: 20),
              child: Text(
                '取消',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),

      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: TabBar(
                tabs: tabs,
                controller: _tabbarcontroller,
                indicatorColor: Colors.blue,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorWeight: 2.0,
                labelStyle: TextStyle(
                    height: 2, fontWeight: FontWeight.bold, fontSize: 18),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal)),
          ),
          Expanded(
            child: TabBarView(
                controller: _tabbarcontroller,
                children: tabs.map((item) {
                  return ListView(
                    children: <Widget>[
                      _card(context),
                      _card(context),
                      _card(context),
                      _card(context),
                      _card(context),
                      _card(context)
                    ],
                  );
                }).toList()),
          )
        ],
      ),
    );
  }
}

Widget _card(context) {
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return articleDetails();
      }));
    },
    child: Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 5,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              width: 300,
              child: Column(
                children: <Widget>[
                  Text(
                    '关键词提示例，内容标题示例，内容常标题示例关键词提示例，内容标题示例，内容常标题示例',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '内容来源',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '15评论',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '2小时前',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              children: <Widget>[
                Container(
                    child: Image.network(
                  'https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1906469856,4113625838&fm=26&gp=0.jpg',
                  width: 100,
                  height: 80,
                )),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
