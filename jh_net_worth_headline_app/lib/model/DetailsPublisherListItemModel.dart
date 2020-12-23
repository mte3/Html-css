import 'package:flutter/material.dart';

///创建人:李鸿杰
class DetailsPublisherListItemModel {
  //发表人名字
  final String name;
  //发表日期
  final String date;
  //发表人内容
  final String content;
  //是否是选用的答案类型
  final String type;

  DetailsPublisherListItemModel(
      {this.name, this.date, this.content, this.type});
}

//参与回答的回答人列表list
List<DetailsPublisherListItemModel> list = [
  DetailsPublisherListItemModel(
    name: '苏大',
    date: '2020-04-20  20:00',
    content: '他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案',
    type: '最佳答案',
  ),
  DetailsPublisherListItemModel(
    name: '苏东坡',
    date: '2020-04-20  20:00',
    content: '他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案',
    type: '优秀答案',
  ),
  DetailsPublisherListItemModel(
    name: '苏东坡',
    date: '2020-04-20  20:00',
    content: '他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案',
  ),
  DetailsPublisherListItemModel(
    name: '苏东坡',
    date: '2020-04-20  20:00',
    content: '他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案',
  ),
  DetailsPublisherListItemModel(
    name: '苏东坡',
    date: '2020-04-20  20:00',
    content: '他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案他的答案',
  ),
];

TextStyle questionTextStyle(
    {Color color, double size = 10, FontWeight weight = FontWeight.w400}) {
  return TextStyle(
      color: color != null ? color : Color(0xffd9d9d9).withOpacity(0.5),
      fontWeight: weight,
      fontSize: size);
}
