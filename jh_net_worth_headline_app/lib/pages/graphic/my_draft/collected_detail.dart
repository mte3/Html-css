import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'button_choose.dart';
import 'catalog_year.dart';

class CollectedDetail extends StatefulWidget {
  final String title;

  CollectedDetail({this.title});

  @override
  _CollectedDetailState createState() => _CollectedDetailState();
}

class _CollectedDetailState extends State<CollectedDetail> {
  bool _isExpanded = true;
  final List _list = ['2020', '2019'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CatalogButton(),
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                SingleChildScrollView(
                  child: ExpansionPanelList(
                    expansionCallback: (int panelIndex, bool isExpanded) {
                      setState(() {
                        _isExpanded = !isExpanded;
                      });
                    },
                    children: [
                      ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return Container(
                            height: 176.0,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20.0, right: 5.0, bottom: 10.0),
                                  width: 120.0,
                                  height: 160.0,
                                  decoration: BoxDecoration(color: Colors.grey),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '作品简介',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        '作品简介,作品简介,作品简介,作品简介,' * 10,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 12.0, color: Colors.grey),
                                        maxLines: 6,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        body: Container(),
                        isExpanded: _isExpanded,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: _list.map((e) {
              return Container(
                margin: EdgeInsets.only(bottom: 10.0),
                color: Colors.white,
                child: ListTile(
                  title: Text(e),
                  subtitle: Text('共5个章节'),
                  trailing: InkWell(
                    child: Icon(Icons.chevron_right),
                    onTap: () {
                      print('dianjil');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => CatalogYear(
                                    catalogTitle: e,
                                  )));
                    },
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
