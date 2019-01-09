import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelTest extends StatefulWidget {
  static const String routeName = '/MethodChannelTest';
  @override
  State<StatefulWidget> createState() {
    return _MethodChannelState();
  }
}

class _MethodChannelState extends State<MethodChannelTest> {
  static const platform = const MethodChannel('samples.flutter.io/battery');
  String _batteryLevel = 'Unknown battery level';

  Future<Null> _getBatteryLevel() async {
    String level;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      level = "Battery level at $result %";
    } on PlatformException catch (e) {
      level = "Failed to get battery level: ${e.message}";
    }
    setState(() {
      _batteryLevel = level;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter调用原生API"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: _getBatteryLevel,
                child: Text("get Battery level"),
              ),
              Text(_batteryLevel)
            ],
          ),
        ),
      ),
    );
  }
}
