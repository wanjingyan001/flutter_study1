import 'package:flutter/material.dart';
import 'package:study1/util/util.dart';

class BuildContextDemo extends StatelessWidget {
  static const String routeName = '/BuildContextDemo';

  @override
  Widget build(BuildContext context) {
    printContextInfo('根节点', context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Context'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          printContextInfo('item节点', context);
          return ListTile(
            title: Text('item $index'),
          );
        },
        itemCount: 10,
        itemExtent: 35,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              printContextInfo('dialog节点', context);
              return AlertDialog(
                title: Text('Dialog测试'),
                content: Center(
                  child: Text('内容'),
                ),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('取消')),
                  FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('确定'))
                ],
              );
            });
      }),
    );
  }
}
