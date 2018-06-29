import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key key, this.scaffoldKey}) : super(key: key);
  final scaffoldKey;
  @override
  MyPageState createState() => new MyPageState();
}

class MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          title: new Center(
            child: new Text('mine', style: TextStyle(color: Colors.black)),
          ),
        ),
        body: new Center(
          child: new RaisedButton(
            child: new Text('BUTTON'),
            onPressed: () {
              widget.scaffoldKey.currentState.openDrawer();
            },
            color: Colors.blue,
            textColor: Colors.white,
          ),
        ));
  }
}
