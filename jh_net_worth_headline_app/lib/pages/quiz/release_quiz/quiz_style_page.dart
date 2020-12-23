import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:networth/components/appbar_widget/navigation_bar.dart';

///发布竞猜-竞猜类型
///
///
class QuizStylePage extends StatefulWidget {
  @override
  _QuizStylePageState createState() => _QuizStylePageState();
}

class _QuizStylePageState extends State<QuizStylePage> {
  @override
  Widget build(BuildContext context) {
    double winWidth = MediaQuery.of(context).size.width;
    double itemSpace = (winWidth - 296) / 3;
    return Scaffold(
        appBar: NavigationBar(
          title: '竞猜类型',
          rightDMActions: <Widget>[
            InkWell(
              child: Image.asset(
                'assets/images/ic_save.png',
                width: 24,
                height: 24,
              ),
              onTap: () {},
            ),
            SizedBox(width: 16)
          ],
        ),
        body: ListView(
          children: <Widget>[
            // 默认类型
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
              child: Text('默认类型', style: TextStyle(fontSize: 16)),
            ),
            Container(
              // alignment: Alignment.,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Wrap(
                spacing: itemSpace,
                runSpacing: 8,
                children: ['网络', '知识', '体育', '互动', '趣味', '商业', '男性', '女性']
                    .map((item) {
                  return InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      width: 66.0,
                      height: 26.0,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Text(
                        item,
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff8c8c8c)),
                      ),
                    ),
                    onTap: () => action(item),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 10),
            // 自定义
            InkWell(
              child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 16),
                  child: Row(
                    children: <Widget>[
                      Text('自定义', style: TextStyle(fontSize: 16)),
                      Spacer(),
                      Icon(
                        Icons.add_circle_outline,
                        color: Colors.grey,
                      )
                    ],
                  )),
              onTap: () {
                print('自定义');
              },
            )
          ],
        ));
  }

  action(type) {
    Navigator.maybePop(context, type);
  }
}
