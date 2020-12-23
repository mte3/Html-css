import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> with SingleTickerProviderStateMixin {
  var controller;
  var tabs = <Tab>[
    Tab(
      text: "推荐",
    ),
    Tab(
      text: "初创",
    ),
    Tab(
      text: "特写",
    ),
    Tab(
      text: "科技",
    ),
    Tab(
      text: "出行",
    ),
    Tab(
      text: "消费",
    ),
    Tab(
      text: "海外",
    ),
  ];

  @override
  void initState() {
    controller = TabController(
      length: tabs.length,
      vsync: this, //动画效果的异步处理，默认格式，背下来即可
    );
  }

  List pic = [
    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3922290090,3177876335&fm=26&gp=0.jpg",
    "http://kr.shaodiyejin.com/file/2020/0818/14957866009659d5b7338c245ae957c4.jpg",
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3446442004,2207547936&fm=26&gp=0.jpg",
    "http://kr.shaodiyejin.com/file/2020/0818/14957866009659d5b7338c245ae957c4.jpg",
  ];
  String pho = 'https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1906469856,4113625838&fm=26&gp=0.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Text(
                '首页',
                style: TextStyle(fontSize: 22),
              ),
              Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Text(
                    '发现',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Text(
                    '快讯',
                    style: TextStyle(fontSize: 18),
                  )),
              Spacer(),
              Icon(Icons.search)
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            color: Color.fromRGBO(244, 248, 251, 1),
            child: Center(
              child: Text(
                '融资速递：WarDucks完成A轮融资',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 12),
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Swiper(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Image.network(
                  pic[index],
                  fit: BoxFit.fill,
                );
              },
              itemCount: pic.length,
              pagination: buildSwiperPagination(),
              autoplay: true,
              onTap: (index) {
                print(" 点击 " + index.toString());
              },
              viewportFraction: 1,
              autoplayDisableOnInteraction: true,
              loop: true,
              scale: 1,
            ),
          ),
          Container(
            child: TabBar(
              controller: controller,
              isScrollable: true,
              indicatorColor: Color(0xffff0000),
              indicatorWeight: 1,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.only(bottom: 10.0),
              labelPadding: EdgeInsets.only(left: 20),
              labelColor: Color(0xff333333),
              labelStyle: TextStyle(
                fontSize: 20.0,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 16.0,
              ),
              tabs: tabs,
            ),
          ),
          Container(
         height: 360,
            child: TabBarView(
                controller: controller,
                children: tabs
                    .map((Tab tab) => ListView(
                          children: <Widget>[
                           Mes(mes: '腾讯没有想象的那么糟,触底反弹值得期待',time: '58分钟前',num: '869',p: pho,),
                            Mes(mes: '腾讯没有想象的那么糟,触底反弹值得期待',time: '58分钟前',num: '869',p: pho,),
                            Mes(mes: '腾讯没有想象的那么糟,触底反弹值得期待',time: '58分钟前',num: '869',p: pho,),
                            Mes(mes: '腾讯没有想象的那么糟,触底反弹值得期待',time: '58分钟前',num: '869',p: pho,),
                          ],
                        ))
                    .toList()),
          ),
        ],
      ),
    );
  }
}

// 轮播图指示器
buildSwiperPagination() {
  return SwiperPagination(
    alignment: Alignment.bottomCenter,
    margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
    builder: DotSwiperPaginationBuilder(
        space: 2,
        size: 6,
        activeSize: 12,
        color: Colors.white,
        activeColor: Colors.black87),
  );
}

class Mes extends StatelessWidget {
  final String mes;
  final String time;
  final String  p;
  final String num;

  const Mes({Key key, this.mes, this.time,  this.num, this.p}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: Color(0xffEDEDED),
                  width: 1,
                  style: BorderStyle.solid),
              bottom: BorderSide(
                  color: Color(0xffEDEDED),
                  width: 1,
                  style: BorderStyle.solid))),
      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(mes)),
              Container(
                margin:
                EdgeInsets.only(left: 20, top: 16),
                child: Row(
                  children: <Widget>[
                    Text(
                      time,
                      style:
                      TextStyle(color: Colors.grey),
                    ),
                    Text(
                      num,
                      style:
                      TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.only(left: 20),
              child: Image.network(
                p,
                width: 90,
                height: 90,
              ))
        ],
      ),
    );
  }
}
