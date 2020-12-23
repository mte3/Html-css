import 'package:flutter/material.dart';

class MyConmentPage extends StatefulWidget {
  @override
  _MyConmentPageState createState() => _MyConmentPageState();
}

class _MyConmentPageState extends State<MyConmentPage>
    with TickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: UnconstrainedBox(
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/images/back.png",
                height: 24,
                width: 24,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "我的评论",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: <Widget>[
            Image.asset(
              "assets/images/search.png",
              height: 24,
              width: 24,
            ),
            SizedBox(width: 20)
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: 48,
              child: TabBar(
                tabs: [Tab(text: "我的评论"), Tab(text: "评论我的")],
                controller: _controller,
                indicator: const BoxDecoration(),
                unselectedLabelColor: Colors.grey[300],
                labelColor: Colors.black,
              ),
            ),
            Expanded(
                child: TabBarView(
                    controller: _controller,
                    children: [MyCommentList(), Container()])),
          ],
        ));
  }
}

class MyCommentList extends StatefulWidget {
  @override
  _MyCommentListState createState() => _MyCommentListState();
}

class _MyCommentListState extends State<MyCommentList> {
  List image = [
    {"image": []},
    {
      "image": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600837966036&di=dd132af358a2c1012709fb4c42b16cb2&imgtype=0&src=http%3A%2F%2Fi1.go2yd.com%2Fimage.php%3Furl%3DV_0B1V7cbGBO%26amp%3Btype%3Dthumbnail_220x150",
      ]
    },
    {
      "image": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600837966036&di=dd132af358a2c1012709fb4c42b16cb2&imgtype=0&src=http%3A%2F%2Fi1.go2yd.com%2Fimage.php%3Furl%3DV_0B1V7cbGBO%26amp%3Btype%3Dthumbnail_220x150",
      ]
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 48,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: <Widget>[
              Text(
                "全部评论",
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Text(
                "99条",
                style: TextStyle(fontSize: 14, color: Colors.grey[400]),
              )
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return CommentIndividual(
              list: image[index]["image"],
            );
          },
          itemCount: image.length,
        ))
      ],
    );
  }
}

class CommentIndividual extends StatelessWidget {
  final List list;

  const CommentIndividual({Key key, this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipOval(
                    child: Image.network(
                      "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3155008519,3613446783&fm=11&gp=0.jpg",
                      height: 28,
                      width: 28,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Winnie",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            "assets/images/female.png",
                            width: 9,
                            height: 9,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "2020-04-09",
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey[400]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "20:00",
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey[400]),
                          )
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Image.asset(
                    "assets/images/comment.png",
                    width: 16,
                    height: 16,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "108",
                    style: TextStyle(color: Colors.grey[400], fontSize: 10),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Image.asset(
                    "assets/images/like.png",
                    width: 16,
                    height: 16,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Image.asset(
                    "assets/images/more.png",
                    width: 16,
                    height: 16,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.only(left: 35),
                child: Text(
                  "起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉",
                  style: TextStyle(fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
        list.length == 0
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                color: Colors.grey[100],
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      height: 64,
                      padding: EdgeInsets.only(right: 15),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue[300]),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 2),
                                child: Text(
                                  "原创",
                                  style: TextStyle(
                                      color: Colors.blue[300], fontSize: 10),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.green[300]),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 2),
                                child: Text(
                                  "免费",
                                  style: TextStyle(
                                      color: Colors.green[300], fontSize: 10),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "李清照",
                                style: TextStyle(fontSize: 10),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "1小时",
                                style:
                                    TextStyle(fontSize: 10, color: Colors.grey),
                              ),
                              Spacer(),
                              Image.asset(
                                "assets/images/like.png",
                                width: 16,
                                height: 16,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "108",
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 10),
                              ),
                              SizedBox(width: 15),
                              Image.asset(
                                "assets/images/comment.png",
                                width: 16,
                                height: 16,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "108",
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 10),
                              ),
                              SizedBox(width: 15),
                              Image.asset(
                                "assets/images/share.png",
                                width: 16,
                                height: 16,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "108",
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                color: Colors.grey[100],
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      height: 90,
                      padding: EdgeInsets.only(right: 15),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14),
                          ),
                          Spacer(),
                          Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blue[300]),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 2),
                                child: Text(
                                  "原创",
                                  style: TextStyle(
                                      color: Colors.blue[300], fontSize: 10),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.green[300]),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 2),
                                child: Text(
                                  "免费",
                                  style: TextStyle(
                                      color: Colors.green[300], fontSize: 10),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "李清照",
                                style: TextStyle(fontSize: 10),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "1小时",
                                style:
                                    TextStyle(fontSize: 10, color: Colors.grey),
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: <Widget>[
                              Image.asset(
                                "assets/images/like.png",
                                width: 16,
                                height: 16,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "108",
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 10),
                              ),
                              SizedBox(width: 15),
                              Image.asset(
                                "assets/images/comment.png",
                                width: 16,
                                height: 16,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "108",
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 10),
                              ),
                              SizedBox(width: 15),
                              Image.asset(
                                "assets/images/share.png",
                                width: 16,
                                height: 16,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "108",
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 10),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
                    Image.network(
                      list[0],
                      height: 90,
                      width: 107,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
        Container(
          height: 8,
          color: Colors.grey[200],
        )
      ],
    );
  }
}
