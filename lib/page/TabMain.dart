import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'HomePage/Home.dart';
import 'HomePage/Example2.dart';
import 'HomePage/Example3.dart';
import 'HomePage/Example4.dart';
import 'HomePage/My.dart';
import 'ShoppingCart.dart';
import '../components/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:badge/badge.dart';
class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

// class Play{
//   const Play({this.offset});
//   final int offset;
// }
// const Object<Play> body = const <Play>{
//   const Play(offset: 0)
// };
const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];

const Color _kAppBackgroundColor = const Color(0xFF353662);
const Duration _kScrollDuration = const Duration(milliseconds: 400);
const Curve _kScrollCurve = Curves.fastOutSlowIn;

class TabMain extends StatefulWidget {
  @override
  _TabMainState createState() => new _TabMainState();
}

class _TabMainState extends State<TabMain> {
  String choiceselect = choices[2].title;
  List playlist = [];
  int tabIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    _getPlaylist();
    super.initState();
  }

  Future<Null> _getPlaylist() async {
    var httpClient = new HttpClient();

    var uri = new Uri.http(
      'www.hjbnice.com',
      '/music/top/playlist',
    );
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(UTF8.decoder).join();
    Map data = JSON.decode(responseBody);
    playlist.addAll(data['playlists']);
    return null;
  }

  _tabActiveColor(int index) {
    return tabIndex == index ? Colors.green : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    GestureDetector buildButtonColumn(
      IconData icon,
      String label,
      int index,
    ) {
      return new GestureDetector(
        child: new Padding(
          padding: EdgeInsets.only(left: 4.0,right: 4.0),
          child: new Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(icon, color: _tabActiveColor(index)),
            new Text(label,
                style: new TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: _tabActiveColor(index),
                )),
          ],
        ),
        ),
        onTap: () {
          setState(() {
            tabIndex = index;
          });
        },
      );
    }

    Widget buttonNavBarSection = new Container(
      color: Colors.white70,
      height: 55.0,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.home, '首页', 0),
          buildButtonColumn(Icons.view_list, '分类', 1),
          buildButtonColumn(Icons.label, '促销', 2),
          buildButtonColumn(Icons.add_shopping_cart, '购物车', 3),
          buildButtonColumn(Icons.person, '我的', 4)
        ],
      ),
    );
    return new Scaffold(
      key: _scaffoldKey,
      body: new Stack(
        children: <Widget>[
          new Offstage(
            child: new HomePage(),
            offstage: tabIndex != 0,
          ),
          new Offstage(
            child: new Example2(),
            offstage: tabIndex != 1,
          ),
          new Offstage(
            child: new Example3(),
            offstage: tabIndex != 2,
          ),
          new Offstage(
            child: new ShoppingCart(),
            offstage: tabIndex != 3,
          ),
          new Offstage(
            child: new MyPage(scaffoldKey: _scaffoldKey),
            offstage: tabIndex != 4,
          ),
          new Stack(
            children: <Widget>[
              new Positioned(
                bottom: 0.0,
                width: getScreenWidth(context),
                child: buttonNavBarSection,
              )
            ],
          ),
          new Stack(
            children: <Widget>[
              new Positioned(
                  bottom: 45.0,
                  left: (getScreenWidth(context) / 5) * 3 + 30,
                  child: new Container(
                    padding: EdgeInsets.only(left: 5.0,right: 5.0),
                    color: Colors.red,
                    // decoration: const BoxDecoration(
                    //   borderRadius:const BorderRadius.all(Radius.circular(2.0))
                    // ),
                    child: new Text(
                      '12',
                      style: new TextStyle(color: Colors.white),
                    ),
                  )),
            ],
          )
        ],
      ),
      // drawer: new Drawer(
      //   child: new Column(
      //     children: <Widget>[
      //       new MediaQuery.removePadding(
      //         context: context,
      //         // DrawerHeader consumes top MediaQuery padding.
      //         removeTop: true,
      //         child: const ListTile(
      //           leading: const Icon(Icons.payment),
      //           title: const Text('Placeholder'),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // bottomNavigationBar: new CupertinoTabBar(
      //     items: [
      //       new BottomNavigationBarItem(
      //           icon: new Icon(Icons.home), title: new Text('首页')),
      //       new BottomNavigationBarItem(
      //           icon: new Icon(Icons.view_list), title: new Text('分类')),
      //       new BottomNavigationBarItem(
      //           icon: new Icon(Icons.label), title: new Text('促销')),
      //       new BottomNavigationBarItem(
      //           icon: new Icon(Icons.add_shopping_cart),
      //           title: new Text('购物车')),
      //       new BottomNavigationBarItem(
      //           icon: new Icon(Icons.person), title: new Text('我的')),
      //     ],
      //     onTap: (index) {
      //       setState(() {
      //         tabIndex = index;
      //       });
      //     },
      //     iconSize: 28.0,
      //     currentIndex: tabIndex,
      //     activeColor: Colors.green
      //     // fixedColor: Colors.grey,
      //     // type: BottomNavigationBarType.fixed,
      //     ),
    );
  }
}
