import 'package:flutter/widgets.dart';

class TurnBox extends StatefulWidget {
  TurnBox({Key key, this.turns = .0, this.speed = 200, this.child})
      : super(key: key);

  final double turns; //旋转“圈”，一圈360度，0.25圈为90度
  final int speed; //过度动画执行总时长
  final Widget child;

  @override
  State<StatefulWidget> createState() {
    return _TurnBoxState();
  }
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, lowerBound: -double.infinity, upperBound: double.infinity);
    _controller.value = widget.turns;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.turns != widget.turns) {
      _controller.animateTo(widget.turns,
          duration: Duration(milliseconds: widget.speed ?? 200),
          curve: Curves.easeOut);
    }
  }
}
