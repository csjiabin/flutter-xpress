import 'package:flutter/material.dart';
import 'MyHomePage.dart';
import 'page/TabMain.dart';
import 'page/SelectStores.dart';
import 'page/AddressManagement.dart';
import 'page/CreateAddress.dart';
import 'page/ShoppingCart.dart';
import 'dart:ui';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: <String, WidgetBuilder>{
      '/': (BuildContext context) => new TabMain(),
      '/stores': (BuildContext context) => new SelectStores(),
      '/address':(BuildContext context) => new AddressManagement(),
      '/address/create':(BuildContext context) => new CreateAddress(),
      '/shoppingcart':(BuildContext context) => new ShoppingCart(),
    });
  }
}

void main() => runApp(new MyApp());
