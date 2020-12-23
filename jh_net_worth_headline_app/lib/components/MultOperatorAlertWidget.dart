import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//自定义确认对话框
class MultOperatorAlertWidget extends Dialog {
  final String title;
  final String message;
  final String leftButton;//左边按钮
  final String rightButton;//右边按钮
  final VoidCallback leftCallback;
  final VoidCallback rightCallback;

  MultOperatorAlertWidget(
      {this.title, this.message, this.leftCallback, this.rightCallback,this.leftButton,this.rightButton});
  @override
  Widget build(BuildContext context) {
    return Material(
//        type: MaterialType.transparency,
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Center(
        child: Container(
          margin: EdgeInsets.only(left: 40, right: 40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                      GestureDetector(
                        onTap: (){//关闭操作
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          size: 18,
                        ),
                      )
                  ],
                ),
              ),
//              SizedBox(
//                height: 10,
//              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 16,
              ),
              Text(message),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 1,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: FlatButton(//左边按钮
                            child: Text(
                                leftButton,
                                style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              leftCallback();
                            }
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    width: 1, color: Color(0xffEFEFF4))),
                          ),
                        )
                    ),
                    Expanded(
                      flex: 1,
                      child: FlatButton(//右边按钮
                        child: Text(
                          rightButton,
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          rightCallback();
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
