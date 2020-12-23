
import 'package:bigproject/widget/appbar.dart';
import 'package:flutter/material.dart';

import 'my_library_serial/add_serial_widget.dart';


///竞猜性质-公益类-资金处理页面

class CapitalTreatment extends StatefulWidget {
  @override
  _CapitalTreatmentState createState() => _CapitalTreatmentState();
}

bool winnerFree = false;//是否胜者免费
bool sponsorTrusteeship = false;//是否由发起人托管
bool appTrusteeship = false;//是否由网值托管
bool a = false;//是否确定公益项目后由网值直接付款
bool b = false;//余额是否用于网值公益
class _CapitalTreatmentState extends State<CapitalTreatment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: MainAppBar(
        title: '资金处理',
        rightDMActions: <Widget>[
          Image.asset('assets/images/drawable-xxxhdpi/preservation.png',width: 24,),SizedBox(width: 16,),
        ],
      ),
      body: Column(
        children: <Widget>[
          ReadSettingList(
            title: '胜者免费',
            isHandel:winnerFree,
            onTaps: (){
              setState(() {
                winnerFree = !winnerFree;
                if(winnerFree){
                  sponsorTrusteeship=false;
                  appTrusteeship = false;
                }
              });
            },
          ),
          ReadSettingList(
            title: '由网值托管',
            isHandel:appTrusteeship,
            onTaps: (){
              setState(() {
                appTrusteeship = !appTrusteeship;
                if(appTrusteeship){
                  winnerFree = false;
                  sponsorTrusteeship = false;
                }
              });
            },
          ),
          appTrusteeship?
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                CheckboxListTile(
                  value: a,
                  title: Text('确定公益项目后由网值直接付款',
                    style: TextStyle(fontSize: 14,color: Colors.grey),),
                  onChanged: (v){
                    setState(() {
                      a = v;
                    });
                  },
                ),
                CheckboxListTile(
                  value: b,
                  title: Text('余额用于网值公益',style: TextStyle(fontSize: 14,color: Colors.grey),),
                  onChanged: (v){
                    setState(() {
                      b = v;
                    });
                  },
                ),
              ],
            ),
          ):SizedBox(),
          ReadSettingList(
            title: '由发起人托管',
            isHandel:sponsorTrusteeship,
            onTaps: (){
              setState(() {
                sponsorTrusteeship = !sponsorTrusteeship;
                if(sponsorTrusteeship){
                  appTrusteeship = false;
                  winnerFree = false;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}

