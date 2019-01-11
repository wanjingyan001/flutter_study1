import 'package:flutter/material.dart';

class TabAppBarRoute extends StatelessWidget {
  static const String routeName = '/TabAppBarRoute';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("TabBarLayout"),
            bottom: TabBar(
                isScrollable: true,
                tabs: choices.map((choice) {
                  return Tab(
                    text: choice.title,
                    icon: Icon(choice.icon),
                  );
                }).toList()),
          ),
          body: TabBarView(
              children: choices.map((choice) {
            return Padding(
              padding: EdgeInsets.all(16),
              child: ChoiceCard(
                choice: choice,
              ),
            );
          }).toList()),
        ),
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  ChoiceCard({this.choice, Key k}) : super(key: k);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = Theme.of(context).textTheme.display1;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            choice.icon,
            size: 128,
            color: style.color,
          ),
          Text(
            choice.title,
            style: style,
          )
        ],
      ),
    );
  }
}

class Choice {
  Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

List<Choice> choices = [
  Choice(title: 'Car', icon: Icons.directions_car),
  Choice(title: 'bicycle', icon: Icons.directions_bike),
  Choice(title: 'boat', icon: Icons.directions_boat),
  Choice(title: 'bus', icon: Icons.directions_bus),
  Choice(title: 'train', icon: Icons.directions_railway),
  Choice(title: 'walk', icon: Icons.directions_walk),
  Choice(title: 'Air',icon: Icons.airplanemode_active),
  Choice(title: 'Run',icon: Icons.directions_run)
];
