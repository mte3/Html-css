
import 'package:big_project/home_page/home.dart';
import 'package:big_project/my_page/Profile.dart';
import 'package:big_project/video_page/video.dart';
import 'package:flutter/material.dart';



bool login = true;
class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> with TickerProviderStateMixin {
  int _currentIndex = 0; //当前界面索引值
  StatefulWidget _currentPage; //当前页面
  List<NavigationIconView> _navigationViews; //初始化图标列表
  List<Widget> _pageList; //页面列表

  void _rebuild() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    //初始化图标列表
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
          icon: Icon(Icons.home), title: Text('首页'), vsync: this),
     new NavigationIconView(
          icon: Icon(Icons.ondemand_video), title: Text('视频'), vsync: this),
      new NavigationIconView(
          icon: Icon(Icons.perm_identity), title: Text('我的'), vsync: this),
    ];

    //给每个按钮添加一个监听
    for (NavigationIconView view in _navigationViews) {
      view.controller.addListener(_rebuild);
    }

    //按钮图标对应的页面列表
    _pageList = <StatefulWidget>[
      new Home(),
      new Video(),
      new Profile(),
    ];
    _currentPage = _pageList[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    //声明定义一个底部导航的工具
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      items: _navigationViews
          .map((NavigationIconView navigationIconView) =>
              navigationIconView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed, //固定类型的底部导航栏
      onTap: (int index) {
        //点击时间，点击后触发的逻辑事件。
        setState(() {
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
          _currentPage = _pageList[_currentIndex];
          login = !login;
          print(login);
        });
      },
    );
    return Scaffold(
      // body: PageView(
      //   onPageChanged: (x) {
      //    setState(() {
      //      _currentIndex = x;
      //    });
      //   },
      //   children: _pageList,
      // ),
      body: _pageList[_currentIndex],

      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

//Icon展示控件，动画原理
class NavigationIconView {
  final BottomNavigationBarItem item;
  final AnimationController controller;

  NavigationIconView({Widget icon, Widget title, TickerProvider vsync})
      : item = new BottomNavigationBarItem(icon: icon, title: title),
        controller = new AnimationController(
          vsync: vsync,
          duration: kThemeAnimationDuration,
        );
}
