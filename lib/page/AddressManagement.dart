import 'package:flutter/material.dart';

class AddressManagement extends StatefulWidget {
  @override
  AddressManagementState createState() => new AddressManagementState();
}

class AddressManagementState extends State<AddressManagement> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        leading: new IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        centerTitle:true,
        title: new Center(
          child: new Text('地址管理', style: TextStyle(color: Colors.black)),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('新增地址'),
            onPressed: () {
              Navigator.pushNamed(context, '/address/create');              
            },
          )
        ],
      ),
      body: new Center(
        child: new Text('地址管理'),
      ),
    );
  }
}
