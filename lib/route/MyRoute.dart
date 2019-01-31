import 'package:flutter/cupertino.dart';
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
import 'package:study1/buildcontext_demo.dart';
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
import 'package:study1/http_test/refresh_demo.dart';
import 'package:study1/http_test/web_socket_test.dart';
import 'package:study1/list/swip_detach_list.dart';
import 'package:study1/recordable_demo.dart';
import 'package:study1/route/custom_route.dart';
import 'package:study1/route/fade_route.dart';
import 'package:study1/route/hero_test.dart';
import 'package:study1/route/route_demo.dart';
import 'package:study1/route/route_test.dart';
import 'package:study1/route/stagger_test.dart';
import 'package:study1/list/scroll_controller_test.dart';
import 'package:study1/list/scrollable_test.dart';
import 'package:study1/rx_dart_demo/rx_list_page.dart';
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
  final Route route; //有问题
}

List<MyRoute> _buildRoute() {
  final List<MyRoute> routes = [
    MyRoute(
        title: "点击测试",
        routeName: CheckTest.routeName,
        buildRoute: (context) {
          return CheckTest();
        },
        route: routeBuild(CheckTest())),
    MyRoute(
        title: "输入测试",
        routeName: InputTest.routeName,
        buildRoute: (context) {
          return InputTest();
        },
        route: routeBuild(InputTest())),
    MyRoute(
        title: "布局测试",
        routeName: FlexLayoutTest.routeName,
        buildRoute: (context) {
          return DecorationTest();
        },
        route: routeBuild(DecorationTest())),
    MyRoute(
        title: "TabBarLayout",
        routeName: TabAppBarRoute.routeName,
        buildRoute: (context) => TabAppBarRoute(),
        route: routeBuild(TabAppBarRoute())),
    MyRoute(
        title: "数据共享测试",
        routeName: InheritedTest.routeName,
        buildRoute: (context) => InheritedTest(),
        route: routeBuild(InheritedTest())),
    MyRoute(
        title: "图片测试",
        routeName: ImageTest.routeName,
        buildRoute: (BuildContext context) => ImageTest(),
        route: routeBuild(ImageTest())),
    MyRoute(
        title: "手势测试",
        routeName: Drag.routeName,
        buildRoute: (context) => Drag(),
        route: routeBuild(SecondRoute(
          body: Drag(),
        ))),
    MyRoute(
        title: "手势识别器测试",
        routeName: GestureRecognizerTest.routeName,
        buildRoute: (context) => GestureRecognizerTest(),
        route: routeBuild(GestureRecognizerTest())),
    MyRoute(
        title: "滚动测试",
        routeName: InfiniteListView.routeName,
        buildRoute: (context) => InfiniteListView(),
        route: routeBuild(InfiniteListView())),
    MyRoute(
        title: "滚动控制测试",
        routeName: ScrollControllerTestRoute.routeName,
        buildRoute: (context) => ScrollControllerTestRoute(),
        route: routeBuild(ScrollControllerTestRoute())),
    MyRoute(
        title: "主题测试",
        routeName: ThemeTestRoute.routeName,
        buildRoute: (context) => ThemeTestRoute(),
        route: routeBuild(ThemeTestRoute())),
    MyRoute(
        title: "动画测试",
        routeName: ScaleAnimationRoute.routeName,
        buildRoute: (context) => ScaleAnimationRoute(),
        route: routeBuild(ScaleAnimationRoute())),
    MyRoute(
        title: "Hero测试",
        routeName: HeroAnimationRouteA.routeName,
        buildRoute: (context) => HeroAnimationRouteA(),
        route: routeBuild(HeroAnimationRouteA())),
    MyRoute(
        title: "交错动画测试",
        routeName: StaggerDemo.routeName,
        buildRoute: (context) => StaggerDemo(),
        route: routeBuild(SecondRoute(
          body: StaggerDemo(),
        ))),
    MyRoute(
        title: "自定义渐变按钮",
        routeName: GradientTest.routeName,
        buildRoute: (context) => GradientTest(),
        route: routeBuild(GradientTest())),
    MyRoute(
        title: "自定义旋转控件",
        routeName: TurnBoxTest.routeName,
        buildRoute: (context) => TurnBoxTest(),
        route: routeBuild(TurnBoxTest())),
    MyRoute(
        title: "customPainter",
        routeName: CustomPainterTest.routeName,
        buildRoute: (context) => CustomPainterTest(),
        route: routeBuild(SecondRoute(
          body: CustomPainterTest(),
        ))),
    MyRoute(
        title: "自定义绘制",
        routeName: GradientCircularProgressRoute.routeName,
        buildRoute: (context) => GradientCircularProgressRoute(),
        route: routeBuild(GradientCircularProgressRoute())),
    MyRoute(
        title: "文件操作",
        routeName: FileOperationRoute.routeName,
        buildRoute: (context) => FileOperationRoute(),
        route: routeBuild(FileOperationRoute())),
    MyRoute(
        title: "聚合天气测试",
        routeName: HttpClientTest1.routeName,
        buildRoute: (context) => HttpClientTest1(),
        route: routeBuild(HttpClientTest1())),
    MyRoute(
        title: "webSocket",
        routeName: WebSocketRoute.routeName,
        buildRoute: (context) => WebSocketRoute(),
        route: routeBuild(WebSocketRoute())),
    MyRoute(
        title: "原生Flutter沟通",
        routeName: MethodChannelTest.routeName,
        buildRoute: (context) => MethodChannelTest(),
        route: routeBuild(MethodChannelTest())),
    MyRoute(
        title: "Dialog测试",
        routeName: DialogDemo.routeName,
        buildRoute: (context) => DialogDemo(),
        route: routeBuild(DialogDemo())),
    MyRoute(
        title: "BottomNavigationBar测试",
        routeName: NavigationKeepAlive.routeName,
        buildRoute: (context) => NavigationKeepAlive(),
        route: routeBuild(NavigationKeepAlive())),
    MyRoute(
        title: 'BottomAppBar测试',
        routeName: BottomAppBarTest.routeName,
        buildRoute: (context) => BottomAppBarTest(),
        route: routeBuild(BottomAppBarTest())),
    MyRoute(
        title: 'SearchBar测试',
        routeName: SearchBarRoute.routeName,
        buildRoute: (context) => SearchBarRoute(),
        route: routeBuild(SearchBarRoute())),
    MyRoute(
        title: '九宫格测试',
        routeName: JiuGongGeRoute.routeName,
        buildRoute: (context) => JiuGongGeRoute(),
        route: routeBuild(JiuGongGeRoute())),
    MyRoute(
        title: 'Expansion测试',
        routeName: ExpansionDemo.routeName,
        buildRoute: (context) => ExpansionDemo(),
        route: routeBuild(ExpansionDemo())),
    MyRoute(
        title: 'Sliver测试',
        routeName: SliverTestRoute.routeName,
        buildRoute: (context) => SliverTestRoute(),
        route: routeBuild(SliverTestRoute())),
    MyRoute(
        title: '贝塞尔测试',
        routeName: BezierTestRoute.routeName,
        buildRoute: (context) => BezierTestRoute(),
        route: routeBuild(BezierTestRoute())),
    MyRoute(
        title: '拖拽排序列表',
        routeName: RecordableListRoute.routeName,
        buildRoute: (context) => RecordableListRoute(),
        route: routeBuild(RecordableListRoute())),
    MyRoute(
        title: '刷新测试',
        routeName: RefreshDemo.routeName,
        buildRoute: (context) => RefreshDemo(),
        route: routeBuild(RefreshDemo())),
    MyRoute(
        title: '侧滑删除测试',
        routeName: SwipeDetachListRoute.routeName,
        buildRoute: (context) => SwipeDetachListRoute(),
        route: routeBuild(SwipeDetachListRoute())),
    MyRoute(
        title: '截图测试',
        routeName: ScreenShotRoute.routeName,
        buildRoute: (context) => ScreenShotRoute(),
        route: routeBuild(ScreenShotRoute())),
    MyRoute(
        title: '路由测试',
//        routeName: RouteTest.routeName,
        routeName: RouteDemo.routeName,
        buildRoute: (ctx) => RouteDemo(),
//        route: routeBuild(RouteTest())),
        route: routeBuild(RouteDemo())),
    MyRoute(
        title: 'context测试',
        routeName: BuildContextDemo.routeName,
        buildRoute: (ctx) => BuildContextDemo(),
        route: routeBuild(BuildContextDemo())),
    MyRoute(
        title: 'RxDart测试',
        routeName: RxDartListPage.routeName,
        buildRoute: (ctx) => RxDartListPage(),
        route: routeBuild(RxDartListPage())),
  ];
  return routes;
}

Route routeBuild(Widget page) {
  var routes = _myRoutes(page);
//  return routes[Random().nextInt(routes.length)];
//  return CupertinoPageRoute(builder: (BuildContext context) {
//    return page;
//  });
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

List _myRoutes(Widget widget) {
  CustomRoute route = CustomRoute(widget);
  CustomRoute1 route1 = CustomRoute1(widget);
  CustomRoute2 route2 = CustomRoute2(widget);
  CustomRoute3 route3 = CustomRoute3(widget);
  return [route, route1, route2, route3];
}

final List<MyRoute> routes = _buildRoute();
