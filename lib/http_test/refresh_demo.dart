import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:study1/util/util.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";

class RefreshDemo extends StatefulWidget {
  static const routeName = '/RefreshDemo';

  @override
  _RefreshDemoState createState() => _RefreshDemoState();
}

class _RefreshDemoState extends State<RefreshDemo> {
  List<String> _images = List();
  ScrollController _controller = ScrollController();
  bool isLoadMore = false;

  @override
  void initState() {
    super.initState();
    _refreshList();
    _controller.addListener(() {
      print(
          '滚动距离:${_controller.position.pixels}====>最大距离:${_controller.position.maxScrollExtent}');
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        setState(() {
          _refreshList();
        });
      }
    });
  }

  Future<Null> _getImage() async {
    Dio dio = DioSingleton().httpDio(
        opt: buildOptions(
            baseUrl: 'http://dog.ceo/api/', responseType: ResponseType.PLAIN));
    Response response = await dio.get('breeds/image/random');
    if (response.statusCode == 200) {
      setState(() {
        print('${json.decode(response.data)['message']}');
        _images.add(json.decode(response.data)['message']);
      });
    } else {
      throw HttpException('request error');
    }
  }

  Future<Null> _refreshList() async {
    for (int i = 0; i < 10; i++) {
      await _getImage();
    }
  }

  Widget _footWidget() {
    if (isLoadMore) {
      if (_images.length - 1 < 50) {
        _refreshList();
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
    } else {
      return Container(
        width: 0,
        height: 0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RefreshDemo'),
      ),
      body: SmartRefresher(
        child: StaggeredGridView.countBuilder(
          controller: _controller,
          crossAxisCount: 4,
          itemBuilder: (context, index) {
            return Container(
              child: Image.network(
                _images[index],
                fit: BoxFit.cover,
              ),
            );
          },
          staggeredTileBuilder: (index) {
            return StaggeredTile.count(2, index.isEven ? 3 : 2);
          },
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemCount: _images.length,
        ),
        onRefresh: (_) {
          _images.clear();
          _refreshList();
        },
        onOffsetChange: (bol,offset){
          _refreshList();
        },
      ),
    );
  }
}
