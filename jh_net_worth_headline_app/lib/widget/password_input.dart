import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:networth/pages/mine/management_center_page/center_withdraw_page.dart';

/// 创建者：宋永灵
/// 开发者：宋永灵
/// 创建日期：2020-09-27-7
///
/// 支付密码  +  自定义键盘

enum actionType { topUp, pay, withdraw }

class ChongZhiPay extends StatefulWidget {
  ///充值金额
  final String money;
  final String itemId;
  final int orderType;
  final actionType type;

  const ChongZhiPay({
    Key key,
    this.money,
    this.itemId,
    this.orderType,
    this.type = actionType.topUp,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ChongZhiPayState();
  }
}

class ChongZhiPayState extends State<ChongZhiPay> {
  ///支付密码键盘弹出时padding的改变
  bool checkPadding = false;

  ///支付方式的判断
  bool chose = false;

  /// 用户输入的密码
  String pwdData = '';

  /*
    GlobalKey：整个应用程序中唯一的键
    ScaffoldState：Scaffold框架的状态
    解释：_scaffoldKey的值是Scaffold框架状态的唯一键
   */
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // VoidCallback：没有参数并且不返回数据的回调
  VoidCallback _showBottomSheetCallback;

  @override
  void initState() {
    super.initState();
    _showBottomSheetCallback = _showBottomSheet;
    WidgetsBinding.instance.addPostFrameCallback((v) {
      checkPadding = true;
      if (_showBottomSheetCallback != null) _showBottomSheetCallback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      key: _scaffoldKey,
      body: Container(
        padding: EdgeInsets.only(top: navigationBarHeight(context)),
        child: Material(
          type: MaterialType.transparency,
          child: Center(
            child: Container(
              height: 280,
              width: winWidth(context),
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(13)),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Material(
                        child: InkWell(
                          child: Image.asset(
                            "assets/management_center_images/close.png",
                            width: 19,
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                      Spacer(),
                      Text('请输入支付密码',
                          style: TextStyle(
                              color: Color(0xffC0C0C0), fontSize: 19)),
                      Spacer(),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: <Widget>[
                      Spacer(),
                      Image.asset("assets/management_center_images/yuan.png",
                          width: 30, color: Color(0xff1890FF)),
                      Expanded(
                        child: Text(
                          widget.money,
                          style: TextStyle(
                              color: Color(0xff1890FF),
                              fontSize: 40,
                              fontWeight: FontWeight.w500),
                          maxLines: 1,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    width: winWidth(context),
                    height: 44,
                    color: Color(0xffD6D6D6),

                    ///密码框
                    child: _buildPwd(pwdData),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 密码键盘 确认按钮 事件
//  void onAffirmButton() {}

  /// 密码键盘的整体回调，根据不同的按钮事件来进行相应的逻辑实现
  void _onKeyDown(KeyEvent data) {
// 如果点击了删除按钮，则将密码进行修改
    if (data.isDelete()) {
      if (pwdData.length == 0) {
        return;
      } else if (pwdData.length > 0) {
        pwdData = pwdData.substring(0, pwdData.length - 1);
        setState(() {});
      }
    }
// 点击了确定按钮时
    else if (data.isCommit()) {
      if (pwdData.length != 6) {
//        Fluttertoast.showToast(msg: "密码不足6位，请重试", gravity: ToastGravity.CENTER);
        return;
      }
//      onAffirmButton();
    }
//点击了数字按钮时  将密码进行完整的拼接
    else {
      if (pwdData.length >= 6) {
        handle();
      } else if (pwdData.length < 6) {
        pwdData += data.key;

        if (pwdData.length >= 6) {
          handle();
//        Navigator.of(context).pushAndRemoveUntil(
//            MaterialPageRoute(builder: (context) {
//          return MineChongzhi_Second(
//            money: widget.money,
//          );
//        }), (route) => route == null);
//
//        Navigator.pop(context);
//        Navigator.push(context, MaterialPageRoute(builder: (_) {
//          return MineChongzhi_Second(
//            money: widget.money,
//          );
//        }));
        }
      }
      setState(() {});
    }
  }

  void handle() {
    Navigator.of(context)
        .popAndPushNamed('mineChongzhi_second', arguments: widget.money);
  }

  /// 底部弹出 自定义键盘  下滑消失
  void _showBottomSheet() {
    setState(() {
      // disable the button  // 禁用按钮
      _showBottomSheetCallback = null;
    });

    /*
      currentState：获取具有此全局键的树中的控件状态
      showBottomSheet：显示持久性的质感设计底部面板
      解释：联系上文，_scaffoldKey是Scaffold框架状态的唯一键，因此代码大意为，
           在Scaffold框架中显示持久性的质感设计底部面板
     */
    _scaffoldKey.currentState
        .showBottomSheet<void>((BuildContext context) {
          /// 将自定义的密码键盘作为其child   这里将回调函数传入
          return PassWordKeyboard(_onKeyDown);
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              checkPadding = false;
              // re-enable the button  // 重新启用按钮
              _showBottomSheetCallback = _showBottomSheet;
            });
          }
        });
  }

  /// 构建 密码输入框  定义了其宽度和高度
  Widget _buildPwd(var pwd) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffCDCDCD)),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: 44,
        child: PasswordInputWidget(pwd),
      ),
// 用户点击输入框的时候，弹出自定义的键盘
      onTap: () {
        print('已点击');
//        Navigator.push(context,
//            MaterialPageRoute(builder: (BuildContext context) {
//          return WithdrawProsperityPage();
//        }));
      },
    );
  }
}

/// 自定义密码 键盘

class PassWordKeyboard extends StatefulWidget {
  final callback;

  PassWordKeyboard(this.callback);

  @override
  State<StatefulWidget> createState() {
    return new MyKeyboardStat();
  }
}

class MyKeyboardStat extends State<PassWordKeyboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// 定义 确定 按钮 接口  暴露给调用方
  ///回调函数执行体
  var backMethod;

  void onCommitChange() {
    widget.callback(new KeyEvent("commit"));
  }

  void onOneChange(BuildContext cont) {
    widget.callback(new KeyEvent("1"));
  }

  void onTwoChange(BuildContext cont) {
    widget.callback(new KeyEvent("2"));
  }

  void onThreeChange(BuildContext cont) {
    widget.callback(new KeyEvent("3"));
  }

  void onFourChange(BuildContext cont) {
    widget.callback(new KeyEvent("4"));
  }

  void onFiveChange(BuildContext cont) {
    widget.callback(new KeyEvent("5"));
  }

  void onSixChange(BuildContext cont) {
    widget.callback(new KeyEvent("6"));
  }

  void onSevenChange(BuildContext cont) {
    widget.callback(new KeyEvent("7"));
  }

  void onEightChange(BuildContext cont) {
    widget.callback(new KeyEvent("8"));
  }

  void onNineChange(BuildContext cont) {
    widget.callback(new KeyEvent("9"));
  }

  void onZeroChange(BuildContext cont) {
    widget.callback(new KeyEvent("0"));
  }

  /// 点击删除
  void onDeleteChange() {
    widget.callback(new KeyEvent("del"));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      key: _scaffoldKey,
      width: MediaQuery.of(context).size.width,
      height: 200,
      color: Colors.white,
      child: new Column(
        children: <Widget>[
//          new Container(
//            height: 30.0,
//            color: Colors.white,
//            alignment: Alignment.center,
//            child: new Text(
//              '下滑隐藏',
//              style: new TextStyle(fontSize: 12.0, color: Color(0xff999999)),
//            ),
//          ),

          ///  键盘主体
          new Column(
            children: <Widget>[
              Container(
                height: 20,
                color: Color(0XFF5A5A5A),
              ),

              ///  第一行
              new Row(
                children: <Widget>[
                  NumberKeyBoardWidget(
                      text: '1',
                      letter: '',
                      callback: (val) => onOneChange(context)),
                  NumberKeyBoardWidget(
                      text: '2',
                      letter: 'ABC',
                      callback: (val) => onTwoChange(context)),
                  NumberKeyBoardWidget(
                      text: '3',
                      letter: 'DEF',
                      callback: (val) => onThreeChange(context)),
                  NumberKeyBoardWidget(
                      text: 'X',
                      letter: '',
                      callback: (val) => onDeleteChange()),
                ],
              ),

              ///  第二行
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          NumberKeyBoardWidget(
                              text: '4',
                              letter: 'GHI',
                              callback: (val) => onFourChange(context)),
                          NumberKeyBoardWidget(
                              text: '5',
                              letter: 'JKL',
                              callback: (val) => onFiveChange(context)),
                          NumberKeyBoardWidget(
                              text: '6',
                              letter: 'MNO',
                              callback: (val) => onSixChange(context)),
                        ],
                      ),
                      new Row(
                        children: <Widget>[
                          NumberKeyBoardWidget(
                              text: '7',
                              letter: 'PQRS',
                              callback: (val) => onSevenChange(context)),
                          NumberKeyBoardWidget(
                              text: '8',
                              letter: 'TUV',
                              callback: (val) => onEightChange(context)),
                          NumberKeyBoardWidget(
                              text: '9',
                              letter: 'WXYZ',
                              callback: (val) => onNineChange(context)),
                        ],
                      ),
                    ],
                  ),
                  NumberKeyBoardWidget1(
                      text: '0', callback: (val) => onZeroChange(context)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PassWordKeyboardd extends StatefulWidget {
  final callback;

  PassWordKeyboardd(this.callback);

  @override
  State<StatefulWidget> createState() {
    return new MyKeyboarddStat();
  }
}

class MyKeyboarddStat extends State<PassWordKeyboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// 定义 确定 按钮 接口  暴露给调用方
  ///回调函数执行体
  var backMethod;
  void onCommitChange() {
    widget.callback(new KeyEvent("commit"));
  }

  void onOneChange(BuildContext cont) {
    widget.callback(new KeyEvent("1"));
    setState(() {});
  }

  void onTwoChange(BuildContext cont) {
    widget.callback(new KeyEvent("2"));
    setState(() {});
  }

  void onThreeChange(BuildContext cont) {
    widget.callback(new KeyEvent("3"));
    setState(() {});
  }

  void onFourChange(BuildContext cont) {
    widget.callback(new KeyEvent("4"));
    setState(() {});
  }

  void onFiveChange(BuildContext cont) {
    widget.callback(new KeyEvent("5"));
    setState(() {});
  }

  void onSixChange(BuildContext cont) {
    widget.callback(new KeyEvent("6"));
    setState(() {});
  }

  void onSevenChange(BuildContext cont) {
    widget.callback(new KeyEvent("7"));
    setState(() {});
  }

  void onEightChange(BuildContext cont) {
    widget.callback(new KeyEvent("8"));
    setState(() {});
  }

  void onNineChange(BuildContext cont) {
    widget.callback(new KeyEvent("9"));
    setState(() {});
  }

  void onZeroChange(BuildContext cont) {
    widget.callback(new KeyEvent("0"));
    setState(() {});
  }

  /// 点击删除
  void onDeleteChange() {
    widget.callback(new KeyEvent("del"));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      key: _scaffoldKey,
      width: double.infinity,
      height: 250.0,
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new Container(
            height: 30.0,
            color: Colors.white,
            alignment: Alignment.center,
            child: new Text(
              '下滑隐藏',
              style: new TextStyle(fontSize: 12.0, color: Color(0xff999999)),
            ),
          ),

          ///  键盘主体
          new Column(
            children: <Widget>[
              ///  第一行
              new Row(
                children: <Widget>[
                  NumberKeyBoardWidget(
                      text: '1', callback: (val) => onOneChange(context)),
                  NumberKeyBoardWidget(
                      text: '2', callback: (val) => onTwoChange(context)),
                  NumberKeyBoardWidget(
                      text: '3', callback: (val) => onThreeChange(context)),
                ],
              ),

              ///  第二行
              new Row(
                children: <Widget>[
                  NumberKeyBoardWidget(
                      text: '4', callback: (val) => onFourChange(context)),
                  NumberKeyBoardWidget(
                      text: '5', callback: (val) => onFiveChange(context)),
                  NumberKeyBoardWidget(
                      text: '6', callback: (val) => onSixChange(context)),
                ],
              ),

              ///  第三行
              new Row(
                children: <Widget>[
                  NumberKeyBoardWidget(
                      text: '7', callback: (val) => onSevenChange(context)),
                  NumberKeyBoardWidget(
                      text: '8', callback: (val) => onEightChange(context)),
                  NumberKeyBoardWidget(
                      text: '9', callback: (val) => onNineChange(context)),
                ],
              ),

              ///  第四行
              new Row(
                children: <Widget>[
                  NumberKeyBoardWidget(
                      text: '删除', callback: (val) => onDeleteChange()),
                  NumberKeyBoardWidget(
                      text: '0', callback: (val) => onZeroChange(context)),
                  NumberKeyBoardWidget(
                      text: '确定', callback: (val) => onCommitChange()),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class KeyEvent {
  ///  当前点击的按钮所代表的值
  String key;
  KeyEvent(this.key);

  bool isDelete() => this.key == "del";
  bool isCommit() => this.key == "commit";
}

///  自定义 密码输入框 第一步 —— 使用画笔画出单个的框
class PasswordInputWidget extends StatelessWidget {
  ///  传入当前密码
  final String data;
  PasswordInputWidget(this.data);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyCustom(data),
    );
  }
}

///  继承CustomPainter ，来实现自定义图形绘制
class MyCustom extends CustomPainter {
  ///  传入的密码，通过其长度来绘制圆点
  String pwdLength;
  MyCustom(this.pwdLength);

  ///  此处Sizes是指使用该类的父布局大小
  @override
  void paint(Canvas canvas, Size size) {
    // 密码画笔
    Paint mPwdPaint;
    Paint mRectPaint;

    // 初始化密码画笔
    mPwdPaint = new Paint();
    mPwdPaint..color = Colors.black;

//   mPwdPaint.setAntiAlias(true);
    // 初始化密码框
    mRectPaint = new Paint();

    ///  圆角矩形的绘制
//    RRect r = new RRect.fromLTRBR(50, 50.0, 50, 50, new Radius.circular(0));
//    Rect r = Rect.fromLTRB(0, 0, 50, 50);

    ///  画笔的风格
    mRectPaint.style = PaintingStyle.stroke;
    mRectPaint..color = Color(0xffCDCDCD);
    mRectPaint..strokeWidth = 2;
//    mRectPaint.style = PaintingStyle.fill;
//    canvas.drawRRect(r, mRectPaint);
//    canvas.drawRect(r, mRectPaint);

    ///  将其分成六个 格子（六位支付密码）
    var per = size.width / 6.0;
    var offsetX = per;
    while (offsetX < size.width) {
      canvas.drawLine(new Offset(offsetX, 6.0),
          new Offset(offsetX, size.height - 6.0), mRectPaint);
      offsetX += per;
    }

    ///  画实心圆
    var half = per / 2;
    var radio = per / 8;
    mPwdPaint.style = PaintingStyle.fill;

    ///  当前有几位密码，画几个实心圆
    for (int i = 0; i < pwdLength.length && i < 6; i++) {
      canvas.drawArc(
          new Rect.fromLTRB(i * per + half - radio, size.height / 2 - radio,
              i * per + half + radio, size.height / 2 + radio),
          0.0,
          2 * pi,
          true,
          mPwdPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

///  自定义 键盘 按钮
class NumberKeyBoardWidget extends StatefulWidget {
  ///  按钮显示的文本内容
  final String text;
  final String letter;
  NumberKeyBoardWidget({Key key, this.text, this.callback, this.letter})
      : super(key: key);

  ///  按钮 点击事件的回调函数
  final callback;
  @override
  State<StatefulWidget> createState() {
    return ButtonState();
  }
}

class ButtonState extends State<NumberKeyBoardWidget> {
  ///回调函数执行体
  var backMethod;

  void back() {
    widget.callback('$backMethod');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    /// 获取当前屏幕的总宽度，从而得出单个按钮的宽度
    MediaQueryData mediaQuery = MediaQuery.of(context);
    var _screenWidth = mediaQuery.size.width;

    return new Container(
        height: 60,
        width: _screenWidth / 4,
        color: Color(0xFF5A5A5A),
        child: Container(
          margin: EdgeInsets.all(6.0),
          child: new RawMaterialButton(
            //大小
//            constraints: BoxConstraints.tightFor(
//                width: ScreenUtil.getInstance().setWidth(117),
//                height: ScreenUtil.getInstance().setHeight(100)),
            // 直角
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(4.0)),
            fillColor: Color(0XFF333333),
            // 边框颜色
//          borderSide: new BorderSide(color: Colors.transparent),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  widget.text,
                  style: new TextStyle(color: Color(0xffFFFFFF), fontSize: 28),
                ),
//                new Text(
//                  widget.letter,
//                  style: new TextStyle(
//                      color: Color(0xff444444),
//                      fontSize: 12),
//                ),
              ],
            ),
            // 按钮点击事件
            onPressed: back,
          ),
        ));
  }
}

class NumberKeyBoardWidget1 extends StatefulWidget {
  final String text;
  final callback;
  const NumberKeyBoardWidget1({Key key, this.text, this.callback})
      : super(key: key);
  @override
  _NumberKeyBoardWidget1State createState() => _NumberKeyBoardWidget1State();
}

class _NumberKeyBoardWidget1State extends State<NumberKeyBoardWidget1> {
  var backMethod;

  void back() {
    widget.callback('$backMethod');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    /// 获取当前屏幕的总宽度，从而得出单个按钮的宽度
    MediaQueryData mediaQuery = MediaQuery.of(context);
    var _screenWidth = mediaQuery.size.width;
    return new Container(
        height: 120,
        width: _screenWidth / 4,
        color: Color(0xFF5A5A5A),
        child: Container(
          margin: EdgeInsets.all(6.0),
          child: new RawMaterialButton(
            //大小
//            constraints: BoxConstraints.tightFor(
//                width: ScreenUtil.getInstance().setWidth(117),
//                height: ScreenUtil.getInstance().setHeight(100)),
            // 直角
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5.0)),
            fillColor: Color(0XFF333333),
            // 边框颜色
//          borderSide: new BorderSide(color: Colors.transparent),
            child: new Text(
              widget.text,
              style: new TextStyle(color: Color(0xffFFFFFF), fontSize: 28),
            ),
            // 按钮点击事件
            onPressed: back,
          ),
        ));
  }
}

class NumberKeyBoardDeleteWidget extends StatefulWidget {
  final String text;
  final callback;
  const NumberKeyBoardDeleteWidget({Key key, this.text, this.callback})
      : super(key: key);
  @override
  _NumberKeyBoardDeleteWidgetState createState() =>
      _NumberKeyBoardDeleteWidgetState();
}

class _NumberKeyBoardDeleteWidgetState
    extends State<NumberKeyBoardDeleteWidget> {
  var backMethod;

  void back() {
    widget.callback('$backMethod');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    /// 获取当前屏幕的总宽度，从而得出单个按钮的宽度
    MediaQueryData mediaQuery = MediaQuery.of(context);
    var _screenWidth = mediaQuery.size.width;
    return new Container(
        height: 60,
        width: _screenWidth / 3,
        color: Color(0xE6D2D5DB),
        child: Container(
          margin: EdgeInsets.all(6.0),
          child: new FlatButton(
            // 直角
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5.0)),
            color: Color(0xE6D2D5DB),
            // 边框颜色
//          borderSide: new BorderSide(color: Colors.transparent),
            child: Image.asset(
              'assets/images/home_closenum.png',
              width: 30,
              height: 25,
              fit: BoxFit.cover,
            ),
            // 按钮点击事件
            onPressed: back,
          ),
        ));
  }
}
