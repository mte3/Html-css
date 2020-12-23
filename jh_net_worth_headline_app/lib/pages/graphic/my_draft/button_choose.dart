import 'package:flutter/material.dart';

class CatalogButton extends StatefulWidget {
  final VoidCallback cancelOntap;
  final VoidCallback yesOntap;

  CatalogButton({Key key, this.cancelOntap, this.yesOntap});

  @override
  _CatalogButtonState createState() => _CatalogButtonState();
}

class _CatalogButtonState extends State<CatalogButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 48.0,
      child: Row(
        children: <Widget>[
          InkWell(
            child: Container(
                decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: Colors.grey))),
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  '取消',
                  textAlign: TextAlign.center,
                )),
            onTap: widget.cancelOntap,
          ),
          InkWell(
            child: Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  '发布到此目录',
                  textAlign: TextAlign.center,
                )),
            onTap: widget.yesOntap,
          ),
        ],
      ),
    );
  }
}

class CatalogList extends StatefulWidget {
  final String catalogTitle;
  final String subTitle;
  final VoidCallback catalogOntap;
  final Widget actionWidget;

  CatalogList({this.catalogTitle, this.subTitle,this.catalogOntap,this.actionWidget});

  @override
  _CatalogListState createState() => _CatalogListState();
}

class _CatalogListState extends State<CatalogList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 48.0,
      margin: EdgeInsets.only(
        bottom: 10.0,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(widget.catalogTitle,
                  style: TextStyle(
                    fontSize: 16.0,
                  )),
              Text(
                '共${widget.subTitle}个章节',
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
              )
            ],
          ),
          InkWell(
            child: widget.actionWidget,
            onTap: widget.catalogOntap,
          ),
        ],
      ),
    );
  }
}
