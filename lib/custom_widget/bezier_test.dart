import 'dart:ui';

import 'package:flutter/material.dart';

class BezierTestRoute extends StatelessWidget {
  static const String routeName = '/BezierTestRoute';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('贝塞尔Demo'),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            SizedBox.fromSize(
              child: Image.asset('assets/as_background.jpeg'),
              size: Size(350, 275),
            ),
            ClipPath(
              clipper: BezierWidget(),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      width: 350,
                      height: 275,
                      decoration: BoxDecoration(color: Colors.grey.shade200),
                      child: Text(''),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BezierWidget extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height / 2 + 20);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height / 2 + 30);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondControlPoint = Offset(size.width / 4 * 3, size.height / 2 + 80);
    var secondEndPoint = Offset(size.width, size.height / 2 + 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height / 2 + 40);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
