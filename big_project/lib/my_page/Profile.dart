import 'package:big_project/bar/navigationbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.08,),
            height:login? MediaQuery.of(context).size.height*0.24:
            MediaQuery.of(context).size.height*0.22,
            width:MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: !login?Text('登录/注册',style: TextStyle(fontSize: 16),):
                  Row(
                    children: <Widget>[
                      Text('疾风剑豪',style: TextStyle(fontSize: 16),),
                      Icon(Icons.arrow_upward,color: Colors.blue,)
                    ],
                  ),
                  subtitle:!login? Text('登录可更好地享受服务',style: TextStyle(color: Colors.grey),):
                  null,
                  trailing: Icon(Icons.chevron_right),
                  leading: Container(
                    child:login? ClipOval(
                      child: Image.network(
                        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600681959662&di=d6d95dfed26906e2bd7b4cd30f8ef5d7&imgtype=0&src=http%3A%2F%2Fpic67.nipic.com%2Ffile%2F20150515%2F20861781_120125171000_2.jpg',
                        fit: BoxFit.cover,
                      ),
                    ):Icon(Icons.perm_identity,size: MediaQuery.of(context).size.width*0.14,),
                  ),
                ),
                SizedBox(height:login? MediaQuery.of(context).size.height*0.03:MediaQuery.of(context).size.height*0.03,),
                login?Row(
                  children: <Widget>[
                    SizedBox(width: 16,),
                    Text('52.6w'),
                    Text('获赞',style: TextStyle(color: Colors.grey)),
                    SizedBox(width: 24,),
                    Text('123'),
                    Text('关注',style: TextStyle(color: Colors.grey)),
                    SizedBox(width: 24,),
                    Text('22.3'),
                    Text('粉丝',style: TextStyle(color: Colors.grey)),
                  ],
                ):SizedBox()
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            color: Colors.white,
            height: MediaQuery.of(context).size.height*0.6,
            child:ListView.separated(
              padding: EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              itemCount:_profile.length ,
              itemBuilder: (context,index){
                return Container(
                  child: ListTile(
                    title: Text(_profile[index][1]),
                    leading: _profile[index][0],
                    trailing: Icon(Icons.chevron_right),
                  ),
                );
              },
              separatorBuilder: (BuildContext context,index) =>
                  Divider(height: 1.0, color: Colors.grey),
            )
          )
        ],
      ),
    );
  }
}

List _profile = [
  [
    Icon(Icons.message),
    '我的消息'
  ],
  [
    Icon(Icons.message),
    '我的消息'
  ],
  [
    Icon(Icons.message),
    '我的消息'
  ],
  [
    Icon(Icons.message),
    '我的消息'
  ],
  [
    Icon(Icons.message),
    '我的消息'
  ],
  [
    Icon(Icons.message),
    '我的消息'
  ],
  [
    Icon(Icons.message),
    '我的消息'
  ],

];