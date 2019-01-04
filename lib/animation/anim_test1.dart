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
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    animation = Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addStatusListener((status) {
        switch (status) {
          case AnimationStatus.completed:
            //动画结束
            controller.reverse();
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
    return GrowTransition(
      child: Image.asset("assets/as_background.jpeg"),
      animation: animation,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Container(
            width: animation.value,
            height: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
