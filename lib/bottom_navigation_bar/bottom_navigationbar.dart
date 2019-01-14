import 'package:flutter/material.dart';
import 'package:study1/bottom_navigation_bar/airplay_screen.dart';
import 'package:study1/bottom_navigation_bar/email_screen.dart';
import 'package:study1/bottom_navigation_bar/home_screen.dart';
import 'package:study1/bottom_navigation_bar/mine_screen.dart';

class BottomNavigationBarText extends StatefulWidget {
  static const String routeName = '/BottomNavigationBarText';

  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBarText> {
  List<Widget> widgets =List();
  int _currentIndex = 0;

  @override
  void initState() {
    widgets
    ..add(AirPlayScreenPage())
    ..add(EmailScreenPage())
    ..add(HomeScreenPage())
    ..add(MineScreenPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color _barColor = Theme.of(context).primaryColor;
    TextStyle _style = TextStyle(color: _barColor, fontSize: 16);
    return Scaffold(
      body: widgets[_currentIndex],
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
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
//      floatingActionButton: FloatingActionButton(onPressed: (){
//
//      }),
    );
  }
}
