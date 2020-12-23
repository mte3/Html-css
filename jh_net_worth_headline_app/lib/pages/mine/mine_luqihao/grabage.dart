import 'package:flutter/material.dart';
import 'res/listData.dart';
void main() {
  runApp(Records());
}

class Records extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          centerTitle: true, //居中对齐
          title :Text("竞价记录",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          backgroundColor: Colors.white,
          elevation: 0, //阴影
          leading: Icon(Icons.chevron_left,
            color: Colors.grey,
            size: 40,
          ),

          actions:<Widget>[
         Padding(
           padding:EdgeInsets.only(right: 20.0),
           child:GestureDetector(
             onTap: (){},
             child: Icon(
               Icons.search,
               color: Colors.grey,
               size: 30,
             ),
           ),
         ),
       ],

        ),
        body:HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ListView(
        children: <Widget>[

          Container(
            padding: EdgeInsets.only(left: 16.0),
            height: 30,
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  child: Text('全部记录',
                  style: TextStyle(
                    fontSize: 12,
                    color:Colors.black,
                  ),
                ),
                ),
                Container(
                  child:Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.only(right: 16.0),
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
            color: Colors.white,
            padding:EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('付款记录',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600]
                        ),
                      ),
                      Row(
                        children:[
                          Text('2020年05月30日',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12
                          ),
                          ),
                          SizedBox(width: 10,),
                          Text('交易方名称',
                            style: TextStyle(
                                color:Colors.blue,
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
                  child: Text('-12345.88',
                      style:TextStyle(
                          color: Colors.orange,
                          fontSize: 14
                      )
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10,),
          Container(
            color: Colors.white,
            padding:EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('收款记录',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600]
                        ),
                      ),
                      Row(
                        children: [
                          Text('2020年05月30日',
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text('交易方名称',
                            style: TextStyle(
                                color:Colors.blue,
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
                  child: Text('+12345.88',
                      style:TextStyle(
                          color: Colors.blue,
                          fontSize: 14
                      )
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10,),
          Container(
            color: Colors.white,
            padding:EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('付款记录',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600]
                        ),
                      ),
                      Row(
                        children: [
                          Text('2020年05月30日',
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text('交易方名称',
                            style: TextStyle(
                                color:Colors.blue,
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
                  child: Text('-12345.88',
                      style:TextStyle(
                          color: Colors.orange,
                          fontSize: 14
                      )
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10,),
          Container(
            color: Colors.white,
            padding:EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('收款记录',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600]
                        ),
                      ),
                      Row(
                        children: [
                          Text('2020年05月30日',
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text('交易方名称',
                            style: TextStyle(
                                color:Colors.blue,
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
                  child: Text('+12345.88',
                      style:TextStyle(
                          color: Colors.blue,
                          fontSize: 14
                      )
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10,),
          Container(
            color: Colors.white,
            padding:EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('付款记录',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600]
                        ),
                      ),
                      Row(
                        children: [
                          Text('2020年05月30日',
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text('交易方名称',
                            style: TextStyle(
                                color:Colors.blue,
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
                  child: Text('-12345.88',
                      style:TextStyle(
                          color: Colors.orange,
                          fontSize: 14
                      )
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10,),
          Container(
            color: Colors.white,
            padding:EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('收款记录',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600]
                        ),
                      ),
                      Row(
                        children: [
                          Text('2020年05月30日',
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text('交易方名称',
                            style: TextStyle(
                                color:Colors.blue,
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
                  child: Text('+12345.88',
                      style:TextStyle(
                          color: Colors.blue,
                          fontSize: 14
                      )
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10,),
          Container(
            color: Colors.white,
            padding:EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('付款记录',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600]
                        ),
                      ),
                      Row(
                        children: [
                          Text('2020年05月30日',
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text('交易方名称',
                            style: TextStyle(
                                color:Colors.blue,
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
                  child: Text('-12345.88',
                      style:TextStyle(
                          color: Colors.orange,
                          fontSize: 14
                      )
                  ),
                ),
              ],
            ),
          ),





    ],
    );
  }
}
