import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:networth/components/appbar_widget/navigation_bar.dart';

///私聊设置
///
///
class PrivateChatSetPage extends StatefulWidget {
  @override
  _PrivateChatSetPageState createState() => _PrivateChatSetPageState();
}

class _PrivateChatSetPageState extends State<PrivateChatSetPage> {
  bool _isOpen = true;
  String _chargeSet = '收费';

  @override
  Widget build(BuildContext context) {
    final TextStyle _subStyle =
        new TextStyle(fontSize: 14.0, color: Color(0xFF8C8C8C));
    final TextStyle _style =
        new TextStyle(fontSize: 16.0, color: Color(0xFF262626));
    final bool _open = true;
    final bool _unOpen = false;
    return Scaffold(
      appBar: NavigationBar(
        title: '私聊设置',
        rightDMActions: <Widget>[
          InkWell(
              onTap: null,
              child: Image.asset('assets/images/ic_save.png', width: 24)),
          SizedBox(width: 16)
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 12),
            padding: EdgeInsets.only(left: 16, bottom: 5, right: 3),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                // 开放
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '开放',
                      style: _style,
                    ),
                    Radio(
                        value: _open,
                        groupValue: _isOpen,
                        onChanged: (value) {
                          setState(() {
                            _isOpen = value;
                          });
                        }),
                  ],
                ),
                _isOpen
                    ? Container(
                        padding: EdgeInsets.only(
                            bottom: 10, left: 8, right: 12, top: 10),
                        child: InkWell(
                          child: Row(
                            children: <Widget>[
                              Text(
                                '收费设置',
                                style: _subStyle,
                              ),
                              Spacer(),
                              Text(
                                _chargeSet,
                                style: _subStyle,
                              ),
                              Icon(Icons.chevron_right,
                                  color: Color(0xFF8C8C8C))
                            ],
                          ),
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(
                            //     builder: (BuildContext context) {
                            //   return Container();
                            // })).then((value) => setState(() {
                            //       _chargeSet = value;
                            //     }));
                          },
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          // 不开放
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 16.0, right: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '不开放',
                  style: _style,
                ),
                Radio(
                    value: _unOpen,
                    groupValue: _isOpen,
                    onChanged: (value) {
                      setState(() {
                        _isOpen = value;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
