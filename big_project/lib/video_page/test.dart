// import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'find_video_item.dart';


class MainFind3Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainFindPage3State();
  }
}

class MainFindPage3State extends State with SingleTickerProviderStateMixin {
  List<String> tabTextList = ["关注", "推荐"];
  List<Tab> tabWidgetList = [];
  TabController tabController;

  ///推荐模拟数据
  List<VideoModel> videoList = [];

  ///关注模拟数据
  List<VideoModel> videoList2 = [];
  @override
  void initState() {
    super.initState();

    for (var value in tabTextList) {
      tabWidgetList.add(Tab(
        text: "$value",
      ));
    }
    tabController = new TabController(length: tabTextList.length, vsync: this);

    for (int i = 0; i < 10; i++) {
      VideoModel videoModel = new VideoModel();
      videoModel.videoName = "推荐测试数据$i";
      videoModel.pariseCount = i * 22;
      videoModel.videoUrl =
          'https://www.runoob.com/try/demo_source/mov_bbb.mp4';
      if (i % 3 == 0) {
        videoModel.isAttention = true;
        videoModel.isLike = true;
      } else {
        videoModel.isAttention = false;
        videoModel.isLike = false;
      }
      videoModel.videoImg = "";
      videoModel.videoUrl = "";
      videoList.add(videoModel);
    }

    for (int i = 0; i < 3; i++) {
      VideoModel videoModel = new VideoModel();
      videoModel.videoName = "关注测试数据$i";
      videoModel.pariseCount = i * 22;
      videoModel.isAttention = true;
      if (i % 3 == 0) {
        videoModel.isLike = true;
      } else {
        videoModel.isLike = false;
      }
      videoModel.videoImg = "";
      videoModel.videoUrl =
          'https://vd2.bdstatic.com/mda-kh3i0m79ufwmf283/v1-cae/1080p/mda-kh3i0m79ufwmf283.mp4';
      videoList2.add(videoModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildRootBody();
  }

  Widget buildRootBody() {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              color: Colors.black,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: buildTableViewWidget(),
          ),
//          Positioned(
//            left: 0,
//            right: 0,
//            bottom: 0,
//            top: 54,
//            child: buildTabBarWidget(),
//          ),
        ],
      ),
    );
  }

  ///构建 TabBarView
  buildTableViewWidget() {
    return TabBarView(
      controller: tabController,
      children:
          tabTextList.map((value) => buildTableViewItemWidget(value)).toList(),
    );
  }

  Widget buildTableViewItemWidget(String value) {
    List<VideoModel> list = [];
    if (value == "推荐") {
      list = videoList;
    } else {
      list = videoList2;
    }
    return PageView.builder(

        /// pageview中 子条目的个数
        itemCount: list.length,

        /// 上下滑动
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          VideoModel videoModel = list[index];
          return buildPageViewItemWidget(value, videoModel);
        });
  }

  buildPageViewItemWidget(String value, VideoModel videoModel) {
    return FindVideoItemPage(value, videoModel);
  }

  ///构建顶部标签部分
  buildTabBarWidget() {
    return Container(
      ///对齐在顶部中间
      alignment: Alignment.topCenter,
      child: TabBar(
        controller: tabController,
        tabs: tabWidgetList,

        ///指示器的颜色
        indicatorColor: Colors.white,

        ///指示器的高度
        indicatorWeight: 2.0,
        isScrollable: true,

        ///指示器的宽度与文字对齐
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }
}

class VideoModel {
  ///视频名称
  String videoName = '测试';

  ///视频链接
  String videoUrl = 'https://www.runoob.com/try/demo_source/mov_bbb.mp4';

  ///视频截图
  String videoImg = '';

  ///是否关注
  bool isAttention = false;

  ///关注的个数
  num attentCount = 0;

  ///是否喜欢
  bool isLike = false;

  ///点赞的个数
  num pariseCount = 0;

  ///分享的次数
  num shareCount = 0;
}
