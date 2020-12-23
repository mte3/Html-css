import 'package:flutter/material.dart';

///阅读者-图文评论-普通

class ReaderCommentPage extends StatefulWidget {
  @override
  _ReaderCommentPageState createState() => _ReaderCommentPageState();
}

class _ReaderCommentPageState extends State<ReaderCommentPage> {
  TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: Colors.white,
          title: Text('发评论',style: TextStyle(color: Colors.black,fontSize: 18),),
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
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _controller,
                maxLines: 10,
                decoration: const InputDecoration(
                  hintText: '世事漫随流水，算来一梦浮生。醉乡路稳宜频至，他处不堪行……',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xff4D4D4D),
                  ),
                  contentPadding: const EdgeInsets.only(left: 8.0,top: 8),
                  border: InputBorder.none,
                ),
                onChanged: (val) {
                  print(val);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
