import 'dart:math';

import 'package:flutter/material.dart';

class GradientCircularProgressIndicator extends StatelessWidget {
  GradientCircularProgressIndicator(
      {this.stokeWidth = 2,
      @required this.radius,
      @required this.colors,
      this.stops,
      this.stokeCapBound = false,
      this.backgroundColor = const Color(0xFFEEEEEE),
      this.totalAngle = 2 * pi,
      this.value});

  //宽度
  final double stokeWidth;

  //半径
  final double radius;

  //两端是否为圆角
  final bool stokeCapBound;

  //当前进度，取值范围[0.0-1.0]
  final double value;

  //进度条总弧度，2*pi为整圆，小于2*pi则不是整圆
  final double totalAngle;

  //背景颜色
  final Color backgroundColor;

  //渐变颜色数组
  final List<Color> colors;

  //渐变色的终止点，对应colors属性
  final List<double> stops;

  @override
  Widget build(BuildContext context) {
    double _offset = .0;
    if (stokeCapBound) {
      _offset = asin(stokeWidth / (radius * 2 - stokeWidth));
    }
    var _colors = colors;
    if (_colors == null) {
      Color color = Theme.of(context).accentColor;
      _colors = [color, color];
    }
    return Transform.rotate(
      angle: -pi / 2.0 - _offset,
      child: CustomPaint(
        size: Size.fromRadius(radius),
        painter: _GradientCircularProgressPainter(
            colors: _colors,
            stokeWidth: stokeWidth,
            stokeCapRound: stokeCapBound,
            backgroundColor: backgroundColor,
            value: value,
            total: totalAngle,
            radius: radius),
      ),
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  _GradientCircularProgressPainter(
      {this.stokeWidth = 10,
      this.stokeCapRound = false,
      this.backgroundColor = const Color(0xFFEEEEEE),
      this.radius,
      this.total = 2 * pi,
      this.stops,
      this.value,
      @required this.colors});

  final double stokeWidth;
  final bool stokeCapRound;
  final double value;
  final Color backgroundColor;
  final List<Color> colors;
  final double total;
  final double radius;
  final List<double> stops;

  @override
  void paint(Canvas canvas, Size size) {
    if (radius != null) {
      size = Size.fromRadius(radius);
    }
    double _offset = stokeWidth / 2;
    double _value = value ?? .0;
    _value = _value.clamp(.0, 1.0) * total;
    double _start = .0;
    if (stokeCapRound) {
      _start = asin(stokeWidth / (size.width - stokeWidth));
    }

    Rect rect = Offset(_offset, _offset) &
        Size(size.width - stokeWidth, size.height - stokeWidth);
    var paint = Paint()
      ..strokeCap = stokeCapRound ? StrokeCap.round : StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = stokeWidth;

    if (backgroundColor != Colors.transparent) {
      paint.color = backgroundColor;
      canvas.drawArc(rect, _start, total, false, paint);
    }
    if (value > 0) {
      paint.shader = SweepGradient(
              colors: colors, startAngle: 0, endAngle: _value, stops: stops)
          .createShader(rect);
      canvas.drawArc(rect, _start, _value, false, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
