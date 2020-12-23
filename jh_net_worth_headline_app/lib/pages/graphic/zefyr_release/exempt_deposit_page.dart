import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:networth/components/appbar_widget/navigation_bar.dart';

///免审押金
///
///
class ExemptDepositPage extends StatefulWidget {
  ExemptDepositPage({Key key}) : super(key: key);

  @override
  _ExemptDepositPageState createState() => _ExemptDepositPageState();
}

class _ExemptDepositPageState extends State<ExemptDepositPage> {
  bool _isWrite = false;
  TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController()
      ..addListener(() {
        if (_controller.text != '' || _controller.text != null) {
          setState(() {
            _isWrite = true;
          });
        } else {
          setState(() {
            _isWrite = false;
          });
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(title: '免审押金'),
      body: Container(
        color: Colors.white,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 13.0),
              child: Row(
                children: <Widget>[
                  Text(
                    '预存免审核保证金额',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF212121),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                        hintText: '不得少于￥ 800.00',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(191, 191, 191, 1),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 9.0),
                width: 66.0,
                height: 30.0,
                child: FlatButton(
                  disabledColor: Color(0xFFBFBFBF),
                  color: Colors.blue,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  onPressed: _isWrite ? () {} : null,
                  child: Text(
                    '支付',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
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
