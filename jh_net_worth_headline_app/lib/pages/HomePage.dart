import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:networth/model/TabItem.dart';
import 'package:networth/pages/graphic/GraphicListPage.dart';
import 'package:networth/pages/question/QuestionListPage.dart';
import 'package:networth/pages/quiz/QuizListPage.dart';
import 'package:networth/pages/vote/VoteListPage.dart';
import 'package:networth/utils/Constants.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> with WidgetsBindingObserver {
  //底部导航栏路由配置
  List<TabItem> tebItems = [
    TabItem(
        bottomBarTitle: "图文",
        icon: ImageIcon(AssetImage("assets/images/graphic.png")),
        route: GraphicListPage()),
    TabItem(
        bottomBarTitle: "竞猜",
        icon: ImageIcon(AssetImage("assets/images/quiz.png")),
        route: QuizListPage()),
    TabItem(
        bottomBarTitle: "投票",
        icon: ImageIcon(AssetImage("assets/images/vote.png")),
        route: VoteListPage()),
    TabItem(
        bottomBarTitle: "问答",
        icon: ImageIcon(AssetImage("assets/images/question.png")),
        route: QuestionListPage())
  ];

  //底部导航栏当前选中索引
  int curSelect = 0;
  //水平滑动起始点
  double horizontalDragStart;
  //水平滑动结束点
  double horizontalDragEnd;

  @override
  Widget build(BuildContext context) {
    //左右滑动监听
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onHorizontalDragStart: (details) {
          horizontalDragStart = details.localPosition.dx;
          horizontalDragEnd = details.localPosition.dx;
        },
        onHorizontalDragUpdate: (details) {
          horizontalDragEnd += details.delta.dx;
        },
        onHorizontalDragEnd: (details) {
          if ((horizontalDragEnd - horizontalDragStart) > 0.0 &&
              curSelect > 0) {
            setState(() {
              curSelect--;
            });
          } else if ((horizontalDragEnd - horizontalDragStart) < 0.0 &&
              curSelect < tebItems.length - 1) {
            setState(() {
              curSelect++;
            });
          }
        },
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: buildBottomNavigationBarItems(),
            currentIndex: this.curSelect,
            backgroundColor: Colors.white,
            selectedItemColor: Constants.primaryColor,
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              if (this.curSelect != index) {
                setState(() {
                  this.curSelect = index;
                });
              }
            },
          ),
          body: tebItems[curSelect].route,
        ),
      ),
    );
  }

  //构建底部导航栏
  List<BottomNavigationBarItem> buildBottomNavigationBarItems() {
    List<BottomNavigationBarItem> bottomNavigationBarItems = [];
    for (int i = 0; i < tebItems.length; i++) {
      bottomNavigationBarItems.add(BottomNavigationBarItem(
          icon: tebItems[i].icon,
          title: Text(tebItems[i].bottomBarTitle),
          backgroundColor: Constants.primaryColor));
    }
    return bottomNavigationBarItems;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
  }
}
