import 'package:flutter/material.dart';
import 'package:study1/CheckTest.dart';
import 'package:study1/GestureRecognizer_test.dart';
import 'package:study1/Image_test.dart';
import 'package:study1/Inherited_test.dart';
import 'package:study1/Input_test.dart';
import 'package:study1/animation/anim_test1.dart';
import 'package:study1/channel_test/method_channel_test.dart';
import 'package:study1/custom_widget/custom_test.dart';
import 'package:study1/custom_paint_test.dart';
import 'package:study1/dialog/dialog_test.dart';
import 'package:study1/file/file_write_read_test.dart';
import 'package:study1/flex_test.dart';
import 'package:study1/gestureDetector_test.dart';
import 'package:study1/http_test/httpClient_test.dart';
import 'package:study1/http_test/web_socket_test.dart';
import 'package:study1/route/fade_route.dart';
import 'package:study1/route/hero_test.dart';
import 'package:study1/route/stagger_test.dart';
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
        route: routeBuild(ScaleAnimationRoute())),
    MyRoute(
        title: "Hero测试",
        routeName: HeroAnimationRouteA.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: HeroAnimationRouteA(),
          );
        },
        route: routeBuild(HeroAnimationRouteA())),
    MyRoute(
        title: "交错动画测试",
        routeName: StaggerDemo.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: StaggerDemo(),
          );
        },
        route: routeBuild(SecondRoute(
          body: StaggerDemo(),
        ))),
    MyRoute(
        title: "自定义渐变按钮",
        routeName: GradientTest.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: GradientTest(),
          );
        },
        route: routeBuild(GradientTest())),
    MyRoute(
        title: "自定义旋转控件",
        routeName: TurnBoxTest.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: TurnBoxTest(),
          );
        },
        route: routeBuild(TurnBoxTest())),
    MyRoute(
        title: "customPainter",
        routeName: CustomPainterTest.routeName,
        buildRoute: (context) {
          return SecondRoute(body: CustomPainterTest());
        },
        route: routeBuild(SecondRoute(
          body: CustomPainterTest(),
        ))),
    MyRoute(
        title: "自定义绘制",
        routeName: GradientCircularProgressRoute.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: GradientCircularProgressRoute(),
          );
        },
        route: routeBuild(GradientCircularProgressRoute())),
    MyRoute(
        title: "文件操作",
        routeName: FileOperationRoute.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: FileOperationRoute(),
          );
        },
        route: routeBuild(FileOperationRoute())),
    MyRoute(
        title: "聚合天气测试",
        routeName: HttpClientTest1.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: HttpClientTest1(),
          );
        },
        route: routeBuild(HttpClientTest1())),
    MyRoute(
        title: "webSocket",
        routeName: WebSocketRoute.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: WebSocketRoute(),
          );
        },
        route: routeBuild(WebSocketRoute())),
    MyRoute(
        title: "原生Flutter沟通",
        routeName: MethodChannelTest.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: MethodChannelTest(),
          );
        },
        route: routeBuild(MethodChannelTest())),
    MyRoute(
        title: "Dialog测试",
        routeName: DialogDemo.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: DialogDemo(),
          );
        },
        route: routeBuild(DialogDemo())),
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
//  return FadeRoute(builder: (BuildContext context) {
//    return page;
//  });
}

final List<MyRoute> routes = _buildRoute();
