import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RecordableListRoute extends StatefulWidget {
  static const String routeName = '/RecordableListRoute';

  @override
  _RecordableListState createState() => _RecordableListState();
}

class _RecordableListState extends State<RecordableListRoute> {
  List<String> name = List();

  @override
  void initState() {
    super.initState();
    name.addAll(
        generateWordPairs().take(20).map((word) => word.asPascalCase).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView(
          header: PreferredSize(
              child: AppBar(
                title: Text('ReorderableListDemo'),
              ),
              preferredSize: Size.fromHeight(24)),
          children: name.map((word) => _buildItem(word)).toList(),
          onReorder: _onRecorder),
    );
  }

 Widget _buildItem(String word) {
    return SizedBox(
      key: ObjectKey(word),
      height: 75,
      child: Card(
        color: Colors.lightBlueAccent.withOpacity(0.4),
        elevation: 6,
        child: Center(
          child: Text(
            word,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }

  _onRecorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) newIndex = newIndex - 1;
    var wordIndex = name.removeAt(oldIndex);
    name.insert(newIndex, wordIndex);
    setState(() {});
  }
}
