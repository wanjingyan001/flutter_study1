import 'package:flutter/material.dart';

class ThemeTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ThemeTestState();
  }
}

class ThemeTestState extends State<ThemeTestRoute> {
  Color _myTheme = Colors.teal;

  @override
  Widget build(BuildContext context) {
    ThemeData data = Theme.of(context);
    return Theme(
        data: ThemeData(
            primarySwatch: _myTheme, iconTheme: IconThemeData(color: _myTheme)),
        child: Scaffold(
          appBar: AppBar(
            title: Text("主题测试"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text("  颜色跟随主题")
                ],
              ),
              Theme(
                  data: data.copyWith(
                      iconTheme: data.iconTheme.copyWith(color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.favorite),
                      Icon(Icons.airport_shuttle),
                      Text("  颜色固定黑色")
                    ],
                  ))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                _myTheme = _myTheme == Colors.teal ? Colors.blue : Colors.teal;
              });
            },
            child: Icon(Icons.palette),
          ),
        ));
  }
}
