import 'package:flutter/material.dart';


class FlexLayoutTest extends StatelessWidget {
  static const String routeName = '/FlexLayoutTest';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  height: 30,
                  color: Colors.red,
                )),
            Expanded(
              flex: 1,
              child: Container(
                height: 35,
                color: Colors.blue,
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 120,
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 30,
                      color: Colors.red,
                    )),
                Spacer(),
                Expanded(
                  child: Container(
                    height: 30,
                    color: Colors.blue,
                  ),
                  flex: 1,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class WarpTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // 主轴(水平)方向间距
      runSpacing: 4.0, // 纵轴（垂直）方向间距
      alignment: WrapAlignment.start, //沿主轴方向居中
      children: <Widget>[
        new Chip(
          avatar:
              new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
          label: new Text('Hamilton'),
        ),
        new Chip(
          avatar:
              new CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
          label: new Text('Lafayette'),
        ),
        new Chip(
          avatar:
              new CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
          label: new Text('Mulligan'),
        ),
        new Chip(
          avatar:
              new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
          label: new Text('Laurens'),
        ),
      ],
    );
  }
}

class SubscriptWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 60,
        width: 60,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              child: Icon(Icons.message),
              top: 15,
            ),
            Positioned(
              child: Text(
                "消息",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              bottom: 5,
            ),
            Positioned(
              top: 5,
              right: 5,
              child: CircleAvatar(
                radius: 6,
                backgroundColor: Colors.red,
                child: Text(
                  "1",
                  style: TextStyle(fontSize: 8, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ConstrainedBoxTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var redBox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 50, minWidth: double.infinity),
      child: Container(
        height: 10,
        child: redBox,
      ),
    );
  }
}

class DecorationTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: RadialGradient(
              colors: [Colors.red, Colors.orange[700]],
              center: Alignment.bottomLeft,
              radius: 1.5),
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(3.0, 2.0),
              blurRadius: 4,
            )
          ]),
      position: DecorationPosition.background,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 80),
        child: Text(
          "LOGIN",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
