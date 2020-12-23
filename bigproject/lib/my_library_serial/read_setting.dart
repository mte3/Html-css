
import 'package:bigproject/widget/appbar.dart';
import 'package:flutter/material.dart';

import 'add_serial_widget.dart';
import 'co_creation.dart';

///阅读设置页面
class ReadSetting extends StatefulWidget {
  @override
  _ReadSettingState createState() => _ReadSettingState();
}

bool settingIsCharge = false; //是否免费阅读
bool settingIsPay = false; //是否向读者付费
bool settingCharge = false; //是否收取读者费用
//bool a = false; //按点击次数收费
bool b = false; //
// 按篇幅收费

class _ReadSettingState extends State<ReadSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: MainAppBar(
        title: '阅读设置',
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
      body: Column(
        children: <Widget>[
          ReadSettingList(
            title: '免费阅读',
            isHandel: settingIsCharge,
            onTaps: () {
              setState(() {
                settingIsCharge = !settingIsCharge;
                if(settingIsCharge){
                  settingCharge = false;
                  settingIsPay = false;
                }
              });
            },
          ),
          ReadSettingList(
            title: '向阅读者付费',
            isHandel: settingIsPay,
            onTaps: () {
              setState(() {
                settingIsPay = !settingIsPay;
                if(settingIsPay){
                  settingCharge = false;
                  settingIsCharge = false;
                }
              });
            },
          ),
          settingIsPay
              ? ReadSettingList(
                  isChoice: false,
                  title: '按点击次数付费',
                  onTaps: () {},
                )
              : SizedBox(),
          SizedBox(
            height: 8,
          ),
          ReadSettingList(
            isHandel: settingCharge,
            onTaps: () {
              setState(() {
                settingCharge = !settingCharge;
                if (settingCharge == false) {
                  b = false;
                };
                if(settingCharge){
                  settingIsPay = false;
                  settingIsCharge = false;
                }
              });
            },
            title: '向阅读者收费',
          ),
          settingCharge
              ? ReadSettingList(
                  isChoice: false,
                  isHandel: b,
                  onTaps: () {
                    setState(() {
                      b = !b;
                    });
                  },
                  title: '按篇幅收费',
                )
              : SizedBox(),
          b
              ? ReadSettingList(
                  onTaps: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ChargingStandard();
                    }));
                  },
                  isChoice: false,
                  title: '  收费标准',
                )
              : SizedBox(),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CoCreation();
              }));
            },
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              height: 48,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('联合创作'),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChargingStandard extends StatefulWidget {
  @override
  _ChargingStandardState createState() => _ChargingStandardState();
}

String dropdownValue = '卷';
class _ChargingStandardState extends State<ChargingStandard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: MainAppBar(
        title: '按篇幅收费',
      ),
      body: Column(
        children: <Widget>[
          Charging(
            onTaps: () {},
            leftText: '收费标准',
            rightWidget: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    style: TextStyle(color: Colors.blue),
                    value: dropdownValue,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['卷', '篇', '章', '节']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text('按${value}收费'),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
              ],
            ),
          ),
          Charging(
            leftText: '   单${dropdownValue}价格',
            rightWidget: Text(
              '￥ 5.0',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Charging(
            leftText: '折扣条件',
          ),
          Charging(
            leftText: '   批量篇幅折扣',
            rightWidget: Row(
              children: <Widget>[
                Text(
                  '无',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Charging(
            leftText: '   订阅本连载折扣价',
            rightWidget: Text(
              '￥0.00',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Charging(
            leftText: '免费条件',
          ),
          Charging(
            leftText: '此${dropdownValue}前的内容免费',
            rightWidget: Text(
              '3',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}

class Charging extends StatelessWidget {
  final Function onTaps;
  final String leftText;
  final Widget rightWidget;

  const Charging({Key key, this.onTaps, this.leftText, this.rightWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      height: 48,
      color: Colors.white,
      child: InkWell(
        onTap: onTaps,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(leftText),
            Container(
              child: rightWidget,
            )
          ],
        ),
      ),
    );
  }
}
