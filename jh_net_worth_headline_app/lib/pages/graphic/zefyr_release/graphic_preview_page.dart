import 'package:flutter/material.dart';
import 'package:networth/components/appbar_widget/navigation_bar.dart';

///图文预览
///
///
class GraphicPreviewPage extends StatelessWidget {
  final List<String> _content = [
    '昨夜雨疏风骤,',
    '浓睡不消残酒,',
    '试问卷帘人,却道海棠依旧。',
    '知否, 知否，应是绿肥红瘦。',
  ];

  Widget _borderItem({Color color, String title}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: color, width: 1)),
      child: Text(
        title,
        style: TextStyle(color: color, fontSize: 10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new NavigationBar(title: "图文预览"),
      body: new ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        children: <Widget>[
          new Text(
            '一剪梅·红藕香残玉簟秋',
            style: TextStyle(
                color: Color(0xff262626),
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          new SizedBox(height: 8.0),
          new Row(
            children: <Widget>[
              _borderItem(color: Color(0xFF7EBFFC), title: '原创'),
              new SizedBox(width: 10.0),
              new Text(
                '李清照',
                style: new TextStyle(
                  color: Color(0xFF595959),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          new Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Image.network(
              'https://img02.mockplus.cn/idoc/xd/2020-06-03/4395e41e-57bb-4c98-82b9-a225af702ff3.png',
              fit: BoxFit.cover,
            ),
            height: 200.0,
          ),
        ]..addAll(
            _content.map(
              (item) => new Text(
                item,
                style: new TextStyle(height: 3),
              ),
            ),
          ),
      ),
    );
  }
}
