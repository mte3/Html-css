import 'package:flutter/material.dart';
import 'vote_numbers_page.dart';
import 'vote_options_numbers_page.dart';
import 'vote_rule_setting_page.dart';

//投票规则
class VoteRulesPage extends StatefulWidget {
  @override
  _VoteRulesPageState createState() => _VoteRulesPageState();
}

class _VoteRulesPageState extends State<VoteRulesPage> {
  List<String> data = [
    "规则设置",
    "人均每天投票数量",
    "可支持选项数量",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("投票规则"),
        actions: <Widget>[
          InkWell(
            onTap: () {},
            child: Image.asset("assets/images/vote/save.png"),
          ),
        ],
      ),
      body: Column(
        children: data.map((item) {
          return rowItemWidget(item);
        }).toList(),
      ),
    );
  }

  Widget rowItemWidget(String title) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        onTap: () {
          switch (title) {
            case "规则设置":
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return VoteRulesSettingPage();
              }));
              break;
            case "人均每天投票数量":
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return VoteNumbersPage();
              }));
              break;
            case "可支持选项数量":
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return VoteOptionsNumbersPage();
              }));
              break;
          }
        },
        title: Text(title),
        trailing: Image.asset("assets/images/vote/enter.png"),
      ),
    );
  }
}
