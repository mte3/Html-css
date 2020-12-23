import 'package:flutter/material.dart';

///阅读者-图文-评论-富文本编辑-收费

class ReaderCommentChargePage extends StatefulWidget {
  @override
  _ReaderCommentChargePageState createState() => _ReaderCommentChargePageState();
}

class _ReaderCommentChargePageState extends State<ReaderCommentChargePage> {
  //图片
  List images=[
    {
      'title':'作品拥有者定价',
      'price':'¥ 0.10/CPC',
    },
    {
      'title':'拟预约点击量',
      'price':'5000',
    },
    {
      'title':'拟发布天数',
      'price':'20',
    },
    {
      'title':'预计广告费用',
      'price':'￥500.00',
    },
  ];
  //音频
  List audio=[
    {
      'title':'作品拥有者定价',
      'price':'¥ 0.50/CPC',
    },
    {
      'title':'拟预约点击量',
      'price':'5000',
    },
    {
      'title':'拟发布天数',
      'price':'20',
    },
    {
      'title':'预计广告费用',
      'price':'￥250.00',
    },
  ];
  //视频
  List video=[
    {
      'title':'作品拥有者定价',
      'price':'¥ 0.10/CPC',
    },
    {
      'title':'拟预约点击量',
      'price':'5000',
    },
    {
      'title':'拟发布天数',
      'price':'20',
    },
    {
      'title':'预计广告费用',
      'price':'￥500.00',
    },
  ];
  //链接
  List link=[
    {
      'title':'作品拥有者定价',
      'price':'¥ 0.30/CPC',
    },
    {
      'title':'拟预约点击量',
      'price':'5000',
    },
    {
      'title':'拟发布天数',
      'price':'20',
    },
    {
      'title':'预计广告费用',
      'price':'￥150.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: Colors.white,
          title: Text('插入内容收费设置',style: TextStyle(color: Colors.black,fontSize: 18),),
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
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 16),
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 25,top: 10),
              child: Text('图片',style: TextStyle(
                color: Color(0xff262626),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
            ),
            Column(
              children: images.map((item){
                return Container(
                  padding: EdgeInsets.only(left: 8,right: 16,bottom: 20),
                  child: Row(
                    children: <Widget>[
                      Text('${item['title']}',
                        style: TextStyle(
                          color: Color(0xff595959),
                          fontSize: 14,
                        ),),
                      Spacer(),
                      Text('${item['price']}',
                        style: TextStyle(
                          color: Color(0xff1890FF),
                          fontSize: 14,
                        ),),
                    ],
                  ),
                );
              }).toList(),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 25,top: 10),
              child: Text('音频',style: TextStyle(
                color: Color(0xff262626),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
            ),
            Column(
              children: audio.map((item){
                return Container(
                  padding: EdgeInsets.only(left: 8,right: 16,bottom: 20),
                  child: Row(
                    children: <Widget>[
                      Text('${item['title']}',
                        style: TextStyle(
                          color: Color(0xff595959),
                          fontSize: 14,
                        ),),
                      Spacer(),
                      Text('${item['price']}',
                        style: TextStyle(
                          color: Color(0xff1890FF),
                          fontSize: 14,
                        ),),
                    ],
                  ),
                );
              }).toList(),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 25,top: 10),
              child: Text('视频',style: TextStyle(
                color: Color(0xff262626),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
            ),
            Column(
              children: video.map((item){
                return Container(
                  padding: EdgeInsets.only(left: 8,right: 16,bottom: 20),
                  child: Row(
                    children: <Widget>[
                      Text('${item['title']}',
                        style: TextStyle(
                          color: Color(0xff595959),
                          fontSize: 14,
                        ),),
                      Spacer(),
                      Text('${item['price']}',
                        style: TextStyle(
                          color: Color(0xff1890FF),
                          fontSize: 14,
                        ),),
                    ],
                  ),
                );
              }).toList(),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 25,top: 10),
              child: Text('链接',style: TextStyle(
                color: Color(0xff262626),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
            ),
            Column(
              children: link.map((item){
                return Container(
                  padding: EdgeInsets.only(left: 8,right: 16,bottom: 20),
                  child: Row(
                    children: <Widget>[
                      Text('${item['title']}',
                        style: TextStyle(
                          color: Color(0xff595959),
                          fontSize: 14,
                        ),),
                      Spacer(),
                      Text('${item['price']}',
                        style: TextStyle(
                          color: Color(0xff1890FF),
                          fontSize: 14,
                        ),),
                    ],
                  ),
                );
              }).toList(),
            ),
            Container(
              margin: EdgeInsets.only(top: 10,bottom: 18),
              child: Text.rich(
                TextSpan(
                    text: '支付总额：',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff8C8C8C),
                    ),
                    children: [
                      TextSpan(
                        text: '¥1,400.00',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff1890FF),
                        ),),
                    ]),
                textAlign: TextAlign.center,
              ),
            ),
            TwoButton(
              buttonText1: '取消',
              buttonText2: '确认',
              onPressed1: () =>Navigator.of(context).pop(),
              onPressed2: () {
                Navigator.of(context).pop();
                print('确认');

              },
            ),
          ],
        ),
      ),
    );
  }
}

/// 按钮
class TwoButton extends StatelessWidget {
  final Function onPressed1;
  final Function onPressed2;
  final String buttonText1;
  final String buttonText2;
  TwoButton(
      {this.onPressed1, this.onPressed2, this.buttonText1, this.buttonText2});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: onPressed1,
              child: Text(
                '$buttonText1',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff8C8C8C),
                ),
              ),
            ),
          ),
          VerticalLine(
            color: Color(0xffD9D9D9),
          ),
          Expanded(
            child: FlatButton(
              onPressed: onPressed2,
              child: Text(
                '$buttonText2',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff1890FF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



/// 竖线
class VerticalLine extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double vertical;

  VerticalLine({
    this.width = 1.0,
    this.height = 25,
    this.color = const Color(0xff000000),
    this.vertical = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: width,
      color: Color(0xffDCE0E5),
      margin: new EdgeInsets.symmetric(vertical: vertical),
      height: height,
    );
  }
}
