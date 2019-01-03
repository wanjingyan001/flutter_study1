import 'package:flutter/material.dart';

class ScrollNotificationTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("$index"),
          );
        },
        itemCount: 100,
      ),
      onNotification: (notification) {
        switch (notification) {
          case ScrollStartNotification:
            print("开始滚动");
            break;
          case ScrollUpdateNotification:
            print("正在滚动");
            break;
          case ScrollEndNotification:
            print("滚动结束");
            break;
          case OverscrollNotification:
            print("到达边界");
            break;
        }
      },
    );
  }
}

class MyTestNotification extends Notification {
  MyTestNotification(this.msg);

  String msg;
  int count = 0;
}

class MyTestNotificationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationRouteState();
  }
}

class _NotificationRouteState extends State<MyTestNotificationRoute> {
  String _msg = "";
  var notic = MyTestNotification("count:");

  @override
  Widget build(BuildContext context) {
    return NotificationListener<MyTestNotification>(
      onNotification: (notification) {
        setState(() {
          _msg += "${notification.msg}${notification.count}";
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Builder(builder: (context) {
            return RaisedButton(
              onPressed: () {
                notic.count++;
                notic.dispatch(context);
              },
              child: Text("check it"),
            );
          }),
          Text(_msg)
        ],
      ),
    );
  }
}
