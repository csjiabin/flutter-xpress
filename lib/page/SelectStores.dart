import 'package:flutter/material.dart';

class SelectStores extends StatefulWidget {
  @override
  SelectStoresState createState() => new SelectStoresState();
}

class SelectStoresState extends State<SelectStores> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        centerTitle:true,
        leading: new IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        title: new Center(
          child: new Text('选择门店', style: TextStyle(color: Colors.black)),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('地址管理'),
            onPressed: () {
              Navigator.pushNamed(context, '/address');
            },
          )
        ],
      ),
      body: new Container(
        child: Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  decoration: const BoxDecoration(
                    border: const Border(
                      top: const BorderSide(width: 1.0, color: Colors.green),
                      right: const BorderSide(width: 1.0, color: Colors.green),
                      left: const BorderSide(width: 1.0, color: Colors.green),
                      bottom: const BorderSide(width: 1.0, color: Colors.green),
                    ),
                  ),
                  child: new Text(
                    '默认',
                    style: TextStyle(color: Colors.green)
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
