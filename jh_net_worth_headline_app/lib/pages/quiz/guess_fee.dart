import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


///竞猜性质-聚会类-费用说明
///
///
class GuessFee extends StatefulWidget {
  @override
  _GuessFeeState createState() => _GuessFeeState();
}

class _GuessFeeState extends State<GuessFee> {
  bool check = true;
  final List say = [
    ['胜者免费',true],['负者自费',false],['差额由发起人补足',false],['余额用于网值公益',false]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('费用说明'),
      ),
        body:Container(
          color: Colors.grey[200],
          child: ListView(
            children: <Widget>[
              Container(

                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 4.0),
                child: Text('复选项',style: TextStyle(fontSize: 12.0),),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                color: Colors.white,
                child: Column(
                  children: List.generate(say.length, (index){
                    return InkWell(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(say[index][0]),
                            Checkbox(value: say[index][1], onChanged: (v){
                              setState(() {
                                say[index][1] = !say[index][1];
                              });
                            })
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        )
    );
  }
}
