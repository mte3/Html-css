import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  TextEditingController _text;
  @override
  void initState() {
    super.initState();
    _text = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.more_horiz,
              ),
            )
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[_contentWidget()],
        ),
        bottomNavigationBar: Container(
            child: new AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets, //边距（必要）
          duration: const Duration(milliseconds: 100), //时常 （必要）
          child: _bottomBar(),
        )));
  }

  Widget _contentWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 标题
          Text(
            '315之后，电子烟未断燃',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          // 时间
          Text(
            '今天 08:37',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 10),
          // 图片
          Image.network(
            'http://hbimg.b0.upaiyun.com/a3e592c653ea46adfe1809e35cd7bc58508a6cb94307-aaO54C_fw658',
            height: 200,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 15),
          //文章内容
          Text('当电子烟登上315晚会后，深处北京的电子烟线下店店主李某觉得\n松了一口气'),
          Text('李某想神王描述，3月15日当天上午点支烟途中就已经有消息称可能会被315点名，'
              '李某想神王描述，3月15日当天上午点支烟途中就已经有消息称可能会被315点名李某想神王描述，'
              '3月15日当天上午点支烟途中就已经有消息称可能会被315点名李某想神王描述，'
              '3月15日当天上午点支烟途中就已经有息称可能会被315点名李某想神王描述，'
              '3月15日当天上午点支烟途中就已经有消息称可能会被315点名李某想神王描述，'
              '3月15日当天上午点支烟途中就已经有息称可能会被315点名李某想神王描述，'
              '3月15日当天上午点支烟途中就已经有消息称可能会被315点名李某想神王描述，'
              '3月15日当天上午点支烟途中就已经有消息称可能会被315点名李某想神王描述，'
              '3月15日当天上午点支烟途中就已经有消息称可能会被315点名'),
//          _bottomBar()
        ],
      ),
    );
  }

  Widget _bottomBar() {
    double _screenWidth() {
      return MediaQuery.of(context).size.width;
    }

    return Container(
        decoration: BoxDecoration(border: Border(top: BorderSide(width: 0.2))),
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Flexible(
                flex: 1,
                child: Container(
                  constraints: BoxConstraints(
                      maxHeight: 144.0,
                      maxWidth: _screenWidth(),
                      minHeight: 48.0,
                      minWidth: _screenWidth()),
                  padding: EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 10.0, bottom: 10.0),
                  child: TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    controller: _text,
                    decoration: InputDecoration.collapsed(
                        filled: true,
                        fillColor: Color.fromRGBO(244, 245, 249, 1),
                        hintText: "我要参与",
                        hintStyle: TextStyle(fontSize: 16)),
                  ),
                )),
            Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.message),
                    Icon(Icons.cake),
                    Icon(Icons.share)
                  ],
                ))
          ],
        ));
  }
}
