import 'package:flutter/material.dart';

class JiuGongGeRoute extends StatefulWidget {
  static const String routeName = '/JiuGongGeRoute';

  @override
  _JiuGongGeState createState() => _JiuGongGeState();
}

class _JiuGongGeState extends State<JiuGongGeRoute> {
  List<Widget> _list;
  List<String> _urls;

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: () {
        if (_list.length < 9) {
          setState(() {
            _list.insert(_list.length - 1, _buildPhoto());
          });
        } else if (_list.length == 9) {
          _list.removeAt(_list.length - 1);
          _list.insert(_list.length - 1, _buildPhoto());
        }
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          width: 100,
          height: 100,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildPhoto() {
    return GestureDetector(
      onTap: () {
        if (_list.length > 1) {
          print('');
        }
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          width: 100,
          height: 100,
          color: Colors.amber,
          child: Center(
            child: Image.asset('assets/as_background.jpeg'),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _urls = List()..add('');
    _list = List()..add(_buildAddButton());
  }

  Widget _buildItem(int index) {
    if (index == _urls.length - 1 && _urls.length < 9) {
      return Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          width: 100,
          height: 100,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          width: 100,
          height: 100,
          color: Colors.amber,
          child: Center(
            child: Image.asset(_urls[index]),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 24, crossAxisSpacing: 24),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (index == _urls.length - 1) {
                  if (_urls.length < 9) {
                    _urls..insert(index,'assets/as_background.jpeg');
                  }
                } else {
                  _urls.removeAt(index);
                }
              });
            },
            child: _buildItem(index),
          );
        },
        itemCount: _urls.length,
      ),
    );
//    return Scaffold(
//      body: Center(
//        child: Opacity(
//          opacity: 0.8,
//          child: Container(
//            width: width,
//            height: height / 2,
//            color: Colors.grey,
//            child: Wrap(
//              children: _list,
//              spacing: 24,
//              crossAxisAlignment: WrapCrossAlignment.center,
//            ),
//          ),
//        ),
//      ),
//    );
  }
}
