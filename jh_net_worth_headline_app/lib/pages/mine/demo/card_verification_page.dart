
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

///中心-我的收益--添加银行卡-验证
class CardVerificationPage extends StatefulWidget {
  List<Asset> images = List<Asset>();

  @override
  _CardVerificationPageState createState() => _CardVerificationPageState();
}

class _CardVerificationPageState extends State<CardVerificationPage> {
  var _imgPath;
  var _imgPath2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('身份认证',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            )),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: UnconstrainedBox(
            child: Container(
//          padding: EdgeInsets.all(18),
                child: Image.network(
              'https://img02.mockplus.cn/idoc/xd/2020-06-17/eaaa9c8c-355c-467d-8aaf-db2583d2490e.png',
              width: 24,
              height: 24,
              fit: BoxFit.fill,
            )),
          ),
        ),
        actions: <Widget>[
          UnconstrainedBox(
            child: Container(
//          padding: EdgeInsets.all(18),
                child: Image.network(
              'https://img02.mockplus.cn/idoc/xd/2020-06-17/27e245f4-ee33-4cfb-b045-12e1b08d62d2.png',
              width: 24,
              height: 24,
              fit: BoxFit.fill,
            )),
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '身份信息',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 40,
                        child: Row(
                          children: [
                            Text('真实姓命'),
                            Container(
                              width: 100,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    hintStyle: TextStyle(
                                        fontSize: 14, color: Colors.grey)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 40,
                        child: Row(
                          children: [
                            Text('身份证号'),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width * 2 / 3,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    hintStyle: TextStyle(
                                        fontSize: 14, color: Colors.grey)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: _imgPath==null
                      ?GestureDetector(
                    onTap: _openGallery,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Card(
                        child: Container(
                            height: 150,
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/add.png',width: 40,fit: BoxFit.fill,),
                                Text('身份证正面'),
                              ],
                            )),
                      ),
                    ),
                  )
                      :_ImageView(_imgPath),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: _imgPath2==null
                      ?GestureDetector(
                    onTap: _openGallery,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Card(
                        child: Container(
                            height: 150,
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/add.png',width: 40,fit: BoxFit.fill,),
                                Text('身份证反面'),
                              ],
                            )),
                      ),
                    ),
                  )
                      :_ImageView2(_imgPath2),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                    padding: EdgeInsets.only(left: 16,bottom: 10), child: Text('手机认证')),
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Container(child: Text('手机号码')),
                      Expanded(
                        flex: 8,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                          ),
                          //      controller: _controller,
                        ),),
                      Expanded(
                        flex: 3,
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blueAccent,
                            ),
                            alignment: Alignment.center,
                            height: 26,
                            width: 60,
                            child: Text(
                              "发送验证码",
                              style: TextStyle(fontSize: 12,color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  child: Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 16), child: Text('验证号码')),
                      Expanded(
                        flex: 8,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                          ),
                          //      controller: _controller,
                        ),),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    color: Colors.blue,
                    highlightColor: Colors.blue[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    child: Container(
                        alignment: Alignment.center,
                        height: 48,
                        width: 161,
                        child: Text(
                          "下一步",
                          style: TextStyle(fontSize: 16),
                        )),
                    // 文本
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    //圆角矩形
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _ImageView(imgPath) {
    if (imgPath == null) {
      return null;
    } else {
      return Stack(
        children: <Widget>[],
      );
    }
  }

  Widget _ImageView2(imgPath) {
    if (imgPath == null) {
      return null;
    } else {
      return Stack(
        children: <Widget>[

        ],
      );
    }
  }

  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _imgPath = image;
    });
  }

/*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgPath = null ? _imgPath = image : _imgPath2 = image;
    });
  }
}
