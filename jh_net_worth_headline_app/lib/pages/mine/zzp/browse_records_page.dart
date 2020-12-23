import 'package:flutter/material.dart';

class BrowseRecordsPage extends StatefulWidget {
  @override
  _BrowseRecordsPageState createState() => _BrowseRecordsPageState();
}

class _BrowseRecordsPageState extends State<BrowseRecordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: UnconstrainedBox(
          child: GestureDetector(
            onTap: () {
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
          "浏览记录",
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
      body: BrowseRecordsList(),
    );
  }
}

class BrowseRecordsList extends StatefulWidget {
  @override
  _BrowseRecordsListState createState() => _BrowseRecordsListState();
}

class _BrowseRecordsListState extends State<BrowseRecordsList> {
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
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600837966036&di=dd132af358a2c1012709fb4c42b16cb2&imgtype=0&src=http%3A%2F%2Fi1.go2yd.com%2Fimage.php%3Furl%3DV_0B1V7cbGBO%26amp%3Btype%3Dthumbnail_220x150",
      ]
    },
    {
      "image": [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600837966036&di=dd132af358a2c1012709fb4c42b16cb2&imgtype=0&src=http%3A%2F%2Fi1.go2yd.com%2Fimage.php%3Furl%3DV_0B1V7cbGBO%26amp%3Btype%3Dthumbnail_220x150",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600837966036&di=dd132af358a2c1012709fb4c42b16cb2&imgtype=0&src=http%3A%2F%2Fi1.go2yd.com%2Fimage.php%3Furl%3DV_0B1V7cbGBO%26amp%3Btype%3Dthumbnail_220x150",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600837966036&di=dd132af358a2c1012709fb4c42b16cb2&imgtype=0&src=http%3A%2F%2Fi1.go2yd.com%2Fimage.php%3Furl%3DV_0B1V7cbGBO%26amp%3Btype%3Dthumbnail_220x150",
      ]
    }
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            recordsIndividual(
                image[index]["image"].length, image[index]["image"], context),
                Container(height:5)
          ],
        );
      },
      itemCount: image.length,
    );
  }
}

Widget recordsIndividual(int i, List list, context) {
  switch (i) {
    case 0:
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: Colors.grey[100],
        child: Row(
          children: <Widget>[
            Expanded(
                child: Container(
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
                          border: Border.all(width: 1, color: Colors.blue[300]),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                        child: Text(
                          "原创",
                          style:
                              TextStyle(color: Colors.blue[300], fontSize: 10),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.green[300]),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                        child: Text(
                          "免费",
                          style:
                              TextStyle(color: Colors.green[300], fontSize: 10),
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
                        style: TextStyle(fontSize: 10, color: Colors.grey),
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
                        style: TextStyle(color: Colors.grey[400], fontSize: 10),
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
                        style: TextStyle(color: Colors.grey[400], fontSize: 10),
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
                        style: TextStyle(color: Colors.grey[400], fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ],
        ),
      );
      break;
    case 1:
      return Container(
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
                          border: Border.all(width: 1, color: Colors.blue[300]),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                        child: Text(
                          "原创",
                          style:
                              TextStyle(color: Colors.blue[300], fontSize: 10),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.green[300]),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                        child: Text(
                          "免费",
                          style:
                              TextStyle(color: Colors.green[300], fontSize: 10),
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
                        style: TextStyle(fontSize: 10, color: Colors.grey),
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
                        style: TextStyle(color: Colors.grey[400], fontSize: 10),
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
                        style: TextStyle(color: Colors.grey[400], fontSize: 10),
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
                        style: TextStyle(color: Colors.grey[400], fontSize: 10),
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
      );
      break;
    default:
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: Colors.grey[100],
        child: Row(
          children: <Widget>[
            Expanded(
                child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 11,
                    children: <Widget>[
                      Image.network(
                        list[0],
                        width: (MediaQuery.of(context).size.width -
                                32 -
                                11 * (list.length - 1)) /
                            list.length,
                        height: 90,
                      ),
                      Image.network(
                        list[1],
                        width: (MediaQuery.of(context).size.width -
                                32 -
                                11 * (list.length - 1)) /
                            list.length,
                        height: 90,
                      ),
                      list.length >= 3
                          ? Image.network(
                              list[2],
                              width: (MediaQuery.of(context).size.width -
                                      32 -
                                      11 * (list.length - 1)) /
                                  list.length,
                              height: 90,
                            )
                          : Container(),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.blue[300]),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                        child: Text(
                          "原创",
                          style:
                              TextStyle(color: Colors.blue[300], fontSize: 10),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.green[300]),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                        child: Text(
                          "免费",
                          style:
                              TextStyle(color: Colors.green[300], fontSize: 10),
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
                        style: TextStyle(fontSize: 10, color: Colors.grey),
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
                        style: TextStyle(color: Colors.grey[400], fontSize: 10),
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
                        style: TextStyle(color: Colors.grey[400], fontSize: 10),
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
                        style: TextStyle(color: Colors.grey[400], fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ],
        ),
      );
  }
}
