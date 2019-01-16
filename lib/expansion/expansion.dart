import 'package:flutter/material.dart';

class ExpansionTitle2Route extends StatefulWidget {
  @override
  _ExpansionTitle2State createState() => _ExpansionTitle2State();
}

class _ExpansionTitle2State extends State<ExpansionTitle2Route>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;
  Color iconColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation = Tween(begin: 0.0, end: 0.125)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _changeOpacity(bool expand) {
    setState(() {
      if (expand) {
        _controller.forward();
        iconColor = Colors.redAccent;
      } else {
        _controller.reverse();
        iconColor = Colors.grey;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansion List'),
      ),
      body: SingleChildScrollView(
        child: ExpansionTile(
          title: Text('Expansion Title'),
          backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
          trailing: RotationTransition(
            turns: _animation,
            child: Icon(
              Icons.add,
              color: iconColor,
            ),
          ),
          onExpansionChanged: (expand) {
            _changeOpacity(expand);
          },
          children: <Widget>[
            ListTile(
              title: Text('first item'),
              subtitle: Text('first subtitle'),
              leading: Icon(Icons.title),
            ),
            ListTile(
              title: Text('second item'),
              subtitle: Text('second subtitle'),
              leading: Icon(Icons.title),
            )
          ],
        ),
      ),
    );
  }
}
