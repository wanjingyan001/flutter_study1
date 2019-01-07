import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  GradientButton(
      {this.colors,
      this.width,
      this.height,
      this.elevation,
      this.radius,
      this.onTap,
      @required this.child});

  final Widget child;
  final List<Color> colors;
  final double width;
  final double height;
  final double elevation;
  final double radius;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Color> _color = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];

    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: _color),
          boxShadow: [
            BoxShadow(
                color: colors.first,
                offset: Offset(elevation, elevation),
                blurRadius: radius),
          ],
          borderRadius: BorderRadius.circular(radius)),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: colors.last,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: width, height: height),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: DefaultTextStyle(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    child: child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
