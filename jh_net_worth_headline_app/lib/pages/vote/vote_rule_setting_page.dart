import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//投票规则-规则设置
class VoteRulesSettingPage extends StatefulWidget {
  @override
  _VoteRulesSettingPageState createState() => _VoteRulesSettingPageState();
}

class _VoteRulesSettingPageState extends State<VoteRulesSettingPage> {
  TextEditingController _textC = TextEditingController();
  FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('规则设置'),
        actions: <Widget>[
          InkWell(
            onTap: () {
              _focusNode.unfocus();
            },
            child: Image.asset("assets/images/vote/save.png"),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              bottom: 6.0,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 9.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "投票规则",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xff595959),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 10.0,
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
                      focusNode: _focusNode,
                      maxLines: 4,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "输入规则",
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xffA6A6A6),
                        ),
                        contentPadding: EdgeInsets.all(0.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
