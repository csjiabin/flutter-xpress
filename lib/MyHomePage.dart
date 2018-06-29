import 'package:flutter/material.dart';
import 'MyPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  double _volume = 0.1;

  @override
  void initState() {
    super.initState();
  }

  void actionButtonTap() {
    Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => new MyPage(title: 'odos[index]'),
        ));
    TransitionBuilder:
    new AnimatedCrossFade(
        duration: const Duration(seconds: 3),
        firstChild:
            const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
        secondChild:
            const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
        crossFadeState: CrossFadeState.showFirst);
  }

  @override
  // TODO: implement widget
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Home Page',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new IconButton(
            icon: new Icon(
              Icons.star,
              color: Colors.red[500],
            ),
            tooltip: 'Increase volume by 10%',
            onPressed: () {
              setState(() {
                _volume *= 1.1;
              });
            },
          ),
          new Text('41'),
        ],
      ),
    );
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new IconButton(
            icon: new Icon(icon, color: color),
            tooltip: 'Increase volume by 10%',
            onPressed: () {
              setState(() {
                _volume *= 1.1;
              });
            },
          ),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL A'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
    return new Scaffold(
      body: new ListView(
        children: [
          new Image.asset(
            'images/lake.jpg',
            width: 600.0,
            height: 240.0,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
          textSection
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Increment',
        child: new Icon(Icons.add),
        onPressed: actionButtonTap,
      ), // This trailing com,
    );
  }
}
