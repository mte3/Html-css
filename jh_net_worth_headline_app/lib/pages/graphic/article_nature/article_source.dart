import 'package:flutter/material.dart';

///文章性质-文章出处
class ArticleSource extends StatefulWidget {
  @override
  _ArticleSourceState createState() => _ArticleSourceState();
}

class _ArticleSourceState extends State<ArticleSource> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text(
          '文章出处',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.access_time,
              color: Colors.black,
              size: 30.0,
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              '文章原链接',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'http://',
                  style: TextStyle(fontSize: 20.0, color: Colors.grey),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 25.0,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
