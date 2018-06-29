import 'package:flutter/material.dart';

class CreateAddress extends StatefulWidget {
  @override
  CreateAddressState createState() => new CreateAddressState();
}

class CreateAddressState extends State<CreateAddress> {
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
          child: new Text('新增配送地址', style: TextStyle(color: Colors.black)),
        ),
      ),
      body: new Center(
        child: new Text('地址管理'),
      ),
    );
  }
}
