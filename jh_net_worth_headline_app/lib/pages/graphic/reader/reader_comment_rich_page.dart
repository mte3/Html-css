import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:networth/pages/graphic/reader/edit_rich_view_widget.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';

///阅读者-图文-评论-富文本编辑

class ReaderCommentRichPage extends StatefulWidget {
  @override
  _ReaderCommentRichPageState createState() => _ReaderCommentRichPageState();
}

class _ReaderCommentRichPageState extends State<ReaderCommentRichPage> {

  static Delta getDelta() =>
      Delta.fromJson(json.decode(r'[{"insert":"\n"}]') as List);

  final ZefyrController _controller =
  ZefyrController(NotusDocument.fromDelta(getDelta()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '发评论',
          style: TextStyle(color: Colors.black,fontSize: 18),
        ),
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
        actions: <Widget>[
          InkWell(
            child:Image.network("https://img02.mockplus.cn/idoc/xd/2020-06-03/4b7cc154-ebee-4593-863f-3096a37ec376.png",
              width: 24,
              height: 24,
            ),
            onTap: (){},

          ),
          SizedBox(width: 16,)
        ],
      ),
      body: Column(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            height: MediaQuery.of(context).size.height * 0.4,
            child: new EditRichViewWidget(
              contentC: _controller,
              hintText: '请编辑内容',
            ),
          ),
        ],
      ),
    );
  }
}
