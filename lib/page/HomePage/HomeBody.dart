import 'package:flutter/material.dart';
import '../../components/utils.dart';

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

class HomeBody extends StatefulWidget {
  const HomeBody({Key key}) : super(key: key);
  @override
  HomeBodyState createState() => new HomeBodyState();
}

class HomeBodyState extends State<HomeBody> {
  Choice _selectedChoice = choices[0]; //
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new ListBody(
      children: <Widget>[
        new ChoiceCard(choice: choices[0]),
        new ChoiceCard(choice: choices[1])
      ],
    ));
  }
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10.0),
      child: new Column(
        children: <Widget>[
          new Container(
            decoration: const BoxDecoration(
              border: const Border(
                bottom: const BorderSide(width: 1.0, color: Colors.grey),
              ),
            ),
            child: new Row(
              children: <Widget>[
                new Icon(choice.icon, color: Colors.grey),
                new Text(choice.title, style: TextStyle(
                  color: Colors.grey
                )),
              ],
            ),
          ),
          new Container(
            child: new Text('data'),
          )
        ],
      ),
    );
  }
}
