import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:networth/widget/password_input.dart';
import 'package:networth/widget/toast.dart';

/// 创建者：宋永灵
/// 开发者：宋永灵
/// 创建日期：2020-09-23
///
///中心-提现
class CenterWithdrawPage extends StatefulWidget {
  @override
  _CenterWithdrawPageState createState() => _CenterWithdrawPageState();
}

class _CenterWithdrawPageState extends State<CenterWithdrawPage> {
  TextEditingController _priceC = TextEditingController();
  String cardType = "中国银行";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        leading: IconButton(
            icon: Image.asset("assets/management_center_images/arrow_back.png",
                width: 30),
            onPressed: () => print('点击返回')),
        title: Text('提现',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                width: winHeight(context),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text('提现金额',
                        style:
                            TextStyle(color: Color(0xffA6A6A6), fontSize: 16)),
                    SizedBox(height: 30),
                    Row(
                      children: <Widget>[
                        Image.asset("assets/management_center_images/yuan.png",
                            width: 25),
                        SizedBox(width: 5),
                        Expanded(
                          child: TextField(
                            controller: _priceC,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 12),
                                hintStyle: TextStyle(
                                    color: Color(0xff5A5A5A), fontSize: 36)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: <Widget>[
                        Text('目标银行卡',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17)),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            _openBottomSheet(context).then((value) {
                              if (!strNoEmpty(value)) return;
                              setState(() => cardType = value);
                            });
                          },
                          child: Row(
                            children: <Widget>[
                              Text(cardType,
                                  style: TextStyle(
                                      color: Color(0xff5CB1FF),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(width: 5),
                              Icon(Icons.arrow_forward_ios,
                                  size: 15, color: Color(0xffC6C6C6)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: InkWell(
              onTap: () {
                _priceC.text.toString() == ""
                    ? Toast.toast(context, msg: "金额不能为空")
                    : showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ChongZhiPay(
                            money: _priceC.text.toString(),
                          );
                        });
              },
              child: Container(
                height: 55,
                width: winWidth(context) - 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xff1890FF),
                    borderRadius: BorderRadius.circular(5)),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  '提现',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//目标银行卡底部弹出框
Future _openBottomSheet(context) async {
  var result = await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
          child: Column(
            children: <Widget>[
              SizedBox(height: 15),
              Text('选择提现目标银行卡',
                  style: TextStyle(color: Color(0xffC4C4C4), fontSize: 16)),
              Spacer(),
              Container(
                child: Column(
                  children: ['中国银行', '工商银行'].map((item) {
                    return Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            Navigator.pop(
                                context, item == "中国银行" ? "中国银行" : "工商银行");
                          },
                          child: Text(item,
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
              Spacer(),
              Text('添加新卡',
                  style: TextStyle(
                      color: Color(0xff1E93FF),
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
              Spacer(),
              Container(
                  height: 5,
                  width: winWidth(context),
                  color: Color(0xffBFBFBF)),
              Spacer(),
              Text('取消',
                  style: TextStyle(color: Color(0xff929292), fontSize: 18)),
              Spacer(),
            ],
          ),
        );
      });
  return result;
}

/*工具*/
/// 屏幕宽度
double winWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// 屏幕高度
double winHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

/// navigationBar高度
double navigationBarHeight(BuildContext context) {
  return kToolbarHeight;
}

/// 字符串不为空
bool strNoEmpty(String value) {
  if (value == null) return false;

  return value.trim().isNotEmpty;
}
