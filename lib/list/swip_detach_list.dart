import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';

class SwipeDetachListRoute extends StatefulWidget {
  static const String routeName = '/SwipeDetachListRoute';

  @override
  _SwipeDetachState createState() => _SwipeDetachState();
}

class _SwipeDetachState extends State<SwipeDetachListRoute> {
  List<String> _words = List();

  @override
  void initState() {
    super.initState();
    _words.addAll(
        generateWordPairs().take(20).map((word) => word.asPascalCase).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SwipeDetach Demo'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(_words[index]),
            direction: DismissDirection.endToStart,
            child: ListTile(
              title: Text(_words[index]),
            ),
            background: Container(
              color: Colors.accents[Random().nextInt(Colors.accents.length)],
            ),
            onDismissed: (DismissDirection direction) {
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('${_words[index]} has romved')));
              setState(() {
                _words.removeAt(index);
              });
            },
          );
        },
        itemCount: _words.length,
      ),
    );
  }
}
