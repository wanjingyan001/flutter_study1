import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScreenShotRoute extends StatefulWidget {
  static const String routeName = '/ScreenShotRoute';

  @override
  _ScreenShotState createState() => _ScreenShotState();
}

class _ScreenShotState extends State<ScreenShotRoute> {
  final GlobalKey _key = GlobalKey();
  List<Uint8List> images = List();

  _screenShot() async {
    try {
      RenderRepaintBoundary boundary = _key.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      images.add(pngBytes);
      String bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _key,
      child: Scaffold(
        appBar: AppBar(
          title: Text('截图测试'),
        ),
        body: ListView.builder(itemBuilder: (context, index) {
          return Image.memory(
            images[index],
          );
        },
        itemCount: images.length,),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _screenShot();
          },
          child: Icon(Icons.screen_lock_portrait),
        ),
      ),
    );
  }
}
