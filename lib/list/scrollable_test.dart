import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';

class ScrallableTest1 extends StatelessWidget {
  var str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: SingleChildScrollView(
      padding: EdgeInsets.all(16),
      scrollDirection: Axis.vertical,
      reverse: true,
      child: Center(
        child: Column(
          children: str
              .split("")
              .reversed
              .map((s) => Text(
                    s,
                    textScaleFactor: 2,
                  ))
              .toList(),
        ),
      ),
    ));
  }
}

class ListTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 100,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("$index"),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0
            ? Divider(color: Colors.red, indent: 15)
            : Divider(color: Colors.blueAccent, indent: 7);
      },
    );
  }
}

class InfiniteListView extends StatefulWidget {
  static const String routeName = "/InfiniteListView";
  @override
  InfiniteState createState() {
    return InfiniteState();
  }
}

class InfiniteState extends State<InfiniteListView> {
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
          _words.length - 1,
          generateWordPairs()
              .take(20)
              .map((word) => word.asPascalCase)
              .toList());
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          if (_words[index] == loadingTag) {
            if (_words.length - 1 < 100) {
              _retrieveData();
              return Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    )),
              );
            } else {
              return Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.center,
                  child: Text(
                    "没有更多了",
                    style: TextStyle(color: Colors.grey),
                  ));
            }
          }
          return ListTile(title: Text("${_words[index]}"));
        },
        separatorBuilder: (context, index) => Divider(height: 0),
        itemCount: _words.length);
  }
}

class GridTest extends StatelessWidget {
  var icondata = [
    Icons.threed_rotation,
    Icons.map,
    Icons.headset,
    Icons.print,
    Icons.work,
    Icons.near_me,
    Icons.wifi,
    Icons.forward,
    Icons.album,
    Icons.tag_faces
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 0.72,
      children: icondata.map((icon) => getGridItem(icon)).toList(),
      maxCrossAxisExtent: 100,
    );
  }

  Widget getGridItem(IconData data) {
    return Container(
      color: Colors.primaries[Random().nextInt(Colors.primaries.length - 1)],
      child: Icon(data),
    );
  }
}

class GridTest2 extends StatefulWidget {
  @override
  GridTest2State createState() {
    return GridTest2State();
  }
}

class GridTest2State extends State<GridTest2> {
  List<IconData> _datas = [];

  void getData() {
    Future.delayed(Duration(milliseconds: 200)).then((value) {
      setState(() {
        _datas.addAll([
          Icons.threed_rotation,
          Icons.map,
          Icons.headset,
          Icons.print,
          Icons.work,
          Icons.near_me,
          Icons.wifi,
          Icons.forward,
          Icons.album,
          Icons.tag_faces
        ]);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1),
        itemCount: _datas.length,
        itemBuilder: (context, index) {
          if (index == _datas.length - 1 && _datas.length < 200) {
            getData();
          }
          return getGridItem(_datas[index]);
        });
  }

  Widget getGridItem(IconData data) {
    return Container(
      color: Colors.primaries[Random().nextInt(Colors.primaries.length - 1)],
      child: Icon(data),
    );
  }
}

class CustomScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 240,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("TextDemo"),
            background: Image.asset(
              "assets/as_background.jpeg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(8),
          sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: Text("grid item $index"),
                );
              }, childCount: 20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 4)),
        ),
        SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text("list item $index"),
              );
            }, childCount: 50),
            itemExtent: 50)
      ]),
    );
  }
}
