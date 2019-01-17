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
import 'package:study1/my_demo_theme.dart';
import 'package:study1/notification_test.dart';
import 'package:study1/pointer_test.dart';
import 'package:study1/route/MyRoute.dart';
import 'package:fluttertoast/fluttertoast.dart';

//import 'package:study1/scroll_controller_test.dart';
import 'package:study1/scrollable_test.dart';
import 'package:study1/theme_test.dart';

class HomeApp extends StatelessWidget {
  var childList = routes;
  DateTime _lastPressAdt;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Demo"),
          actions: <Widget>[Icon(Icons.all_inclusive)],
        ),
        body: WillPopScope(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2),
                  itemCount: childList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(childList[index].title),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, childList[index].route)
                            .then((d) {
                          Fluttertoast.showToast(msg: d.toString());
                        });
                      },
                    );
                  }),
            ),
            onWillPop: () async {
              if (_lastPressAdt == null ||
                  DateTime.now().difference(_lastPressAdt) >
                      Duration(seconds: 1)) {
                _lastPressAdt = DateTime.now();
                Fluttertoast.showToast(msg: "1秒内连续按两次返回键退出");
                return false;
              } else {
                return true;
              }
            }),
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
