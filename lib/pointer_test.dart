import 'package:flutter/material.dart';

class PointTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PointTestState();
  }
}

class PointTestState extends State<PointTest> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Container(
        width: 400,
        height: 175,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text(
          _event?.toString() ?? "",
          style: TextStyle(color: Colors.white),
        ),
      ),
      onPointerDown: (event) => setState(() => _event = event),
      onPointerMove: (event) => setState(() => _event = event),
      onPointerUp: (event) => setState(() => _event = event),
      onPointerCancel: (event) => setState(() => _event = event),
    );
  }
}

class PointerTest2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Listener(
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(Size(300, 200)),
            child: DecoratedBox(decoration: BoxDecoration(color: Colors.blue)),
          ),
          onPointerDown: (event) {
            print("down 0");
          },
        ),
        Listener(
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(Size(200, 100)),
            child: Center(
              child: Text(
                "左上角200*100范围内非文本区域点击",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          onPointerDown: (event) {
            print("down 1");
          },
          behavior: HitTestBehavior.translucent,
        )
      ],
    );
  }
}

class PointerTest3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        print("parent down");
      },
      child: IgnorePointer(
        child: Listener(
          onPointerDown: (event) {
            print("child down");
          },
          child: Container(
            color: Colors.blue,
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
