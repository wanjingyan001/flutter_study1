import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScrollControllerTestRoute extends StatefulWidget {
  static const String routeName = "/ScrollControllerTestRoute";
  @override
  State<StatefulWidget> createState() {
    return ControllerTestState();
  }
}

class ControllerTestState extends State<ScrollControllerTestRoute> {
  ScrollController _controller = ScrollController();
  bool showTopBtn = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 1000 && showTopBtn) {
        setState(() {
          showTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showTopBtn == false) {
        setState(() {
          showTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滾動控制"),
      ),
      body: Scrollbar(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("$index"),
          );
        },
        itemCount: 100,
        itemExtent: 50,
        controller: _controller,
      )),
      floatingActionButton: showTopBtn
          ? FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              })
          : null,
    );
  }
}

class ScrollNotificationTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScrollNotificationState();
  }
}

class _ScrollNotificationState extends State<ScrollNotificationTest> {
  String _progress = "0%";
  DateTime _lastPressAdt;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scrollbar(
            child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            print("BottomEdge : ${notification.metrics.extentAfter == 0}");
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("$index"),
                  );
                },
                itemCount: 100,
                itemExtent: 50,
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.black54,
                child: Text("$_progress"),
              )
            ],
          ),
        )),
        onWillPop: () async {
          if (_lastPressAdt == null ||
              DateTime.now().difference(_lastPressAdt) > Duration(seconds: 1)) {
            _lastPressAdt = DateTime.now();
            Fluttertoast.showToast(msg: "1秒内连续按两次返回键退出");
            return false;
          } else {
            return true;
          }
        });
  }
}
