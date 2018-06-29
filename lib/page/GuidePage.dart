import 'package:flutter/material.dart';

class GuidePage extends StatefulWidget {
  @override
  GuidePageState createState() => new GuidePageState();
}

class GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return new Image.network(
      'https://wx1.sinaimg.cn/thumb180/69e273f8ly1fspuvlkd78j21sg1sg7wh.jpg',
      fit: BoxFit.fill,
    );
  }
}
