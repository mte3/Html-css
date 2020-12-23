import 'package:flutter/material.dart';
import 'res/listData.dart';
import 'records_page2.dart';
class Administration extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(

      home:Scaffold(
        appBar: AppBar(
          centerTitle: true, //居中对齐
          title :Text("发布管理",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          backgroundColor: Colors.white,
          elevation: 0, //阴影
          leading: InkWell(
            child: Image.asset('assets/images/01.png'),
            onTap: (){
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) =>
                          Record()));
            },
          ),
        ),
        body:HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget{
  Widget _getListData(content,index){
    return Container(
      margin: EdgeInsets.only(bottom: 10),
              height: 40,
              color: Colors.white,
              padding:EdgeInsets.fromLTRB(12, 5, 12, 5),
              child: Row(
                children: [
                  Container(
                        child:Text(aa[index],
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600]
                          ),
                        ),
                  ),
                  Spacer(),
                  Container(
                    child:Icon(Icons.keyboard_arrow_right,color: Color.fromRGBO(191, 191, 191, 1),),

                  ),
    ],
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount:aa.length,
      itemBuilder:this._getListData,
    );
  }
}