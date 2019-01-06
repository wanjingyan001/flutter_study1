import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  StaggerAnimation({Key k, this.controller}) : super(key: k) {
    height = Tween(begin: 0.0, end: 300.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease)));
    color = ColorTween(begin: Colors.green, end: Colors.red).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease)));
    padding =
        Tween(begin: EdgeInsets.only(left: 0), end: EdgeInsets.only(left: 100))
            .animate(CurvedAnimation(
                parent: controller,
                curve: Interval(0.6, 1.0, curve: Curves.ease)));
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 50,
        height: height.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: _buildAnimation);
  }
}

/**
 *
 *
 * ***************************************************************************************
 *
 *
 */
class StaggerDemo extends StatefulWidget {
  static const String routeName = "/StaggerDemo";
  @override
  State<StatefulWidget> createState() {
    return _StaggerState();
  }
}

class _StaggerState extends State<StaggerDemo> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
  }

  Future<Null> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.forward().orCancel;
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _playAnimation(),
      child: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border:
                  Border.all(color: Colors.black.withOpacity(0.5), width: 2)),
          child: StaggerAnimation(
            controller: _controller,
          ),
        ),
      ),
    );
  }
}
