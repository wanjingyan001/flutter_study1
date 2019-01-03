import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:study1/CheckTest.dart';
import 'package:study1/GestureRecognizer_test.dart';
import 'package:study1/Image_test.dart';
import 'package:study1/Inherited_test.dart';
import 'package:study1/Input_test.dart';
import 'package:study1/animation/anim_test1.dart';
import 'package:study1/flex_test.dart';
import 'package:study1/gestureDetector_test.dart';
import 'package:study1/notification_test.dart';
import 'package:study1/pointer_test.dart';
//import 'package:study1/scroll_controller_test.dart';
import 'package:study1/scrollable_test.dart';
import 'package:study1/theme_test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: ThemeTestRoute(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("WarpLayoutTest"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: ScaleAnimationRoute(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _bgColors = [
    Colors.grey,
    Colors.orange,
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.teal
  ];
  var _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("_MyHomePageState  initState");
  }

  @override
  Widget build(BuildContext context) {
    print("_MyHomePageState  build");
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: _bgColors[_currentIndex],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          if (_currentIndex < _bgColors.length - 1)
            _currentIndex++;
          else
            _currentIndex = 0;
        });
      }),
    );
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("_MyHomePageState  didUpdateWidget");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("_MyHomePageState  didChangeDependencies");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("_MyHomePageState  deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("_MyHomePageState  dispose");
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("_MyHomePageState  reassemble");
  }
}
