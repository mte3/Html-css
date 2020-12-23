import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//2020.9.24
//创建者：刘浩键
//广告设置
class AdvertisingSetingPage extends StatefulWidget {
  @override
  _AdvertisingSetingPageState createState() => _AdvertisingSetingPageState();
}

class _AdvertisingSetingPageState extends State<AdvertisingSetingPage> {
  bool select =  false;
  TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          child: Container(
            width: 60,
            height: 28,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Image.asset('assets/images/black.png'),
          ),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        title: Text('广告设置',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
        centerTitle: true,
        actions: <Widget>[
          InkWell(
            child: Container(
              width: 60,
              height: 28,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Image.asset('assets/images/keep.png',),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: ListView(
              shrinkWrap: true,
//            physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: <Widget>[
                      Text('广告植入',style: TextStyle(fontSize: 20,color: Colors.black),),
                      Spacer(),
                      CupertinoSwitch(
                        value: this.select,
                        activeColor: Colors.blue,
                        onChanged: (value){
                          setState(() {
                            this.select = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Visibility(
                    visible: this.select,
                    child: ListView.builder(
                        itemCount: advertisingList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context,index){
                          return AdvertisingItem(data: advertisingList[index],);
                        })),
              ],
            ),
          ),
          Expanded(
            flex: 1,
              child: InkWell(
            child: Container(
              color: Colors.white,
              height: 70,
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Image.asset('assets/images/add.png'),
                  ),
                  SizedBox(width: 5,),
                  Text('添加广告',style: TextStyle(fontSize: 20,color: Colors.blue),)
                ],
              ),
            ),
            onTap: (){
              showCupertinoDialog(
                  context: context,
                  builder: (context){
                    return CupertinoAlertDialog(
                      title: Text('价格设定/CPC',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black
                        ),),
                      content: Container(
                        padding: EdgeInsets.all(10),
                        child: CupertinoTextField(
                          controller: textEditingController,
                          maxLines: 1,
                          placeholder: '￥0.00',
                          padding: EdgeInsets.all(10),
                          textInputAction: TextInputAction.unspecified,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: Text('取消',
                            style: TextStyle(color: Colors.black),),
                          onPressed: (){
                            Navigator.pop(context);
                          },),
                        CupertinoDialogAction(
                          child: Text('确认'),
                          onPressed: (){},),
                      ],
                    );
                  });
            },
          ))
        ],
      )

    );
  }
}

List<AdvertisingModel> advertisingList =[
  AdvertisingModel(title: '第一广告位',money: '0.08'),
  AdvertisingModel(title: '第二广告位',money: '0.08'),
  AdvertisingModel(title: '第三广告位',money: '0.08'),

];

class AdvertisingModel{
  final String title;
  final String money;
  AdvertisingModel({
   this.title,
    this.money
});
}

class AdvertisingItem extends StatelessWidget {
  final AdvertisingModel data;
  AdvertisingItem({this.data});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 8,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 13,),
                child: Row(
                  children: <Widget>[
                    Text(data.title,style: TextStyle(fontSize: 20,color: Colors.blue),),
                    Spacer(),
                    Container(
                      width: 28,
                      height: 28,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Image.asset('assets/images/delete.png'),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 14,),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text('单次点击起价',style: TextStyle(fontSize: 15,color: Colors.black),),
                    Spacer(),
                    Text('￥${data.money}/CPC',style: TextStyle(fontSize: 15,color: Colors.blue),),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
