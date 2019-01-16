import 'package:flutter/material.dart';
import 'package:study1/expansion/expansion.dart';
import 'package:study1/expansion/expansion_list.dart';

class ExpansionDemo extends StatefulWidget {
  static const String routeName = '/ExpansionDemo';

  @override
  _ExpansionState createState() => _ExpansionState();
}

class _ExpansionState extends State<ExpansionDemo> {
  final List<Widget> pages = [ExpansionTitle2Route(), ExpansionListRoute()];
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.android), title: Text('title')),
            BottomNavigationBarItem(icon: Icon(Icons.lens), title: Text('list'))
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (int) {
            setState(() {
              currentIndex = int;
            });
          },
        ),
      ),
    );
  }
}
