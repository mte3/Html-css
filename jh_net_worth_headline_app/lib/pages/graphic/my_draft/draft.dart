import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'collected_work.dart';

class Draft extends StatefulWidget {
  @override
  _DraftState createState() => _DraftState();
}

class _DraftState extends State<Draft> {
  final List<DropdownMenuItem> _list = [
    DropdownMenuItem(child: Text('发布')),
    DropdownMenuItem(child: Text('预览')),
    DropdownMenuItem(child: Text('编辑')),
    DropdownMenuItem(child: Text('删除')),
  ];
  final List _item = [
    '文章',
    '文集',
    '连载',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('一剪梅-红藕香残玉润秋',style: TextStyle(fontSize: 18.0),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 40.0,
                        height: 20.0,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: Colors.redAccent)),
                        child: Text(
                          '草稿',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                      Text('2020.04.21'),
                      SizedBox(width: 10.0,),
                      Text('637字'),
                      Text('0图'),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child:Container(
                            child:                           DropdownButton(
                              items: _list,
                              onChanged: (v) {
                                setState(() {
                                  print('$v');
                                  showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return _shareWidget(context);
                                      });
                                });
                              },
                              underline: Container(),
                              hint: Text('...'),
                            ),
                          ),

                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }

  Widget _shareWidget(BuildContext context) {
    return Container(
      height: 248.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            child: Text(
              '发布至',
              style: TextStyle(fontSize: 18.0, color: Colors.grey),
            ),
            alignment: Alignment.center,
          )),
          Column(
            children: _item.map((i) {
              return InkWell(
                onTap: () {
                  print(i);
                  if(i=='文章'){
                    Navigator.pop(context);
                    showDialog(context: context,builder: (BuildContext context){
                      return CupertinoAlertDialog(
                        title: Text('确定发布到 【文章】?'),
                        actions: <Widget>[
                          CupertinoDialogAction(child: Text('取消')),
                          CupertinoDialogAction(child: Text('确定'),onPressed: (){
                            setState(() {

                            });
                          },),
                        ],
                      );
                    });
                  }else if(i=='文集'){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CollectedWork(),));
                  }

                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.grey[200])),
                  ),
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text(
                    i,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          Container(
            height: 5.0,
            color: Colors.grey,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Text(
                  '取消',
                  style: TextStyle(fontSize: 18.0, color: Colors.grey),
                ),
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

