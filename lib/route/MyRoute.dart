import 'package:flutter/material.dart';
import 'package:study1/CheckTest.dart';
import 'package:study1/GestureRecognizer_test.dart';
import 'package:study1/Image_test.dart';
import 'package:study1/Inherited_test.dart';
import 'package:study1/Input_test.dart';
import 'package:study1/animation/anim_test1.dart';
import 'package:study1/flex_test.dart';
import 'package:study1/gestureDetector_test.dart';
import 'package:study1/scroll_controller_test.dart';
import 'package:study1/scrollable_test.dart';
import 'package:study1/second_route.dart';
import 'package:study1/theme_test.dart';

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
        title: "布局测试",
        routeName: FlexLayoutTest.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: DecorationTest(),
          );
        }),
    MyRoute(
        title: "数据共享测试",
        routeName: InheritedTest.routeName,
        buildRoute: (context) {
          return SecondRoute(body: InheritedTest());
        }),
    MyRoute(
        title: "图片测试",
        routeName: ImageTest.routeName,
        buildRoute: (BuildContext context) {
          return SecondRoute(
            body: ImageTest(),
          );
        }),
    MyRoute(
        title: "手势测试",
        routeName: Drag.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: Drag(),
          );
        }),
    MyRoute(
        title: "手势识别器测试",
        routeName: GestureRecognizerTest.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: GestureRecognizerTest(),
          );
        }),
    MyRoute(
        title: "滚动测试",
        routeName: InfiniteListView.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: InfiniteListView(),
          );
        }),
    MyRoute(
        title: "滚动控制测试",
        routeName: ScrollControllerTestRoute.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: ScrollControllerTestRoute(),
          );
        }),
    MyRoute(
        title: "主题测试",
        routeName: ThemeTestRoute.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: ThemeTestRoute(),
          );
        }),
    MyRoute(
        title: "动画测试",
        routeName: ScaleAnimationRoute.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: ScaleAnimationRoute(),
          );
        })
  ];
  return routes;
}


final List<MyRoute> routes = _buildRoute();
