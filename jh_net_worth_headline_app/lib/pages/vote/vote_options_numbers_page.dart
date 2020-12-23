import 'package:flutter/material.dart';

//投票规则-规则设置-可支持选项数量
class VoteOptionsNumbersPage extends StatefulWidget {
  @override
  _VoteOptionsNumbersPageState createState() => _VoteOptionsNumbersPageState();
}

class _VoteOptionsNumbersPageState extends State<VoteOptionsNumbersPage> {
  String hintText;
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("可支持选项数量"),
        actions: <Widget>[
          InkWell(
            onTap: () {},
            child: Image.asset("assets/images/vote/save.png"),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 14.0,
        ),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "选项数量",
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xff595959),
              ),
            ),
            Container(
              width: 100,
              child: TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xff1890FF),
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "1",
                  hintStyle: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xff1890FF),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
