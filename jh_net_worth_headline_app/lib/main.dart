import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:networth/pages/HomePage.dart';
import 'package:networth/utils/Constants.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  //设置全局加载动画样式
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000) //显示时间
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle //动画样式
    ..loadingStyle = EasyLoadingStyle.custom //动画类型
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Constants.primaryColor //进度条颜色
    ..backgroundColor = Colors.white //背景颜色
    ..indicatorColor = Colors.black //动画颜色
    ..textColor = Colors.black //文本颜色
    ..maskColor = Constants.primaryColor.withOpacity(0)
    ..userInteractions = true;

  ///沉浸式状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
      textDirection: TextDirection.ltr,
      child: OKToast(
          child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          backgroundColor: Color(0xffF5F5F5),
          appBarTheme: AppBarTheme(
            color: Colors.white,
            brightness: Brightness.light,
            elevation: 0,
            textTheme: TextTheme(
              title: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 19),
            ),
            iconTheme: IconThemeData(color: Color(0xff696969)),
          ),
          tabBarTheme: TabBarTheme(
              indicator: BoxDecoration(color: Colors.transparent),
              labelColor: Colors.black,
              labelPadding: EdgeInsets.zero,
              labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              unselectedLabelStyle:
                  TextStyle(fontSize: 18, color: Color(0xffACACAC))),
        ),
        debugShowCheckedModeBanner: false,

        //项目路由集合
        routes: <String, WidgetBuilder>{
          "home": (BuildContext context) => HomePage()
        },
        //app启动路由(首页)
        initialRoute: "home",
      )),
    );
  }
}
