import 'dart:math';

import 'package:flutter/material.dart';
import 'package:study1/custom_widget/gradient_button.dart';
import 'package:study1/custom_widget/gradient_circular_progress_test.dart';
import 'package:study1/custom_widget/turn_box.dart';

class GradientTest extends StatelessWidget {
  static const String routeName = "/GradientTest";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义渐变按钮"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: GradientButton(
                child: Text("submit1"),
                height: 50,
                colors: [Colors.orange, Colors.red],
                elevation: 8,
                radius: 12,
                onTap: onTap,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: GradientButton(
                child: Text("submit2"),
                height: 50,
                colors: [Colors.lightGreen, Colors.green[700]],
                onTap: onTap,
                elevation: 2,
                radius: 4,
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: GradientButton(
                child: Text("submit3"),
                height: 50,
                colors: [Colors.lightBlue[300], Colors.blueAccent],
                elevation: 16,
                radius: 24,
                onTap: onTap,
              ),
            )
          ],
        ),
      ),
    );
  }

  void onTap() {
    print("button click");
  }
}

class TurnBoxTest extends StatefulWidget {
  static const String routeName = "/TurnBoxTest";

  @override
  State<StatefulWidget> createState() {
    return _TurnBoxTestState();
  }
}

class _TurnBoxTestState extends State<TurnBoxTest> {
  double _turns = .0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义旋转控件"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TurnBox(
              turns: _turns,
              speed: 500,
              child: Icon(
                Icons.refresh,
                size: 50,
              ),
            ),
            TurnBox(
              turns: _turns,
              speed: 1000,
              child: Icon(
                Icons.refresh,
                size: 150,
              ),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _turns += 0.2;
                });
              },
              child: Text("顺时针旋转1/5圈"),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _turns -= 0.2;
                });
              },
              child: Text("逆时针旋转1/5圈"),
            ),
          ],
        ),
      ),
    );
  }
}

class GradientCircularProgressRoute extends StatefulWidget {
  static const String routeName = "/GradientCircularProgressRoute";
  @override
  State<StatefulWidget> createState() {
    return _GradientCircularProgressStatee();
  }
}

class _GradientCircularProgressStatee
    extends State<GradientCircularProgressRoute> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    bool isForWard = true;
    _controller.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.completed:
        //动画结束
        case AnimationStatus.dismissed:
          //动画恢复初始
          if (isForWard) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
          break;
        case AnimationStatus.forward:
          //动画正向开始
          isForWard = true;
          break;
        case AnimationStatus.reverse:
          //动画逆向开始
          isForWard = false;
          break;
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义绘制控件"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget child) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      children: <Widget>[
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: <Widget>[
                            GradientCircularProgressIndicator(
                              radius: 50,
                              stokeWidth: 3,
                              value: _controller.value,
                              colors: <Color>[Colors.blue, Colors.blue],
                            ),
                            GradientCircularProgressIndicator(
                              radius: 50.0,
                              stokeWidth: 3.0,
                              colors: <Color>[Colors.red, Colors.orange],
                              value: _controller.value,
                            ),
                            GradientCircularProgressIndicator(
                              radius: 50.0,
                              stokeWidth: 3.0,
                              colors: <Color>[
                                Colors.red,
                                Colors.orange,
                                Colors.red
                              ],
                              value: _controller.value,
                            ),
                            GradientCircularProgressIndicator(
                              radius: 50.0,
                              stokeWidth: 3.0,
                              colors: <Color>[Colors.teal, Colors.cyan],
                              value: CurvedAnimation(
                                      parent: _controller,
                                      curve: Curves.decelerate)
                                  .value,
                            ),
                            TurnBox(
                              turns: 1 / 8,
                              child: GradientCircularProgressIndicator(
                                stokeCapBound: true,
                                stokeWidth: 5,
                                radius: 50,
                                colors: <Color>[
                                  Colors.red,
                                  Colors.orange,
                                  Colors.red
                                ],
                                totalAngle: 1.5 * pi,
                                backgroundColor: Colors.red[50],
                                value: CurvedAnimation(
                                        parent: _controller, curve: Curves.ease)
                                    .value,
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: 1,
                              child: GradientCircularProgressIndicator(
                                stokeCapBound: true,
                                backgroundColor: Colors.transparent,
                                radius: 50.0,
                                stokeWidth: 3.0,
                                colors: <Color>[
                                  Colors.blue[700],
                                  Colors.blue[200]
                                ],
                                value: _controller.value,
                              ),
                            ),
                            GradientCircularProgressIndicator(
                              radius: 50,
                              stokeWidth: 5,
                              stokeCapBound: true,
                              value: _controller.value,
                              colors: <Color>[
                                Colors.red,
                                Colors.amber,
                                Colors.cyan,
                                Colors.green[200],
                                Colors.blue,
                                Colors.red
                              ],
                            ),
                            GradientCircularProgressIndicator(
                              colors: [Colors.blue[700], Colors.blue[200]],
                              radius: 100,
                              stokeWidth: 20,
                              value: _controller.value,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 18),
                              child: GradientCircularProgressIndicator(
                                radius: 100,
                                stokeWidth: 20,
                                colors: [Colors.blue[700], Colors.blue[300]],
                                value: _controller.value,
                                stokeCapBound: true,
                              ),
                            ),
                            ClipRect(
                              child: Align(
                                alignment: Alignment.topCenter,
                                heightFactor: 5,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: SizedBox(
                                    child: TurnBox(
                                      turns: .75,
                                      child: GradientCircularProgressIndicator(
                                        colors: [Colors.teal, Colors.cyan[500]],
                                        radius: 100,
                                        stokeWidth: 8,
                                        value: _controller.value,
                                        totalAngle: pi,
                                        stokeCapBound: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 104,
                              width: 200,
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Positioned(
                                    child: TurnBox(
                                      turns: .75,
                                      child: GradientCircularProgressIndicator(
                                        colors: [Colors.teal, Colors.cyan[500]],
                                        radius: 100,
                                        stokeCapBound: true,
                                        stokeWidth: 8,
                                        totalAngle: pi,
                                        value: _controller.value,
                                      ),
                                    ),
                                    height: 200,
                                    top: 0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "${_controller.value * 100}%",
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.blueGrey),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
