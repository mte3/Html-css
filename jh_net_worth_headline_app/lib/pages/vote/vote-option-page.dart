import 'package:flutter/material.dart';

//投票选项
class VoteOptionPage extends StatefulWidget {
  @override
  _VoteOptionPageState createState() => _VoteOptionPageState();
}

class _VoteOptionPageState extends State<VoteOptionPage> {
  List<String> postList = [];
  List<Widget> item;
  FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    item = [
      RichTextWidget(
        itemList: postList,
        focusNode: _focusNode,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("投票选项"),
        actions: <Widget>[
          InkWell(
            onTap: () async {
              print('提交数组为$postList');
              _focusNode.unfocus();
            },
            child: Image.asset("assets/images/vote/save.png"),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return item[index];
              },
              itemCount: item.length,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 13.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  item.add(
                    RichTextWidget(
                      title: '选项${item.length + 1}',
                      itemList: postList,
                      focusNode: _focusNode,
                    ),
                  );
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/vote/add.png"),
                  SizedBox(width: 4.0),
                  Text(
                    "添加选项",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xff1890FF),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RichTextWidget extends StatefulWidget {
  final String title;
  final List itemList;
  final FocusNode focusNode;
  const RichTextWidget(
      {Key key, this.title = '选项1', this.itemList, this.focusNode})
      : super(key: key);
  @override
  _RichTextWidgetState createState() => _RichTextWidgetState();
}

class _RichTextWidgetState extends State<RichTextWidget> {
  TextEditingController _textC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 6.0,
      ),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 9.0),
            child: Row(
              children: <Widget>[
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xff1890FF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 32.0,
                      right: 24.0,
                    ),
                    child: Image.asset("assets/images/vote/image.png"),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(right: 24.0),
                    child: Image.asset("assets/images/vote/text.png"),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(right: 24.0),
                    child: Image.asset("assets/images/vote/link.png"),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(right: 24.0),
                    child: Image.asset("assets/images/vote/camera.png"),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Image.asset("assets/images/vote/close.png"),
                  ),
                ),
              ],
            ),
          ),
          //文本域
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(
              bottom: 8.0,
            ),
            padding: EdgeInsets.only(
              top: 8.0,
              right: 16.0,
              bottom: 18.0,
              left: 16.0,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xffF5F5F5),
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _textC,
                maxLines: 4,
                focusNode: widget.focusNode,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "输入话题",
                  hintStyle: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xffA6A6A6),
                  ),
                  contentPadding: EdgeInsets.all(0.0),
                ),
                onSubmitted: (v) {
                  setState(() {
                    widget.itemList.add(_textC.text);
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
