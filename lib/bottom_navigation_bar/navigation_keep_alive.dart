import 'package:flutter/material.dart';
import 'package:study1/bottom_navigation_bar/airplay_screen.dart';
import 'package:study1/bottom_navigation_bar/email_screen.dart';
import 'package:study1/bottom_navigation_bar/home_screen.dart';
import 'package:study1/bottom_navigation_bar/mine_screen.dart';

class NavigationKeepAlive extends StatefulWidget {
  static const String routeName = '/NavigationKeepAlive';

  @override
  _NavigationKeepAliveState createState() {
    return _NavigationKeepAliveState();
  }
}

class _NavigationKeepAliveState extends State<NavigationKeepAlive>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  var _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color _barColor = Theme.of(context).primaryColor;
    TextStyle _style = TextStyle(color: _barColor, fontSize: 16);
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          AirPlayScreenPage(),
          EmailScreenPage(),
          HomeScreenPage(),
          MineScreenPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.airplay,
                color: _barColor,
              ),
              title: Text(
                "AirPlay",
                style: _style,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
                color: _barColor,
              ),
              title: Text(
                "Email",
                style: _style,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _barColor,
              ),
              title: Text(
                "Home",
                style: _style,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: _barColor,
              ),
              title: Text(
                "Mine",
                style: _style,
              ))
        ],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
