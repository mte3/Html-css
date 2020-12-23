import 'package:flutter/material.dart';
import 'package:networth/pages/question/question_city/CityPicker.dart';
import 'package:networth/pages/question/question_city/Picker.dart';
import 'package:networth/pages/question/question_city/Province.dart';
import 'package:networth/pages/question/question_city/ShowTypes.dart';
import 'package:networth/pages/question/question_city/modal/result.dart';

var emptyResult = new Result();

class PushScope extends StatefulWidget {
  @override
  _PushScopeState createState() => _PushScopeState();
}

class _PushScopeState extends State<PushScope> {
  List lists = ['不限', '5公里内', '10公里内', '同城', '指定区域'];
  int _radioGroupA = 1;
  PickerItem showTypeAttr = PickerItem(name: '省+市+县', value: ShowType.pca);
  Result resultAttr = new Result();
  Result result = new Result();
  double barrierOpacityAttr = 0.5;
  bool barrierDismissibleAttr = false;
  bool customerMeta = false;
  PickerItem themeAttr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '推送范围',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            'assets/images/question/fabu/fanhui.png',
            width: 24,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/question/fabu/baocun.png',
              width: 24,
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: lists.asMap().keys.map((index) {
              return Container(
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(lists[index]),
                      trailing: Radio(
                        value: index,
                        groupValue: _radioGroupA,
                        onChanged: (v) {
                          setState(() {
                            _radioGroupA = v;
                          });
                        },
                      ),
                    ),
                    index == 3
                        ? InkWell(
                            onTap: () async {
                              print("locationCode $resultAttr");
                              Result tempResult = await CityPickers
                                  .showFullPageCityPicker(
                                      context: context,
                                      theme:
                                          themeAttr != null
                                              ? themeAttr.value
                                              : null,
                                      locationCode: resultAttr != null
                                          ? resultAttr.areaId ??
                                              resultAttr.cityId ??
                                              resultAttr.provinceId
                                          : null,
                                      showType: showTypeAttr.value,
                                      citiesData:
                                          customerMeta ? citiesData : null,
                                      provincesData:
                                          customerMeta ? provincesData : null);
                              if (tempResult == null) {
                                return;
                              }
                              this.setState(() {
                                result = tempResult;
                              });
                              _radioGroupA=3;
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 20, right: 24),
                              child: Row(
                                children: <Widget>[
                                  Text('您的城市'),
                                  Spacer(),
//                                  Text(result.provinceName+'/'+result.cityName,style: TextStyle(color: Colors.grey),),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    size: 30,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                            ),
                          )
                        : SizedBox()
                  ],
                ),
              );
            }).toList(),
          ),

        ],
      ),
    );
  }
}
