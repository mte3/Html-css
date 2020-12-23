import 'package:flutter/cupertino.dart';

class TabItem {
  //底部item标题
  String bottomBarTitle;
  //底部item图标
  Widget icon;
  //tab路由
  Widget route;

  TabItem({this.bottomBarTitle, this.icon, this.route}) : super();
}
