import 'package:flutter/material.dart';
import '../../components/utils.dart';

class HomeHeader extends StatefulWidget {
  final List imgs;
  const HomeHeader({Key key, this.imgs}) : super(key: key);
  @override
  HomeHeaderState createState() => new HomeHeaderState();
}

class HomeHeaderState extends State<HomeHeader> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List imgs = widget.imgs;
    return new Container(
      child: new Row(
        children: <Widget>[
          new Column(
            children: <Widget>[
              new Container(
                width: getScreenWidth(context) / 3,
                height: 200.0,
                padding: new EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                  border: const Border(
                    right: const BorderSide(width: 1.0, color: Colors.grey),
                  ),
                ),
                child: new Image.network(
                  imgs[1],
                  fit: BoxFit.fill,
                  // width: getScreenWidth(context) / 3,
                  // height: 200.0,
                ),
              )
            ],
          ),
          new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      new Container(
                        width: (getScreenWidth(context) / 3),
                        height: 100.0,
                        padding: new EdgeInsets.all(4.0),
                        decoration: const BoxDecoration(
                          border: const Border(
                            right: const BorderSide(
                                width: 1.0, color: Colors.grey),
                          ),
                        ),
                        child: new Image.network(
                          imgs[2],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  new Column(
                    children: <Widget>[
                      new Container(
                        width: (getScreenWidth(context) / 3),
                        height: 100.0,
                        padding: new EdgeInsets.all(4.0),
                        decoration: const BoxDecoration(
                          border: const Border(
                            right: const BorderSide(
                                width: 1.0, color: Colors.grey),
                          ),
                        ),
                        child: new Image.network(
                          imgs[1],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              new Row(
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      new Container(
                        width: (getScreenWidth(context) / 3),
                        height: 100.0,
                        padding: new EdgeInsets.all(4.0),
                        decoration: const BoxDecoration(
                          border: const Border(
                            right: const BorderSide(
                                width: 1.0, color: Colors.grey),
                            top: const BorderSide(
                                width: 1.0, color: Colors.grey),
                          ),
                        ),
                        child: new Image.network(
                          imgs[2],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  new Column(
                    children: <Widget>[
                      new Container(
                        width: (getScreenWidth(context) / 3),
                        height: 100.0,
                        padding: new EdgeInsets.all(4.0),
                        decoration: const BoxDecoration(
                          border: const Border(
                            right: const BorderSide(
                                width: 1.0, color: Colors.grey),
                            top: const BorderSide(
                                width: 1.0, color: Colors.grey),
                          ),
                        ),
                        child: new Image.network(
                          imgs[0],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
