import 'package:flutter/material.dart';

class Forth extends StatefulWidget {
  Forth({Key key}) : super(key: key);

  _ForthState createState() => _ForthState();
}

class _ForthState extends State<Forth> {
  int _selectIndex = 0;


  //左侧组件
  Widget _leftCateWidget(leftWidth) {
    if (this._leftCateList.length > 0) {
      return Container(
        width: leftWidth,
        height: double.infinity,
        // color: Colors.red,
        child: ListView.builder(
          itemCount: this._leftCateList.length,
          itemBuilder: (context, int index) {
            return Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectIndex = index;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    child: Center(
                      child: Text(
                        this._leftCateList[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: _selectIndex == index
                              ? Colors.orange
                              : Colors.black,
                        ),
                      ),
                    ),
                    color: Colors.white,
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
              ],
            );
          },
        ),
      );
    } else {
      return Container(
        width: leftWidth,
        height: double.infinity,
      );
    }
  }

  //右侧组件：
  Widget _rightCateWidget(rightItemWidth, rightItemHeigth) {
    if (this._rightCateList.length > 0) {
      return Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.all(10),
          height: double.infinity,
          color: Color.fromRGBO(240, 246, 246, 1),
          child: ListView.builder(
            itemCount: this._rightCateList.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: _selectIndex == index
                        ? Text(this._leftCateList[index],)
                        : null,
                  ),
                  _selectIndex == index
                      ? Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: FadeInImage.assetNetwork(
                            placeholder: "images/ic_device_image_default.png",
                            image: this._rightCateList[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: FadeInImage.assetNetwork(
                            placeholder: "images/ic_device_image_default.png",
                            image: this._rightCateList[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: FadeInImage.assetNetwork(
                            placeholder: "images/ic_device_image_default.png",
                            image: this._rightCateList[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  )
                      : Container()
                ],
              );
            },
          ),
        ),
      );
    }
  }

  Widget build(BuildContext context) {
    var leftWidth = MediaQuery.of(context).size.width / 4;
    var rightItemWidth =
        MediaQuery.of(context).size.width - leftWidth - 20 - 20 / 3;
    var rightItemHeight = rightItemWidth + 600;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.add),
          ),
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
            )
          ],
          title: Text(
            '课程分类',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Row(
          children: <Widget>[
            _leftCateWidget(leftWidth),
            _rightCateWidget(rightItemWidth, rightItemHeight)
          ],
        ));
  }
  List _leftCateList = [
    '创业',
    '融资',
    '商业计划书',
    '财税',
    '法务',
    '公司经营',
    '股权期权',
    '财富积累',
    '超凡技能',
    '个人提升',
    '商业思维',
    '社交沟通',
  ];
  List _rightCateList = [
    'https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00790-2012.jpg',
    'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2335849331,3537265484&fm=26&gp=0.jpg',
    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3724215956,1924644112&fm=26&gp=0.jpg',
    'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3335105420,3211417019&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3286400387,2503692411&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2762095895,2321642549&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3920820293,4266616739&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2523699436,1943095606&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=159952872,1000400807&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1527778212,3930246351&fm=26&gp=0.jpg',
    'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3842488449,2852858398&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=394783177,1021646416&fm=26&gp=0.jpg'
  ];
}
