import 'package:flutter/material.dart';
import 'HomeCarousel.dart';
import 'HomeHeader.dart';
import 'HomeBody.dart';
import '../../ImagePickerPage.dart';

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

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

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  String choiceselect = choices[2].title;
  List imgs = [
    'https://wx1.sinaimg.cn/thumb180/69e273f8ly1fspuvlkd78j21sg1sg7wh.jpg',
    'https://ww4.sinaimg.cn/thumb180/68751109ly1fsq0p360w0j22c03407wo.jpg',
    'https://ww4.sinaimg.cn/thumb180/68751109ly1fsq0oawb9jj23402c04qx.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    Widget buttonSection = new Container(
      padding: new EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: new Row(
        children: <Widget>[
          new Text(choiceselect),
          new Icon(Icons.arrow_left),
        ],
      ),
    );
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        bottomOpacity: 0.6,
        title: new Center(
            child: new FlatButton(
          textColor: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/stores');
          },
          child: new ListView(
            children: <Widget>[
              buttonSection,
              new Text(
                'Alor Star',
                style:
                    new TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
              )
            ],
          ),
        )),
        actions: <Widget>[
          new IconButton(
            // action button
            icon: new Icon(Icons.search),
            onPressed: () {},
          ),
          new IconButton(
            // action button
            icon: new Icon(Icons.crop_free),
            onPressed: () async {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) =>
                        new ImagePickerPage(title: 'odos[index]'),
                  ));
            },
          )
        ],
      ),
      body: new Container(
          child: new ListView(
        children: <Widget>[
          new HomeCarousel(
            imgs: imgs,
          ),
          new HomeHeader(imgs: imgs),
          new HomeBody()
        ],
      )),
    );
  }
}
