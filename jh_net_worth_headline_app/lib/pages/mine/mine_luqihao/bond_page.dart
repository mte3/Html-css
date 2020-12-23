import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bond_Paid_page.dart';
///保证金页面
///卢奇浩
class Bond extends StatefulWidget{
  @override
  OneState createState() =>OneState();
}

class OneState extends State<Bond>{


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
        leading: GestureDetector(
          child: Image.asset('assets/images/01.png'),
          onTap: (){},
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
                     Text('不得少于￥800.00',
                     style:TextStyle(
                       fontSize: 14.0,
                       color:Colors.grey[400]
                     )
                     )
                   ],
                 ),

               ),

            SizedBox(height: 15.0,),
                 Container(
                   decoration: BoxDecoration(  //Container所有的样式写在这里面
                     borderRadius: BorderRadius.circular(5.0),//圆角
                     color: Colors.grey[400],
                   ),
                   width: 66.0,
                   height: 30.0,

                       child: InkWell(
                         child:
                           Container(
                             alignment: Alignment.center, //文字居中

                             child: Text('支付',
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
                                       BondPaid()));
                         },
                       ),

                 ),

             ],
           ),
         ),

    );
  }
}



