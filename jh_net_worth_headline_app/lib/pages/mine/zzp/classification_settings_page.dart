import 'package:flutter/material.dart';

class ClassificationSettingsPage extends StatefulWidget {
  @override
  _ClassificationSettingsPageState createState() => _ClassificationSettingsPageState();
}

class _ClassificationSettingsPageState extends State<ClassificationSettingsPage> {
  List setting = [
    {"name":"真实资料"},
    {"name":"场景应用"},
    {"name":"兴趣爱好"},
    {"name":"个性特征"},
    {"name":"交友条件"},
    {"name":"征婚要求"},
    {"name":"身份认证"},
    {"name":"地址管理"},
    {"name":"文化教育"},
    {"name":"技能资质"},
    {"name":"收费设置"},
    {"name":"工作经历"},
    
  ];
  Widget settingIndividual (name){
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Text(name,style: TextStyle(fontSize: 14),),
              Spacer(),
              Icon(Icons.chevron_right,color: Colors.grey[300],)
            ],
          ),
        ),
        Container(
          height: 5,
          color: Colors.grey[200],
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          leading: UnconstrainedBox(
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/images/back.png",
                height: 24,
                width: 24,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "分类设置",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemBuilder: (context,index){
            return settingIndividual(setting[index]["name"]);
          },
          itemCount: setting.length,
        ),
    );
  }
}