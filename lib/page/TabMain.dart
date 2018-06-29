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
    
    var uri = new Uri.http('www.hjbnice.com', '/music/top/playlist', );
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
    // Column buildButtonColumn(IconData icon, String label, int index) {
    //   return new Column(
    //     mainAxisSize: MainAxisSize.min,
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       new InkWell(
    //         child: new Icon(icon, color: _tabActiveColor(index)),
    //         onTap: () {
    //           setState(() {
    //             tabIndex = index;
    //           });
    //         },
    //       ),
    //       new Container(
    //         margin: const EdgeInsets.only(top: 8.0),
    //         child: new Text(
    //           label,
    //           style: new TextStyle(
    //             fontSize: 12.0,
    //             fontWeight: FontWeight.w400,
    //             color: _tabActiveColor(index),
    //           ),
    //         ),
    //       ),
    //     ],
    //   );
    // }

    // Widget buttonSection = new Container(
    //   color: Colors.white70,
    //   height: 80.0,
    //   padding: const EdgeInsets.only(top: 8.0),
    //   child: new Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       buildButtonColumn(Icons.home, 'home', 0),
    //       buildButtonColumn(Icons.view_list, 'category', 1),
    //       buildButtonColumn(Icons.label, 'promotion', 2),
    //       buildButtonColumn(Icons.add_shopping_cart, 'cart', 3),
    //       buildButtonColumn(Icons.person, 'mine', 4)
    //     ],
    //   ),
    // );

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
          // new Positioned(
          //   width: getScreenWidth(context),
          //   bottom: 0.0,
          //   child: buttonSection,
          // ),
          // new Stack(
          //   children: <Widget>[
          //     new Positioned(
          //       bottom: 60.0,
          //       left: getScreenWidth(context) -
          //           getScreenWidth(context) / 5 -
          //           30.0,
          //       child: new Text('1'),
          //     )
          //   ],
          // ),
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
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home, color: _tabActiveColor(0)),
              title: new Text('首页',
                  style: new TextStyle(color: _tabActiveColor(0)))),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.view_list, color: _tabActiveColor(1)),
              title: new Text('分类',
                  style: new TextStyle(color: _tabActiveColor(1)))),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.label, color: _tabActiveColor(2)),
              title: new Text('促销',
                  style: new TextStyle(color: _tabActiveColor(2)))),
          new BottomNavigationBarItem(
              icon:
                  new Icon(Icons.add_shopping_cart, color: _tabActiveColor(3)),
              title: new Text('购物车',
                  style: new TextStyle(color: _tabActiveColor(3)))),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.person, color: _tabActiveColor(4)),
              title: new Text('我的',
                  style: new TextStyle(color: _tabActiveColor(4)))),
        ],
        onTap: (index) {
          setState(() {
            tabIndex = index;
          });
        },
        currentIndex: tabIndex,
        fixedColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
