
import 'package:bigproject/widget/appbar.dart';
import 'package:bigproject/widget/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///批量字数折扣价页面

class DiscountPrice extends StatefulWidget {
  @override
  _DiscountPriceState createState() => _DiscountPriceState();
}

class _DiscountPriceState extends State<DiscountPrice> {
  TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white70,
      appBar: MainAppBar(
        showBackIcon: true,
        title: '批量字数折扣价',
        rightDMActions: <Widget>[
          InkWell(
            child: new Container(
              width: 24,
              height: 24,
              margin: EdgeInsets.symmetric(vertical: 13),
//                      leadingType == 0
//                          ? Icon(icons, color: mainColor, size: 14):
              child: Image.asset(
                "assets/images/drawable-xxxhdpi/preservation.png",
              ),
            ),
            onTap: () {},
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: prise.length == 0
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text('暂无折扣'),
                )
              ],
            )
          : ListView.builder(
              itemCount: prise.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 16, right: 16, top: 13),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 48,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '折扣条件${index + 1}',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  this.prise.remove(this.prise[index]);
                                });
                              },
                              child: Image.asset(
                                'assets/images/drawable-xxxhdpi/close.png',
                                width: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 48,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('折扣字数'),
//                            Container(
//                              width: MediaQuery.of(context).size.width * 2 / 3,
//                              height: 46,
//                              child: TextField(
//                                style: TextStyle(
//                                    color: this.prise[index][0] != 0
//                                        ? Colors.blue
//                                        : Colors.grey),
//                                controller: textEditingController,
//                                textAlign: TextAlign.end,
//                                inputFormatters: [
//                                  WhitelistingTextInputFormatter.digitsOnly
//                                ],
//                                decoration: InputDecoration(
//                                    hintText: '${prise[index][0]}',
//                                    hintStyle: TextStyle(
//                                        color: prise[index][0] == 0
//                                            ? Colors.grey
//                                            : Colors.blue),
//                                    border: InputBorder.none),
//                                onSubmitted: (t) {
//                                  prise[index][0] = t;
//                                },
//                              ),
//                            ),
                            Text(' ${prise[index][0]}',style: TextStyle(color:prise[index][1]==0.00?
                            Colors.grey:Colors.blue),)
                          ],
                        ),
                      ),
                      Container(
                        height: 48,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('折扣价格'),
//                            Container(
//                              width: MediaQuery.of(context).size.width * 2 / 3,
//                              height: 46,
//                              child: TextField(
//                                style: TextStyle(
//                                    color: this.prise[index][0] != 0
//                                        ? Colors.blue
//                                        : Colors.grey),
//                                inputFormatters: [
//                                  WhitelistingTextInputFormatter(
//                                      RegExp("[0-9.]")),
//                                  //只允许输入小数
//                                ],
//                                textAlign: TextAlign.end,
//                                decoration: InputDecoration(
//                                    hintText: '￥ ${prise[index][1]}',
//                                    hintStyle: TextStyle(
//                                        color: prise[index][0] == 0
//                                            ? Colors.grey
//                                            : Colors.blue),
//                                    border: InputBorder.none),
//                              ),
//                            ),
                      Text('￥ '+' ${prise[index][1]}',style: TextStyle(color:prise[index][1]==0.00?
                      Colors.grey:Colors.blue),)
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
      bottomSheet: BottomAdd(
        onTaps: () {
          setState(() {
            this.prise.add([0, 0.0]);
          });
        },
        title: ' 添加折扣',
      )
    );
  }

  List prise = [
    [5000, 9.00]
  ];
}
