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
      @required this.buildRoute,
      @required this.route})
      : assert(title != null),
        assert(routeName != null),
        assert(buildRoute != null);

  final String title;
  final String routeName;
  final WidgetBuilder buildRoute;
  final Route route;
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
        },
        route: routeBuild(CheckTest())),
    MyRoute(
        title: "输入测试",
        routeName: InputTest.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: InputTest(),
          );
        },
        route: routeBuild(InputTest())),
    MyRoute(
        title: "布局测试",
        routeName: FlexLayoutTest.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: DecorationTest(),
          );
        },
        route: routeBuild(DecorationTest())),
    MyRoute(
        title: "数据共享测试",
        routeName: InheritedTest.routeName,
        buildRoute: (context) {
          return SecondRoute(body: InheritedTest());
        },
        route: routeBuild(InheritedTest())),
    MyRoute(
        title: "图片测试",
        routeName: ImageTest.routeName,
        buildRoute: (BuildContext context) {
          return SecondRoute(
            body: ImageTest(),
          );
        },
        route: routeBuild(ImageTest())),
    MyRoute(
        title: "手势测试",
        routeName: Drag.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: Drag(),
          );
        },
        route: routeBuild(SecondRoute(
          body: Drag(),
        ))),
    MyRoute(
        title: "手势识别器测试",
        routeName: GestureRecognizerTest.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: GestureRecognizerTest(),
          );
        },
        route: routeBuild(GestureRecognizerTest())),
    MyRoute(
        title: "滚动测试",
        routeName: InfiniteListView.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: InfiniteListView(),
          );
        },
        route: routeBuild(InfiniteListView())),
    MyRoute(
        title: "滚动控制测试",
        routeName: ScrollControllerTestRoute.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: ScrollControllerTestRoute(),
          );
        },
        route: routeBuild(ScrollControllerTestRoute())),
    MyRoute(
        title: "主题测试",
        routeName: ThemeTestRoute.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: ThemeTestRoute(),
          );
        },
        route: routeBuild(ThemeTestRoute())),
    MyRoute(
        title: "动画测试",
        routeName: ScaleAnimationRoute.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: ScaleAnimationRoute(),
          );
        },
        route: routeBuild(ScaleAnimationRoute()))
  ];
  return routes;
}

Route routeBuild(Widget page) {
  return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: page,
        );
      });
}

final List<MyRoute> routes = _buildRoute();
