import 'package:flutter/material.dart';

class articleDetails extends StatefulWidget {
  @override
  _articleDetailsState createState() => _articleDetailsState();
}

class _articleDetailsState extends State<articleDetails> {
  TextEditingController _text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16, right: 8),
              child: Text(
                '文章标题示例，文章标题示例，文章标题示例，文章标题示例',
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 14, right: 14),
              child: Row(
                children: <Widget>[
                  ClipOval(
                    child: Image.network(
                      'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=151472226,3497652000&fm=26&gp=0.jpg',
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      children: <Widget>[
                        Text('发布者名称'),
                        SizedBox(
                          height: 4,
                        ),
                        Text('06-01 09:09')
                      ],
                    ),
                  ),
                  Spacer(),
                  RaisedButton(
                    color: Color.fromRGBO(0, 102, 255, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    onPressed: (){

                    },
                    child: Text(
                      '关注',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Image.network(
                  'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1473836766,4030812874&fm=26&gp=0.jpg'),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(
                '文章标题示例，文章标题示例，文章标题示例，文章标题示例,文章标题示例，文章标题示例，文章标题示例，文章标题示例,文章标题示例，文章标题示例，文章标题示例，文章标题示例，文章标题示例，文章标题示例，文章标题示例，文章标题示例',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(
                '文章标题示例，文章标题示例，文章标题示例，文章标题示例,文章标题示例，文章标题示例，文章标题示例，文章标题示例,文章标题示例，文章标题示例，文章标题示例，文章标题示例，文章标题示例，文章标题示例，文章标题示例，文章标题示例',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
            child: new AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets, //边距（必要）
          duration: const Duration(milliseconds: 100), //时常 （必要）
          child: _bottomBar(),
        )));
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
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Color.fromRGBO(244, 245, 249, 1),
                        hintText: "发表你的评论",
                        hintStyle: TextStyle(fontSize: 16)),
                  ),
                )),
            Flexible(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: <Widget>[
                    Icon(Icons.bug_report),
                    Spacer(),
                    Text('1.2w'),
                    Spacer(),
                    Icon(Icons.more),
                    Spacer(),
                    Text('8255'),
                    Spacer(),
                    Icon(Icons.share),
                    Spacer(),
                  ],
                ))
          ],
        ));
  }
}
