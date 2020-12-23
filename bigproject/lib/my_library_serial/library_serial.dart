import 'package:bigproject/my_library_serial/serial.dart';
import 'package:bigproject/widget/appbar.dart';
import 'package:bigproject/widget/bottom_sheet.dart';
import 'package:flutter/material.dart';

import 'add_serial.dart';

///我的文库-连载页面
class MyLibrarySerial extends StatefulWidget {
  @override
  _MyLibrarySerialState createState() => _MyLibrarySerialState();
}

class _MyLibrarySerialState extends State<MyLibrarySerial>
    with TickerProviderStateMixin {
  TabController tabController;
  List<Tab> tabs;
  List<Widget> tabBarViewWidget;
  List serial;

  void initState() {
    super.initState();
    tabs = [
      new Tab(
        text: '文章',
      ),
      new Tab(
        text: '文集',
      ),
      new Tab(
        text: '连载',
      ),
      new Tab(
        text: '草稿',
      ),
    ];
    tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    tabController.dispose();
    tabs.clear();
    tabBarViewWidget.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    tabBarViewWidget = [
      Serial(),
      Serial(),
      Serial(),
      Serial(),
    ];
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: MainAppBar(
        title: '文集管理',
        rightDMActions: <Widget>[
          InkWell(
            onTap: () {},
            child: Image.asset(
              'assets/images/drawable-xxxhdpi/search.png',
              width: 24,
            ),
          ),
          SizedBox(
            width: 16,
          ),
        ],
        bottom: TabBar(
          tabs: tabs,
          controller: tabController,
          indicator: BoxDecoration(),
          labelColor: Colors.black,
          labelStyle: TextStyle(fontSize: 18),
          unselectedLabelColor: Colors.black54,
          unselectedLabelStyle: TextStyle(fontSize: 16),
        ),
      ),
      body: TabBarView(controller: tabController, children: tabBarViewWidget),
      bottomSheet: BottomAdd(
        title: ' 新建连载',
        onTaps: ()  {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return AddSerial();
          }));
        },
      ),
    );
  }
}

List<Anthology> anthologyList = [
  Anthology(
      img:
          "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1593774319,3121494245&fm=26&gp=0.jpg",
      title: '仙衣驽马少年：唐宋诗人的诗酒江湖',
      introduction: '仙衣驽马少年：唐宋诗人的诗酒江湖',
      isCharge: false,
      isOpen: false),
  Anthology(
      img:
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600934637395&di=821042f1f0797d57e15f47eccc86c2f8&imgtype=0&src=http%3A%2F%2Fa1.att.hudong.com%2F08%2F22%2F01300000242726125670225939875.jpg",
      title: '美学散步',
      introduction: '0000000000000000000',
      isCharge: true,
      isOpen: true)
];
