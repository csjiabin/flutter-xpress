import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  @override
  ShoppingCartState createState() => new ShoppingCartState();
}

class ShoppingCartState extends State<ShoppingCart> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void showDemoDialog<T>({ BuildContext context, Widget child }) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    )
    .then<void>((T value) { // The value passed to Navigator.pop() or null.
      if (value != null) {
        _scaffoldKey.currentState.showSnackBar(new SnackBar(
          content: new Text('You selected: $value')
        ));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle = theme.textTheme.subhead.copyWith(color: theme.textTheme.caption.color);
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        centerTitle:true,
        leading: new Text(' '),
        title: new Center(
          child: new Text('购物车', style: TextStyle(color: Colors.black)),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('编辑', style: TextStyle(color: Colors.green)),
            onPressed: () {
              // Navigator.pushNamed(context, '/address/create');
              showDemoDialog<String>(
                context: context,
                child: new SimpleDialog(
                  title: const Text('Set backup account'),
                  children: <Widget>[
                    new DialogDemoItem(
                      icon: Icons.account_circle,
                      color: theme.primaryColor,
                      text: 'username@gmail.com',
                      onPressed: () { Navigator.pop(context, 'username@gmail.com'); }
                    )
                  ]
                )
              );
            },
          )
        ],
      ),
      body: new Center(
        child: new Text('购物车'),
      ),
    );
  }
}
class DialogDemoItem extends StatelessWidget {
  const DialogDemoItem({ Key key, this.icon, this.color, this.text, this.onPressed }) : super(key: key);

  final IconData icon;
  final Color color;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
        title: new Text(text),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Text('You will never be satisfied.'),
              new Text('You\’re like me. I’m never satisfied.'),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Regret'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
  }
}