import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'comment_widget.dart';

///阅读者-图文-评论-结果

class ReaderCommentResultPage extends StatefulWidget {
  @override
  _ReaderCommentResultPageState createState() => _ReaderCommentResultPageState();
}

class _ReaderCommentResultPageState extends State<ReaderCommentResultPage> {

  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  var thumbs = [10,11,12,13,14,15];
  //音频
  AudioPlayer audioPlayer = AudioPlayer();
  Duration _duration;
  double totalLength = 0.0;
  double currentLength = 0.0;
  double sliderValue;
  bool isPlayer=true;
  @override
  void initState() {
    super.initState();
    ///视频
    _videoPlayerController = VideoPlayerController.network('https://www.runoob.com/try/demo_source/mov_bbb.mp4');
    _chewieController=ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 343/193,
      autoPlay: true,
      looping: false,
    );
    ///音频
    audioPlayer.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);
      totalLength = _duration.inSeconds.toDouble();
      print("总进度$duration");
    });
    audioPlayer.onAudioPositionChanged.listen((p){
      // p参数可以获取当前进度，也是可以调整的，比如p.inMilliseconds
      currentLength = p.inSeconds.toDouble();
      print(p.inSeconds);
      print('当前进度$currentLength');
      setState(() {});
    });
    timer();
  }

  timer(){
    int seconds = 0;
    Timer.periodic(Duration(seconds: 1), (timer) {
      showToastColor(context,'扣费成功，您的评论已发布',backgroundColor: Color(0xff7EBFFC));
      if(seconds>6){
        timer.cancel();
        return;
      }
      seconds ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: UnconstrainedBox(
            child: InkWell(
              child:Image.network("https://img02.mockplus.cn/idoc/xd/2020-06-03/59728c86-a3f5-40ec-8a10-a4602e87b017.png",
                width: 24,
                height: 24,
              ),
              onTap: ()=>Navigator.of(context).pop(),
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 16,right: 16,),
              margin: EdgeInsets.only(top: 8),
              height: 48,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Text('评论',style: TextStyle(
                    color: Color(0xff262626),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),),
                  Spacer(),
                  Text('共2条',
                    style: TextStyle(
                      color: Color(0xffBFBFBF),
                      fontSize: 12,
                    ),),
                ],
              ),
            ),
            CommentWidget(
              url: 'https://img02.mockplus.cn/idoc/xd/2020-06-03/c4bef8a7-852d-4a58-bc74-f44441341e52.png',
              text1: '赵明诚',
              text2: '2020-04-19',
              text3: '20:00',
              thumb: thumbs[0],
              content: '长恨此身非我有，何时忘却营营。',
              reply: '苏老，营营是谁啊…👩‍👩‍👦‍👦',
              author: '李清照：',
              onTapP: (){},
              onTapZ: (){
                setState(() {
                  thumbs[0]++;
                });
              },
              onTapM: (){},
            ),
            CommentWidget(
              url: 'https://img02.mockplus.cn/idoc/xd/2020-06-03/c4bef8a7-852d-4a58-bc74-f44441341e52.png',
              text1: '赵明诚',
              text2: '2020-04-19',
              text3: '20:00',
              thumb: thumbs[1],
              content: '娘子好文采~❤❤❤',
              reply: '呵呵呵呵呵呵呵呵',
              author: '李清照：',
              onTapP: (){},
              onTapZ: (){
                setState(() {
                  thumbs[1]++;
                });
              },
              onTapM: (){},
            ),
            CommentImageWidget(
              url: 'https://img02.mockplus.cn/idoc/xd/2020-06-03/c4bef8a7-852d-4a58-bc74-f44441341e52.png',
              text1: '赵明诚',
              text2: '2020-04-19',
              text3: '20:00',
              thumb:thumbs[2],
              time: '2020-04-16',
              img: 'https://img02.mockplus.cn/idoc/xd/2020-06-03/d62cab2c-2907-41ea-b8bf-48fd94fb704f.png',
              onTapP: (){},
              onTapZ: (){
                setState(() {
                  thumbs[2]++;
                });
              },
              onTapM: (){},
            ),
            CommentPlayerWidget(
              url: 'https://img02.mockplus.cn/idoc/xd/2020-06-03/c4bef8a7-852d-4a58-bc74-f44441341e52.png',
              text1: '赵明诚',
              text2: '2020-04-19',
              text3: '20:00',
              thumb: thumbs[3],
              time: '2020-04-16',
              player:Chewie(
                controller: _chewieController,
              ) ,
              onTapP: (){},
              onTapZ: (){
                setState(() {
                  thumbs[3]++;
                });
              },
              onTapM: (){},
            ),
            CommentPlayerWidget(
              url: 'https://img02.mockplus.cn/idoc/xd/2020-06-03/c4bef8a7-852d-4a58-bc74-f44441341e52.png',
              text1: '赵明诚',
              text2: '2020-04-19',
              text3: '20:00',
              thumb: thumbs[4],
              time: '2020-04-16',
              player:Container(
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        InkWell(
                          child:Image.asset('assets/music.png'),
                          onTap: (){
                            setState(() {
                              if(isPlayer==true){
                                play();
                                isPlayer=false;
                              }else
                              {
                                pause();
                                isPlayer=true;
                              }
                            });
                          },
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/1.4,
                          child:    Builder(
                            builder: (content){
                              return Slider(
                                max: totalLength,
                                onChanged: (v) {
                                  currentLength = v ;
                                  sliderValue = v;
                                  audioPlayer
                                      .seek(Duration(seconds: sliderValue == null ? currentLength.round() : sliderValue.toInt(),),);
                                  print('sliderValue$sliderValue');
                                  print('maxmaxmaxmax$totalLength');
                                },
                                value: sliderValue == null ? currentLength : sliderValue,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Text('${sliderValue == null ? currentLength : sliderValue}s',
                      style: TextStyle(
                        color: Color(0xffBFBFBF),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ) ,
              onTapP: (){},
              onTapZ: (){
                setState(() {
                  thumbs[4]++;
                });
              },
              onTapM: (){},
            ),
            CommentWidget(
              url: 'https://img02.mockplus.cn/idoc/xd/2020-06-03/c4bef8a7-852d-4a58-bc74-f44441341e52.png',
              text1: '李煜',
              text2: '2020-04-19',
              text3: '20:00',
              thumb:thumbs[5],
              content: '欢迎关注个人主页，有诗有酒有故事~🍹',
              link: 'https://www.Houzhu-Li.com/',
              isLink: true,
              onTapP: (){},
              onTapZ: (){
                setState(() {
                  thumbs[5]++;
                });
              },
              onTapM: (){},
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15),
              alignment: Alignment.center,
              child: Text('已显示全部',
                style: TextStyle(
                  color: Color(0xffBFBFBF),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
//  播放
  play() async {
//    int result = await audioPlayer.play("http://ev.sycdn.kuwo.cn/71b0a788772157eeb06a39657683f04e/5ee7250f/resource/n1/64/3/1185467459.mp3");
    int result=await audioPlayer.play('https://luan.xyz/files/audio/ambient_c_motion.mp3');
    if (result == 1) {
      print('play success');
    } else {
      print('play failed');
    }
  }
  //结束
  pause() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      print('pause success');
    } else {
      print('pause failed');
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    audioPlayer.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
