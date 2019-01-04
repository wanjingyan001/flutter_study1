import 'package:flutter/material.dart';

class GestureDetectorTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GestureDetectorState();
  }
}

class _GestureDetectorState extends State<GestureDetectorTest> {
  String _operation = "No Gesture detected";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          width: 400,
          height: 200,
          color: Colors.blue,
          child: Text(
            _operation,
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () => updateText("onTap"),
        onDoubleTap: () => updateText("onDoubleTap"),
        onLongPress: () => updateText("onLongPress"),
      ),
    );
  }

  void updateText(String str) {
    setState(() {
      _operation = str;
    });
  }
}

class Drag extends StatefulWidget {
  static const String routeName = "Drag";
  @override
  State<StatefulWidget> createState() {
    return _DragState();
  }
}

class _DragState extends State<Drag> {
  double _topOffset = 0;

  double _leftOffset = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _topOffset,
          left: _leftOffset,
          child: Listener(
            onPointerDown: (details) {
              print("onPointerDown");
            },
            onPointerUp: (details) {
              print("onPointerUp");
            },
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("A"),
              ),
//            onPanDown: (DragDownDetails d) =>
//                print("用户手指按下：${d.globalPosition}"),
//            onPanUpdate: (DragUpdateDetails d) {
//              setState(() {
//                _leftOffset += d.delta.dx;
//                _topOffset += d.delta.dy;
//              });
//            },
//            onPanEnd: (DragEndDetails d) => print("滑动结束：${d.velocity}"),
              onVerticalDragUpdate: (DragUpdateDetails d) {
                setState(() {
                  _topOffset += d.delta.dy;
                });
              },
              onHorizontalDragUpdate: (DragUpdateDetails d) {
                setState(() {
                  _leftOffset += d.delta.dx;
                });
              },
              onHorizontalDragEnd: (details) {
                print("onHorizontalDragEnd");
              },
              onTapDown: (details) {
                print("onTapDown");
              },
              onTapUp: (details) => print("onTapUp"),
            ),
          ),
        )
      ],
    );
  }
}

class ScaleTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaleTestState();
  }
}

class _ScaleTestState extends State<ScaleTest> {
  double _width = 300;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Image.asset(
          "assets/as_background.jpeg",
          width: _width,
        ),
        onScaleUpdate: (ScaleUpdateDetails d) {
          setState(() {
            _width = 300 * d.scale.clamp(0.5, 5);
          });
        },
      ),
    );
  }
}
