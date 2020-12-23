import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Third extends StatefulWidget {
  @override
  _ThirdState createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 12, top: 4, bottom: 4),
            margin: EdgeInsets.all(12),
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                border: Border.all(width: 1, color: Colors.grey)),
            child: Row(
              children: <Widget>[
                Icon(Icons.search),
                VerticalDivider(
                  color: Colors.black,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(0),
                        hintText: '搜索你需要的课程！',
                        helperStyle: TextStyle()),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 12),
            height: 200,
              width: MediaQuery.of(context).size.width,
              child: Swiper(
                scrollDirection: Axis.horizontal,
                  itemBuilder: ( context, index){
                  return Image.network(pic[index],fit: BoxFit.fill,);
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
          GridView.builder(
              itemCount: mid.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 0,
                crossAxisSpacing: 20,
                  childAspectRatio:1
          ),
              itemBuilder: (context,index){
                return Container(
                  width: MediaQuery.of(context).size.width/5,
                  height: MediaQuery.of(context).size.width/5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      mid[index][0],
                      SizedBox(
                        height: 10,
                      ),
                      Text(mid[index][1])
                    ],
                  ),
                );
          }),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '全部课程',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '更多', style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
          GridView.builder(
              itemCount: bot.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
                  childAspectRatio:2.5
              ),
              itemBuilder: (context,index){
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(16))
                  ),
                  width: MediaQuery.of(context).size.width/4 ,
                  height:  MediaQuery.of(context).size.width/8,
                  child: Text(bot[index],style: TextStyle(
                    color: Colors.white
                  ),),
                );
              }),
        ],
      ),
    );
  }
}
List bot = [
  '创业融资',
  '股权财税',
  '认知升级',
  '市场运营',
  '战略创新',
  '组织管理',
];
List mid = [
  [Icon(Icons.border_all),'全部课程'],
  [Icon(Icons.person_outline),'找投资人'],
  [Icon(Icons.featured_play_list),'创业百科'],
  [Icon(Icons.play_circle_filled),'有声书'],
  [Icon(Icons.album),'会员专区'],
  [Icon(Icons.filter_frames),'领取礼物'],
  [Icon(Icons.add_shopping_cart),'我的商店'],
  [Icon(Icons.share),'分享中心'],

];
List pic = [
  "http://hbimg.b0.upaiyun.com/a3e592c653ea46adfe1809e35cd7bc58508a6cb94307-aaO54C_fw658",
  "http://hbimg.b0.upaiyun.com/a3e592c653ea46adfe1809e35cd7bc58508a6cb94307-aaO54C_fw658",
  "http://hbimg.b0.upaiyun.com/a3e592c653ea46adfe1809e35cd7bc58508a6cb94307-aaO54C_fw658",
  "http://hbimg.b0.upaiyun.com/a3e592c653ea46adfe1809e35cd7bc58508a6cb94307-aaO54C_fw658",
  ];
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
        //选中时的颜色
        activeColor: Colors.black87),
  );
}