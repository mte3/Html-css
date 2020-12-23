

import 'package:flutter/material.dart';
import 'res/listData.dart';
import 'bond_Paid_page.dart';
import 'Administration_page.dart';


class Record extends StatelessWidget{

  @override
  Widget build(BuildContext context){
  Widget _appBar(){
    return AppBar(
      centerTitle: true, //居中对齐
      title :Text("竞价记录",
        style: TextStyle(color: Colors.black, fontSize:18),
      ),
      backgroundColor: Colors.white,
      elevation: 0, //阴影
      leading: InkWell(
        child: GestureDetector(
          child: Image.asset('assets/images/01.png'),
          onTap: (){
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) =>
                        BondPaid()));
          },
        ),
      ),

      actions:<Widget>[
        Padding(
          padding:EdgeInsets.only(right: 10),
          child:GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) =>
                          Administration()));
            },
            child: Image.asset('assets/images/02.png')
          ),
        ),
      ],
    );
  }


    return MaterialApp(
      home:
      Scaffold(
        appBar:_appBar(),
        body:
        HomeContent(),
      ),


    );
  }
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool isClick01 = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16),
              height: 30,
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    child: Text('全部记录',
                      style: TextStyle(
                        fontSize: 16,
                        color:Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          if(isClick01 == false){
                            isClick01 = true;
                          }else{
                            isClick01 = false;
                          }
                        });
                      },
                      child:Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
                    ),
                  ),
                  Spacer(),
                  Container(
                      padding: EdgeInsets.only(right: 16),
                      child: Text('36条',
                        style:TextStyle(
                            color: Colors.grey,
                            fontSize: 14
                        ),
                      )
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height-110,
              child: ListView(
                children: [
                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listData.length,
                      itemBuilder: (context,index){
                        String title=listData[index]["money"].substring(0,1);
                        return Container01(
                          text01: listData[index]["title"],
                          text02: listData[index]["time"],
                          text03: listData[index]["remarks"],
                          text04: listData[index]["money"],
                          title: title,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 30,
          left: 23,
          child: isClick01 == false
              ?Container()
              :Container(
            // decoration: BoxDecoration(  //Container所有的样式写在这里面
            //   //圆角
            // ),
              child: Column(
                children: [
                  Container(child:Text('全部记录',
                  style: TextStyle(fontSize: 14.0,color:Color.fromRGBO(24, 144, 255, 1)),
                    textAlign: TextAlign.center,
                  ),
                  padding: EdgeInsets.only(bottom: 35,top: 30)),
                  Container(child:Text('支付记录',
                    style: TextStyle(fontSize: 14.0,color:Color.fromRGBO(77, 77, 77, 1)),
                    textAlign: TextAlign.center,
                  ),
                      padding: EdgeInsets.only(bottom: 35)),
                  Container(child: Text('退款记录',
                    style: TextStyle(fontSize: 14.0,color:Color.fromRGBO(77, 77, 77, 1)),
                    textAlign: TextAlign.center,
                  ),),
                ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 2, //阴影范围
                  spreadRadius: 0.1, //阴影浓度
                  color: Colors.grey, //阴影颜色
                ),
              ],
            ),
            height: 128,
            width: 80,
          ),
        ),
      ],
    );
  }
}

class Container01 extends StatefulWidget {
  final String text01;
  final String text02;
  final String text03;
  final String text04;
  final String title;

  const Container01({Key key, this.text01, this.text02, this.text03, this.text04, this.title}) : super(key: key);
  @override
  _Container01State createState() => _Container01State();
}

class _Container01State extends State<Container01> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(bottom: 10) ,
      color: Colors.white,
      padding:EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: Row(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.text01,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600]
                  ),
                ),
                Row(
                  children: [
                    Text(widget.text02,
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(widget.text03,
                      style: TextStyle(
                          color:Color.fromRGBO(126, 191, 252, 1),
                          fontSize: 12
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            child: Text(widget.text04,
                style:TextStyle(
                    color:  widget.title== '-' ? Color.fromRGBO(250, 140, 22, 1): Color.fromRGBO(24, 144, 255, 1),
                    fontSize: 16,
                  fontWeight:FontWeight.bold
                )
            ),
          ),
        ],
      ),
    );
  }
}


/*
  Widget _getListData(context,index){
  String title=listData[index]["money"].substring(0,1);
}*/
