import 'package:flutter/material.dart';

const horizontalPicture =
    "https://img.nga.178.com/attachments/mon_201810/04/-9lddQ5-bo53ZyT3cSzk-7n.jpg";
const verticalPicture =
    "http://imgs.aixifan.com/cms/2018_10_29/1540809919451.jpg?imageView2/1/w/225/h/300";

class ImageTest extends StatefulWidget {
  @override
  _ImageTestState createState() {
    return _ImageTestState();
  }
}

class _ImageTestState extends State<ImageTest> {
  var _listData = BoxFit.values;
  var _direction = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ImageTest"),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) => getListItem(index),
          itemCount: _listData.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(_direction
              ? Icons.vertical_align_bottom
              : Icons.vertical_align_top),
          onPressed: () {
            setState(() {
              _direction = !_direction;
            });
          }),
    );
  }

  Widget getListItem(int index) {
    return Row(
      children: <Widget>[
        Image.network(
          _direction ? horizontalPicture : verticalPicture,
          height: 100,
          width: 300,
          fit: _listData[index],
        ),
        Text("${_listData[index]}")
      ],
    );
  }
}
