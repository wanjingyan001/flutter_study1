import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  static const String routeName = '/shrine';
  SecondRoute({this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("第二个页面"),
        ),
        body: body,
      ),
    );
  }
}
