import 'package:flutter/material.dart';
import 'package:study1/CheckTest.dart';
import 'package:study1/GestureRecognizer_test.dart';
import 'package:study1/Image_test.dart';
import 'package:study1/Inherited_test.dart';
import 'package:study1/Input_test.dart';
import 'package:study1/Jiugongge.dart';
import 'package:study1/animation/anim_test1.dart';
import 'package:study1/bottom_navigation_bar/bottom_app_bar.dart';
import 'package:study1/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:study1/bottom_navigation_bar/navigation_keep_alive.dart';
import 'package:study1/channel_test/method_channel_test.dart';
import 'package:study1/custom_widget/bezier_test.dart';
import 'package:study1/custom_widget/custom_test.dart';
import 'package:study1/custom_paint_test.dart';
import 'package:study1/dialog/dialog_test.dart';
import 'package:study1/expansion/expansion_mian.dart';
import 'package:study1/file/file_write_read_test.dart';
import 'package:study1/flex_test.dart';
import 'package:study1/gestureDetector_test.dart';
import 'package:study1/http_test/httpClient_test.dart';
import 'package:study1/http_test/web_socket_test.dart';
import 'package:study1/list/swip_detach_list.dart';
import 'package:study1/recordable_demo.dart';
import 'package:study1/route/custom_route.dart';
import 'package:study1/route/fade_route.dart';
import 'package:study1/route/hero_test.dart';
import 'package:study1/route/route_test.dart';
import 'package:study1/route/stagger_test.dart';
import 'package:study1/list/scroll_controller_test.dart';
import 'package:study1/list/scrollable_test.dart';
import 'package:study1/screen_shot_demo.dart';
import 'package:study1/search_bar.dart';
import 'package:study1/second_route.dart';
import 'package:study1/list/slive_test.dart';
import 'package:study1/tablayout_test.dart';
import 'package:study1/theme_test.dart';
import 'dart:math';

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
        title: "TabBarLayout",
        routeName: TabAppBarRoute.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: TabAppBarRoute(),
          );
        },
        route: routeBuild(TabAppBarRoute())),
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
    MyRoute(
        title: "BottomNavigationBar测试",
        routeName: NavigationKeepAlive.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: NavigationKeepAlive(),
          );
        },
        route: routeBuild(NavigationKeepAlive())),
    MyRoute(
        title: 'BottomAppBar测试',
        routeName: BottomAppBarTest.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: BottomAppBarTest(),
          );
        },
        route: routeBuild(BottomAppBarTest())),
    MyRoute(
        title: 'SearchBar测试',
        routeName: SearchBarRoute.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: SearchBarRoute(),
          );
        },
        route: routeBuild(SearchBarRoute())),
    MyRoute(
        title: '九宫格测试',
        routeName: JiuGongGeRoute.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: JiuGongGeRoute(),
          );
        },
        route: routeBuild(JiuGongGeRoute())),
    MyRoute(
        title: 'Expansion测试',
        routeName: ExpansionDemo.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: ExpansionDemo(),
          );
        },
        route: routeBuild(ExpansionDemo())),
    MyRoute(
        title: 'Sliver测试',
        routeName: SliverTestRoute.routeName,
        buildRoute: (context) {
          return SecondRoute(body: SliverTestRoute());
        },
        route: routeBuild(SliverTestRoute())),
    MyRoute(
        title: '贝塞尔测试',
        routeName: BezierTestRoute.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: BezierTestRoute(),
          );
        },
        route: routeBuild(BezierTestRoute())),
    MyRoute(
        title: '拖拽排序列表',
        routeName: RecordableListRoute.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: RecordableListRoute(),
          );
        },
        route: routeBuild(RecordableListRoute())),
    MyRoute(
        title: '侧滑删除测试',
        routeName: SwipeDetachListRoute.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: SwipeDetachListRoute(),
          );
        },
        route: routeBuild(SwipeDetachListRoute())),
    MyRoute(
        title: '截图测试',
        routeName: ScreenShotRoute.routeName,
        buildRoute: (context) {
          return SecondRoute(
            body: ScreenShotRoute(),
          );
        },
        route: routeBuild(ScreenShotRoute())),
    MyRoute(
        title: '路由测试',
        routeName: RouteTest.routeName,
        buildRoute: (ctx) {
          return SecondRoute(
            body: RouteTest(),
          );
        },
        route: routeBuild(RouteTest())),
  ];
  return routes;
}

Route routeBuild(Widget page) {
  var routes = _myRoutes(page);
  return routes[Random().nextInt(routes.length)];
//  return PageRouteBuilder(
//      transitionDuration: Duration(milliseconds: 500),
//      pageBuilder: (BuildContext context, Animation animation,
//          Animation secondaryAnimation) {
//        return FadeTransition(
//          opacity: animation,
//          child: page,
//        );
//      });
//  return FadeRoute(builder: (BuildContext context) {
//    return page;
//  });
}

List _myRoutes(Widget widget) {
  CustomRoute route = CustomRoute(widget);
  CustomRoute1 route1 = CustomRoute1(widget);
  CustomRoute2 route2 = CustomRoute2(widget);
  CustomRoute3 route3 = CustomRoute3(widget);
  return [route, route1, route2, route3];
}

final List<MyRoute> routes = _buildRoute();
