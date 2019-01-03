import 'package:flutter/material.dart';
import 'package:study1/CheckTest.dart';
import 'package:study1/Input_test.dart';
import 'package:study1/flex_test.dart';
import 'package:study1/second_route.dart';

class MyRoute {
  const MyRoute(
      {@required this.title,
      @required this.routeName,
      @required this.buildRoute})
      : assert(title != null),
        assert(routeName != null),
        assert(buildRoute != null);

  final String title;
  final String routeName;
  final WidgetBuilder buildRoute;
}

List<MyRoute> _buildRoute() {
  final List<MyRoute> routes = [
    MyRoute(
        title: "点击测试",
        routeName: CheckTest.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: CheckTest(),
          );
        }),
    MyRoute(
        title: "输入测试",
        routeName: InputTest.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: InputTest(),
          );
        }),
    MyRoute(
        title: "布局测试1",
        routeName: FlexLayoutTest.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: DecorationTest(),
          );
        }),
    MyRoute(title: "布局测试2", routeName: null, buildRoute: null)
  ];
}
