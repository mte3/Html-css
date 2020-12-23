import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class CommentWidget extends StatelessWidget {
  final String url;
  final String text1;
  final String text2;
  final String text3;
  final int thumb;
  final String content;
  final String reply ;
  final String author;
  final String link;
  final bool isLink;
  final Function onTapP;
  final Function onTapZ;
  final Function onTapM;
  CommentWidget({
    this.thumb=10,
    this.onTapP,
    this.onTapM,
    this.onTapZ,
    this.isLink=false,
    this.url,
    this.text1,
    this.text2,
    this.text3,
    this.content,
    this.reply,
    this.author,
    this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        top: 10,
        left: 16,
        right: 16,
        bottom: 15,
      ),
      margin: EdgeInsets.only(
        bottom: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(32/2),
                child: CachedNetworkImage(
                  imageUrl: '$url',
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,),
              ),
              SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('$text1',style: TextStyle(
                        color: Color(0xff262626),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(width: 8,),
                      Image.network(
                        "https://img02.mockplus.cn/idoc/xd/2020-06-03/c2c972dc-aa46-41a6-83ea-94eb315a303c.png",
                      width: 9,
                      height: 9,
                      ),
                    ],
                  ),
                  SizedBox(height: 3,),
                  Row(
                    children: <Widget>[
                      Text('$text2',style: TextStyle(
                        color: Color(0xff8C8C8C),
                        fontSize: 10,
                      ),),
                      SizedBox(width: 8,),
                      Text('$text3',style: TextStyle(
                        color:Color(0xff8C8C8C),
                        fontSize: 10,
                      ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: onTapP,
                child:  Image.network('https://img02.mockplus.cn/idoc/xd/2020-06-03/0a468b6a-b632-4594-b7a3-6d849053d03a.png',
                  color: Colors.grey,width: 16,height: 16,),
              ),
              SizedBox(width: 18,),
              Text('$thumb',
                style: TextStyle(
                  color: Color(0xffBFBFBF),
                  fontSize: 10,
                ),),
              SizedBox(width: 4,),
              InkWell(
                onTap: onTapZ,
                child:Image.network('https://img02.mockplus.cn/idoc/xd/2020-06-03/ba55b066-207a-43bf-b508-64d1d8a468aa.png',
                  color: Colors.grey,width: 16,height: 16,),
              ),
              SizedBox(width: 32,),
              InkWell(
                onTap: onTapM,
                child: Image.network('https://img02.mockplus.cn/idoc/xd/2020-06-03/e0c2d8e5-d500-47c3-a054-1d2802745762.png',
                  color: Colors.grey,width: 16,height: 16,),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 36),
            child: isLink==false
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    '$content',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xff212121),
                      fontSize: 12,
                    ),
                  ),
                ),
                author == ''
                    ? Container():Container(
                  padding:  EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xffE9E9E9),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Text('$author',
                        style: TextStyle(
                          color: Color(0xff262626),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('$reply',
                        style: TextStyle(
                          color: Color(0xff262626),
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        padding:  EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                        decoration: BoxDecoration(
                          color: Color(0xff7EBFFC),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Text('作者回复',
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: <Widget>[
                      Text(
                        '$link',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xff1890FF),
                          fontSize: 12,
                        ),
                      ),
                      Image.network(
                        "https://img02.mockplus.cn/idoc/xd/2020-06-03/c2c972dc-aa46-41a6-83ea-94eb315a303c.png",
                        width: 9,
                        height: 9,
                      ),
                    ],
                  ),
                ),
                Text('$content',
                  style: TextStyle(
                    color: Color(0xff595959),
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 24,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class CommentImageWidget extends StatelessWidget {
  final String url;
  final String text1;
  final String text2;
  final String text3;
  final int thumb;
  final String time;
  final String img;
  final Function onTapP;
  final Function onTapZ;
  final Function onTapM;
  CommentImageWidget({
    this.thumb=10,
    this.onTapP,
    this.onTapM,
    this.onTapZ,
    this.url,
    this.text1,
    this.text2,
    this.text3,
    this.time,
    this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        top: 10,
        left: 16,
        right: 16,
        bottom: 15,
      ),
      margin: EdgeInsets.only(
        bottom: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(32/2),
                child: CachedNetworkImage(
                  imageUrl: '$url',
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,),
              ),
              SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('$text1',style: TextStyle(
                        color: Color(0xff262626),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(width: 8,),
                      Image.network(
                        "https://img02.mockplus.cn/idoc/xd/2020-06-03/c2c972dc-aa46-41a6-83ea-94eb315a303c.png",
                        width: 9,
                        height: 9,
                      ),
                    ],
                  ),
                  SizedBox(height: 3,),
                  Row(
                    children: <Widget>[
                      Text('$text2',style: TextStyle(
                        color: Color(0xff8C8C8C),
                        fontSize: 10,
                      ),),
                      SizedBox(width: 8,),
                      Text('$text3',style: TextStyle(
                        color:Color(0xff8C8C8C),
                        fontSize: 10,
                      ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: onTapP,
                child: Image.network('https://img02.mockplus.cn/idoc/xd/2020-06-03/0a468b6a-b632-4594-b7a3-6d849053d03a.png',
                  color: Colors.grey,width: 16,height: 16,),
              ),
              SizedBox(width: 18,),
              Text('$thumb',
                style: TextStyle(
                  color: Color(0xffBFBFBF),
                  fontSize: 10,
                ),),
              SizedBox(width: 4,),
              InkWell(
                onTap: onTapZ,
                child:Image.network('https://img02.mockplus.cn/idoc/xd/2020-06-03/ba55b066-207a-43bf-b508-64d1d8a468aa.png',
                  color: Colors.grey,width: 16,height: 16,),
              ),
              SizedBox(width: 32,),
              InkWell(
                onTap: onTapM,
                child: Image.network('https://img02.mockplus.cn/idoc/xd/2020-06-03/e0c2d8e5-d500-47c3-a054-1d2802745762.png',
                  color: Colors.grey,width: 16,height: 16,),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 26,bottom: 13),
            child: Image.network(
              '$img',
              fit: BoxFit.cover,),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(color: Color(0xFF7EBFFC), width: 1)
                        ),
                        child: Text(
                          '广告',
                          style: TextStyle(color: Color(0xFF7EBFFC), fontSize: 10),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text('$time',
                        style: TextStyle(
                          color: Color(0xff8C8C8C),
                          fontSize: 10,
                        ),),
                    ],
                  ),
                ),
                Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   border: Border.all(color: Color(0xff8C8C8C))
                 ),
                    child: Icon(
                      Icons.clear, color: Color(0xff8C8C8C),size: 15,
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class CommentPlayerWidget extends StatelessWidget {
  final String url;
  final String text1;
  final String text2;
  final String text3;
  final int thumb;
  final String time;
  final Widget player;
  final Function onTapP;
  final Function onTapZ;
  final Function onTapM;
  CommentPlayerWidget({
    this.thumb=10,
    this.onTapP,
    this.onTapM,
    this.onTapZ,
    this.url,
    this.text1,
    this.text2,
    this.text3,
    this.time,
    this.player,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        top: 10,
        left: 16,
        right: 16,
        bottom: 15,
      ),
      margin: EdgeInsets.only(
        bottom: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(32/2),
                child: CachedNetworkImage(
                  imageUrl: '$url',
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,),
              ),
              SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('$text1',style: TextStyle(
                        color: Color(0xff262626),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(width: 8,),
                      Image.network(
                        "https://img02.mockplus.cn/idoc/xd/2020-06-03/c2c972dc-aa46-41a6-83ea-94eb315a303c.png",
                        width: 9,
                        height: 9,
                      ),
                    ],
                  ),
                  SizedBox(height: 3,),
                  Row(
                    children: <Widget>[
                      Text('$text2',style: TextStyle(
                        color: Color(0xff8C8C8C),
                        fontSize: 10,
                      ),),
                      SizedBox(width: 8,),
                      Text('$text3',style: TextStyle(
                        color:Color(0xff8C8C8C),
                        fontSize: 10,
                      ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: onTapP,
                child: Image.network('https://img02.mockplus.cn/idoc/xd/2020-06-03/0a468b6a-b632-4594-b7a3-6d849053d03a.png',
                  color: Colors.grey,width: 16,height: 16,),
              ),
              SizedBox(width: 18,),
              Text('$thumb',
                style: TextStyle(
                  color: Color(0xffBFBFBF),
                  fontSize: 10,
                ),),
              SizedBox(width: 4,),
              InkWell(
                onTap: onTapZ,
                child:Image.network('https://img02.mockplus.cn/idoc/xd/2020-06-03/ba55b066-207a-43bf-b508-64d1d8a468aa.png',
                  color: Colors.grey,width: 16,height: 16,),
              ),
              SizedBox(width: 32,),
              InkWell(
                onTap: onTapM,
                child: Image.network('https://img02.mockplus.cn/idoc/xd/2020-06-03/e0c2d8e5-d500-47c3-a054-1d2802745762.png',
                  color: Colors.grey,width: 16,height: 16,),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 26,bottom: 13),
            child:player,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(color: Color(0xFF7EBFFC), width: 1)
                        ),
                        child: Text(
                          '广告',
                          style: TextStyle(color: Color(0xFF7EBFFC), fontSize: 10),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text('$time',
                        style: TextStyle(
                          color: Color(0xff8C8C8C),
                          fontSize: 10,
                        ),),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xff8C8C8C))
                  ),
                  child: Icon(
                    Icons.clear, color: Color(0xff8C8C8C),size: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


//改变吐司框背景颜色
showToastColor(BuildContext context, String msg, {int duration = 2, int gravity,backgroundColor}) {
  Toast.show(msg ?? '未知错误', context, duration: duration, gravity: gravity,backgroundColor: backgroundColor);
}