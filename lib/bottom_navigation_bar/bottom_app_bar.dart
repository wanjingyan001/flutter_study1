import 'package:flutter/material.dart';
import 'package:study1/bottom_navigation_bar/page_view.dart';

class BottomAppBarTest extends StatefulWidget {
  static const String routeName = '/BottomAppBarTest';

  @override
  _BottomAppBarState createState() => _BottomAppBarState();
}

class _BottomAppBarState extends State<BottomAppBarTest> {
  List<MyPageView> pages = List();
  int _index = 0;

  @override
  void initState() {
    super.initState();
    pages
      ..add(MyPageView(
        title: 'First',
      ))
      ..add(MyPageView(title: 'Second'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomAppbarTest'),
      ),
      body: pages[_index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MyPageView(title: 'New Page');
          }));
        },
        child: Icon(Icons.add),
        tooltip: 'Increment',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.near_me),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _index = 0;
                  });
                }),
            IconButton(
                icon: Icon(Icons.edit_location),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _index = 1;
                  });
                })
          ],
        ),
      ),
    );
  }
}
