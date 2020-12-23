import 'dart:async';

import 'chewie_progress_colors.dart';
import 'file:///C:/Users/mte/AndroidStudioProjects/big_project/lib/video_page/test.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

import 'chewie_player.dart';
import 'custom_controls.dart';
import 'custom_player_with_controls.dart';

///播放视频的页面
class FindVideoItemPage extends StatefulWidget {
  String tabValue;
  VideoModel videoModel;
  FindVideoItemPage(this.tabValue, this.videoModel);

  @override
  State<StatefulWidget> createState() {
    return FindVideoItemPageState();
  }
}

class FindVideoItemPageState extends State<FindVideoItemPage> {
  ///创建视频播放控制 器
  VideoPlayerController videoPlayerController;
  ChewieController _chewieController;

  ///控制更新视频加载初始化完成状态更新
  Future videoPlayFuture;

  dynamic currentTime;
  Timer _timer;
  bool isShow = false;
  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.network(widget.videoModel.videoUrl);

    _chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        customControls: CustomControls(),
        placeholder: new Container(
          color: Colors.black,
        ),
        materialProgressColors: ChewieProgressColors(
            bufferedColor: Colors.white,
            playedColor: Color.fromRGBO(0, 102, 255, 1)));

    videoPlayerController.addListener(() {
      if (_timer != null) {
        return;
      }
      // Timer的第一秒倒计时是有一点延迟的，为了立刻显示效果可以添加下一行。
      _timer = new Timer.periodic(new Duration(milliseconds: 250), (timer) {
        setState(() {
          if (currentTime != videoPlayerController.value.duration) {
            currentTime = videoPlayerController.value.position;
            isShow = false;
          } else {
            _timer.cancel();
            _timer = null;
            currentTime = 0;
            isShow = true;
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ///播放视频
//        buildVideoWidget(),
        Container(
          height: !videoPlayerController.value.isPlaying
              ? MediaQuery.of(context).size.height / 1.15
              : MediaQuery.of(context).size.height,
          child: Chewie(
              controller: _chewieController,
              child: Center(
                child: CustomPlayerWithControls(
                  width: MediaQuery.of(context).size.width,
//                  height: double.infinity,
                ),
              )),
        ),
        Offstage(
            offstage: !isShow,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.15,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('微信'),
                    Text('朋友圈'),
                    Text('微博'),
                    InkWell(
                      onTap: () {
                        // If the video is paused, play it.
                        _chewieController.seekTo(Duration());
                        videoPlayerController.play();
                      },
                      child: Text('重播'),
                    )
                  ],
                ),
              ),
            )),
//
        ///底部区域的视频介绍
        Visibility(
          visible: !videoPlayerController.value.isPlaying,
          child: buildBottomFlagWidget(),
        )

//
        ///右侧的用户信息按钮区域
//        buildRightUserWidget(),
      ],
    );
  }

  Widget buildBottomFlagWidget() {
    return Positioned(
        bottom: 0,
        left: 0,
        child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: GestureDetector(
              onTap: () {
                showPub();
              },
              child: Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                'http://pic.netbian.com/uploads/allimg/200917/223220-1600353140abd8.jpg',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text('作者名称',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              color: Colors.blue,
                              onPressed: () {},
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      Text(
                        '内容文字实例'
                        '内容文字实例'
                        '内容文字实例'
                        '内容文字实文字实文字实文字实文字实例'
                        '内容文字实例'
                        '内容文字实例'
                        '内容文字实例内'
                        '容文字实例',
                        style: TextStyle(color: Colors.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  )),
            )));
  }

  void showPub() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 600,
              color: Colors.black,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('详情',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 24,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                        'http://pic.netbian.com/uploads/allimg/200917/223220-1600353140abd8.jpg',
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text('作者名称',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      Text('xxxx粉丝',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    color: Colors.blue,
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          ),
                          Text(
                            '内容文字实例'
                            '内容文字实例'
                            '内容文字实例'
                            '内容文字实文字实文字实文字实文字实例'
                            '内容文字实例'
                            '内容文字实例'
                            '内容文字实例内'
                            '容文字实例',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                '2018-11-01',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 15),
                              Text(
                                '观看人数xxxxx',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Text('评论',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                                Container(
                                  width: 80,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text('最热',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      Text('最新',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.network(
                                          'http://pic.netbian.com/uploads/allimg/200917/223220-1600353140abd8.jpg',
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('用户昵称11',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                        Text('10-22',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                    child: Text('点赞',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)))
                              ],
                            ),
                          )
                        ],
                      )),
                ],
              ));
        });
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    _chewieController.dispose();
    _timer?.cancel();
    _timer = null;
  }
}
