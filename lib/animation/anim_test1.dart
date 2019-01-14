import 'dart:ui';

import 'package:flutter/animation.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class ShakeCurve extends Curve {
  @override
  double transform(double t) {
    return math.sin(t * math.pi * 2);
  }
}

class AnimTestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimTestState();
  }
}

class _AnimTestState extends State<AnimTestWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> alpha;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: 5,
        ));
    alpha = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    alpha = Tween(begin: 0.0, end: 300.0).animate(alpha)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/as_background.jpeg",
        width: alpha.value,
        height: alpha.value,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Image.asset(
        "assets/as_background.jpeg",
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}

class ScaleAnimationRoute extends StatefulWidget {
  static const String routeName = "/ScaleAnimationRoute";

  @override
  State<StatefulWidget> createState() {
    return _ScaleAnimationState();
  }
}

class _ScaleAnimationState extends State<ScaleAnimationRoute>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  AnimationController _controller2;
  Animation<double> _animation2;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _controller2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    animation = CurvedAnimation(
        parent: controller, curve: Interval(0.0, 0.78, curve: Curves.easeOut));
    _animation2 = Tween(begin: 0.0, end: 175.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.79, 1.0, curve: Curves.easeOut)));
    animation = Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addStatusListener((status) {
        switch (status) {
          case AnimationStatus.completed:
            //动画结束
            _controller2.forward();
//            controller.reverse();
            break;
          case AnimationStatus.dismissed:
            //动画恢复初始
            controller.forward();
            break;
          case AnimationStatus.forward:
            //动画正向开始
            break;
          case AnimationStatus.reverse:
            //动画逆向开始
            break;
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
      ),
      body: GrowTransition(
        child: Image.asset("assets/as_background.jpeg"),
        animation: animation,
        animation2: _animation2,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    _controller2.dispose();
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation, this.animation2});

  final Widget child;
  final Animation<double> animation;
  final Animation<double> animation2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Stack(
            children: <Widget>[
              Center(
                child: Container(
                  width: animation.value,
                  height: animation.value,
                  child: child,
                ),
              ),
              Center(
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Opacity(
                      opacity: 0.5,
                      child: Container(
                        width: animation2.value,
                        height: animation2.value,
                        decoration: BoxDecoration(color: Colors.grey.shade200),
                        child: Center(
                          child: Text(
                            'Frosted',
                            style: Theme.of(context).textTheme.display2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
        child: child,
      ),
    );
  }
}
