import 'package:flutter/material.dart';

class CheckTest extends StatefulWidget {
  @override
  _CheckTestState createState() {
    return _CheckTestState();
  }
}

class _CheckTestState extends State<CheckTest> {
  bool _switchSelected = false;
  bool _checkboxSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckTest"),
      ),
      body: Column(
        children: <Widget>[
          Switch(
              value: _switchSelected,
              onChanged: (value) {
                setState(() {
                  _switchSelected = value;
                });
              }),
          Checkbox(
              value: _checkboxSelected,
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value;
                });
              })
        ],
      ),
    );
  }
}
