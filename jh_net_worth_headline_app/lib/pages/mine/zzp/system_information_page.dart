import 'package:flutter/material.dart';

class SystemInformationPage extends StatefulWidget {
  @override
  _SystemInformationPageState createState() => _SystemInformationPageState();
}

class _SystemInformationPageState extends State<SystemInformationPage> {
  List systemInformation = [
    {"name": "个人通知", "isread": false,"image":"assets/images/rersonal_notice.png"},
    {"name": "竞猜活动", "isread": true,"image":"assets/images/guess_activity.png"},
    {"name": "投票活动", "isread": true,"image":"assets/images/voting_activity.png"},
    {"name": "问答活动", "isread": true,"image":"assets/images/Q&A_activity.png"},
  ];
  Widget systemInformationIndividual(String name, bool isread,String image) {
    return Column(
      children: <Widget>[
        Container(
          height: 58,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 28,
                    width: 28,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ClipOval(
                      child: Container(
                        color: !isread?Colors.blue:Colors.grey[400],
                        width: 24,
                        height: 24,
                        child: UnconstrainedBox(child: Image.asset(image,width: 15,height: 15,)),
                      ),
                    ),
                  ),
                  isread
                      ? Container()
                      : Positioned(
                          top: 4,
                          right: 0,
                          child: ClipOval(
                            child: Container(
                              height: 6,
                              width: 6,
                              color: Colors.blue,
                            ),
                          )),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(fontSize: 14),
                    ),
                    Spacer(),
                    Text(
                      "起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉起床睡觉",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 10, color: Colors.grey[400]),
                    )
                  ],
                ),
              ),
              Text(
                "10分钟前",
                style: TextStyle(fontSize: 10, color: Colors.grey[400]),
              )
            ],
          ),
        ),
        Container(
          height: 10,
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
          "系统消息",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: systemInformation.length,
          itemBuilder: (context, index) {
            return systemInformationIndividual(systemInformation[index]["name"],
                systemInformation[index]["isread"],systemInformation[index]["image"]);
          }),
    );
  }
}
