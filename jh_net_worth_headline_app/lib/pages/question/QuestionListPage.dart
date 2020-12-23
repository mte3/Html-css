import 'package:flutter/material.dart';
import 'question_details_participant_page.dart';

///问答页面
///创建人：邓柏源

class QuestionListPage extends StatefulWidget {
  @override
  QuestionListPageState createState() => new QuestionListPageState();
}

class QuestionListPageState extends State<QuestionListPage>
    with SingleTickerProviderStateMixin {
  List<Widget> qAndATabBar = <Widget>[
    Tab(text: "关注"),
    Tab(text: "附近"),
    Tab(text: "热门"),
    Tab(text: "社会"),
    Tab(text: "科技"),
    Tab(text: "教育")
  ];
  TabController qAndAController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {},
          child: Image.asset('assets/icons/icon_notice.png'),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Image.asset('assets/icons/icon_personal.png'),
          ),
        ],
        title: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 30),
          child: TextField(
            maxLines: 1,
            cursorColor: Color(0xff6E6E6E),
            decoration: InputDecoration(
              hintText: "搜你想要",
              hintStyle: TextStyle(color: Color(0xffCECECE)),
              prefixIcon: Image.asset('assets/icons/icon_search_min.png'),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              contentPadding: EdgeInsets.symmetric(vertical: 4),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff6E6E6E)),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Color(0xffF5F5F5),
        child: ListView(
          children: [
            Container(
              height: 44,
              child: TabBar(
                tabs: qAndATabBar,
                controller: qAndAController,
                labelColor: Colors.blue,
                indicatorColor: Colors.blue,
                unselectedLabelColor: Colors.black,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 44,
              child: TabBarView(
                controller: qAndAController,
                children: qAndATabBar.map(
                  (item) {
                    return ListView(
                      children: List.generate(
                        10,
                        (index) {
                          return Container(
                            color: Colors.white,
                            margin: EdgeInsets.only(bottom: 10),
                            child: ListTile(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          QuestionDetailsParticipantPage())),
                              title: Text(
                                "为什么有些人喝完牛奶会拉肚子",
                                style: TextStyle(fontSize: 14),
                              ),
                              subtitle: Column(
                                children: [
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Container(
                                        width: 32,
                                        height: 18,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffBADDFD),
                                              width: 1.0),
                                        ),
                                        child: Text(
                                          "问答",
                                          style: TextStyle(
                                              color: Color(0xffBADDFD),
                                              fontSize: 12),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "李清照",
                                        style: TextStyle(
                                            color: Color(0xff8E8E8E),
                                            fontSize: 10),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "1小时前",
                                        style: TextStyle(
                                            color: Color(0xff8E8E8E),
                                            fontSize: 10),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.thumb_up,
                                        color: Color(0xffDFDFDF),
                                        size: 15,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "108",
                                        style: TextStyle(
                                            color: Color(0xff8E8E8E),
                                            fontSize: 10),
                                      ),
                                      SizedBox(width: 20),
                                      Icon(
                                        Icons.thumb_up,
                                        color: Color(0xffDFDFDF),
                                        size: 15,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "108",
                                        style: TextStyle(
                                            color: Color(0xff8E8E8E),
                                            fontSize: 10),
                                      ),
                                      SizedBox(width: 20),
                                      Icon(
                                        Icons.thumb_up,
                                        color: Color(0xffDFDFDF),
                                        size: 15,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "108",
                                        style: TextStyle(
                                            color: Color(0xff8E8E8E),
                                            fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.blue,
        radius: 30,
        child: Icon(Icons.add, color: Colors.white, size: 40),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    qAndAController = TabController(length: qAndATabBar.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(QuestionListPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
