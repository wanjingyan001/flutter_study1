import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study1/util.dart';

class FileOperationRoute extends StatefulWidget {
  static const String routeName = "/FileOperationRoute";
  static const String counterKey = "Counter";

  @override
  State<StatefulWidget> createState() {
    return _FileOperationState();
  }
}

class _FileOperationState extends State<FileOperationRoute> {
  int _counter;

  @override
  void initState() {
    super.initState();
//    _readCounter().then((content) {
//      setState(() {
//        _counter = content;
//      });
//    });
    _getCountFromSp().then((content) {
      setState(() {
        _counter = content;
      });
    });
  }

  Future<File> _getLocalFile() async {
    String pathStr = (await getApplicationDocumentsDirectory()).path;
    return File("$pathStr/counter.txt");
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> _increment() async {
    setState(() {
      _counter++;
    });
    await (await _getLocalFile()).writeAsString("$_counter");
  }

  Future<int> _getCountFromSp() async {
    SharedPreferences sp = await getSP();
    int counter = sp.getInt(FileOperationRoute.counterKey) ?? 0;
    return counter;
  }

  Future<Null> _setCountToSp() async {
    SharedPreferences sp = await getSP();
    setState(() {
      _counter++;
    });
    await sp.setInt(FileOperationRoute.counterKey, _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文件读写操作"),
      ),
      body: Center(
        child: Text("点击次数$_counter"),
      ),
      floatingActionButton: FloatingActionButton(
//        onPressed: _increment,
        onPressed: _setCountToSp,
        tooltip: "Increment",
        child: Icon(Icons.add),
      ),
    );
  }
}
