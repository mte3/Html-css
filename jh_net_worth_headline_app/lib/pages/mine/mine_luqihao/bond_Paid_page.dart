import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bond_page.dart';
import 'records_page2.dart';
///保证金页面
///卢奇浩
class BondPaid extends StatefulWidget{
  @override
  OneState createState() =>OneState();
}

class OneState extends State<BondPaid>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, //居中对齐
        title :Text("保证金",
          style: TextStyle(color: Colors.black, fontSize: 18),
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
                          Bond()));
            },
          ),
        ),
      ),



      // body:ListTile(
      //   title: new Text('Mi is One',
      //     style: new TextStyle(fontWeight: FontWeight.w500,fontSize: 20,backgroundColor:Colors.white),
      //
      //   ),
      // ),
      //


      body:Container(   //Container是箱子的意思
        color: Colors.white,
        height: 100.0,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
              // padding: EdgeInsets.only(left: 16.0,right: 16.0),
              child: Row(

                children: [
                  Text('预审免审核保证金额',style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),),
                  Spacer(),
                  Text('￥3000.00',
                      style:TextStyle(
                        fontSize: 14.0,
                          color:Colors.blue,
                      )
                  )
                ],
              ),

            ),

            SizedBox(height: 15.0,),
            Container(
              decoration: BoxDecoration(  //Container所有的样式写在这里面
                borderRadius: BorderRadius.circular(5.0),//圆角
                color: Colors.blue,
              ),
              width: 66.0,
              height: 30.0,

              child: InkWell(
                child:
                  Container(
                    alignment: Alignment.center, //文字居中

                    child: Text('已支付',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),),
                onTap: (){
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              Record()));
                },
              ),

            ),

          ],
        ),
      ),

    );
  }
}


//        actions:<Widget>[
//          Padding(
//            padding:EdgeInsets.only(right: 20.0),
//            child:GestureDetector(
//              onTap: (){},
//              child: Icon(
//                Icons.search,
//              ),
//            ),
//          ),
//        ],


