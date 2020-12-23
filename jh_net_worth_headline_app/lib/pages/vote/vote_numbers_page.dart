import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//投票规则-规则设置-人均每天投票数量
class VoteNumbersPage extends StatefulWidget {
  @override
  _VoteNumbersPageState createState() => _VoteNumbersPageState();
}

class _VoteNumbersPageState extends State<VoteNumbersPage> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("人均每天投票数量"),
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
              "投票次数",
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
