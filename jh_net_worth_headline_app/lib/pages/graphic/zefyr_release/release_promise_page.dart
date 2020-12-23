import 'package:flutter/material.dart';
import 'package:networth/components/appbar_widget/navigation_bar.dart';

/// 发布承诺
///
///
class ReleasePromisePage extends StatefulWidget {
  @override
  _ReleasePromisePageState createState() => _ReleasePromisePageState();
}

class _ReleasePromisePageState extends State<ReleasePromisePage> {
  bool _isAgree = false;
  final List<String> _ruleList = [
    '1、本人对所发布的全部内容拥有合法的权益，不存在任何违法、违纪、违规的行为及内容；',
    '2、本人严格遵守学术道德，引用他人的论述、数据、结果等，均已取得原权利拥有者的授权；',
    '3、本人对所发布的内容及自行设置的各个选项的真实性、准确性、可靠性负完全责任；',
    '4、本人已知晓且完全接受网值对发布信息的各项要求，自愿接受网值对本人违约的一切处罚。',
  ];
  @override
  Widget build(BuildContext context) {
    final TextStyle _titleStyle = new TextStyle(
        fontSize: 12.0,
        color: Color(0xFF595959),
        wordSpacing: 26.0,
        height: 2.8);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavigationBar(title: '发布承诺'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          Container(
            padding:
                EdgeInsets.only(top: 8.0, bottom: 16.0, left: 8.0, right: 8.0),
            margin: EdgeInsets.only(bottom: 8.0),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Color.fromRGBO(240, 240, 240, 1),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _ruleList
                  .map((item) => Text(
                        item,
                        style: _titleStyle,
                      ))
                  .toList(),
            ),
          ),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Checkbox(
              //   value: _isAgree,
              //   activeColor: Colors.blue,
              //   onChanged: (value) {
              //     setState(() {
              //       _isAgree = !_isAgree;
              //     });
              //   },
              // ),
              InkWell(
                onTap: () {
                  setState(() {
                    _isAgree = !_isAgree;
                  });
                },
                child: Image.asset(
                  'assets/images/ic_checkbox.png',
                  color: _isAgree ? Colors.blue : null,
                  width: 12,
                ),
              ),
              SizedBox(width: 8),
              Text(
                '我同意并遵守上述发布承诺',
                style: TextStyle(
                    color: Color.fromRGBO(24, 144, 255, 1), fontSize: 14),
              ),
            ],
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  disabledColor: Color.fromRGBO(191, 191, 191, 1),
                  color: Colors.blue,
                  child: Text(
                    '确认',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  onPressed: _isAgree ? () {} : null),
            ),
          ),
        ],
      ),
    );
  }
}
