
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///新建连载中内容
class AddSerialContent extends StatelessWidget {
  final String title;
  final bool rightIcon;
  final Widget widgets;
  final Function onTaps;

  const AddSerialContent({
    Key key,
    this.title,
    this.rightIcon = true,
    this.widgets, this.onTaps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTaps,
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        height: 48,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
            Row(
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width * 1 / 2,
                    child: widgets),
                rightIcon
                    ? Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                )
                    : SizedBox(
                  width: 0,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

//底部固定 确定/取消
class Btm extends StatelessWidget {
  final Function addHandel;

  const Btm({Key key, this.addHandel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 1 / 2,
            height: 48,
            child: Text(
              '取消',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
        ),
        InkWell(
          onTap: addHandel,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 1 / 2,
            height: 48,
            child: Text(
              '确定',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
//选择连载架构 => 卷，篇，章，节
class ChapterChoice extends StatelessWidget {
  final Function handel;
  final String title;
  final bool isChoice;

  const ChapterChoice({Key key, this.title, this.isChoice, this.handel}) : super(key: key);@override

  Widget build(BuildContext context) {
    return InkWell(
      onTap: handel,
      child: Container(
        height: 48,
        padding: EdgeInsets.only(left: 16,right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                width: 66,
                height: 26,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color:isChoice?Colors.blue:Colors.grey ,
                    borderRadius: BorderRadius.all(Radius.circular(8))
                ),
                child: Text(title)),
            Image.asset( isChoice?'assets/images/drawable-xxxhdpi/checkchoice.png':
            'assets/images/drawable-xxxhdpi/ischoice.png',width: 24,)
          ],
        ),
      ),
    );
  }
}
//阅读设置组件
class ReadSettingList extends StatelessWidget {
  final String title;
  final bool isHandel;
  final Function onTaps;
  final bool isChoice;

  const ReadSettingList(
      {Key key, this.title, this.isHandel=false, this.onTaps, this.isChoice=true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 16,right: 16),
      height: 48,
      child: InkWell(
        onTap: onTaps,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                !isChoice?SizedBox(width: 16,):SizedBox(),
                Text(title,style: TextStyle(color: isChoice?Colors.black:Colors.grey),),
              ],
            ),
            isChoice?Image.asset(
              isHandel
                  ? 'assets/images/drawable-xxxhdpi/handelchoice.png'
                  : 'assets/images/drawable-xxxhdpi/ischoice.png',
              width: 16,
            ):isHandel ? Image.asset(
              'assets/images/drawable-xxxhdpi/handel_right1.png',
              width: 16,
            ):Image.asset('assets/images/drawable-xxxhdpi/right1.png',width: 10,)
          ],
        ),
      ),
    );
  }
}
