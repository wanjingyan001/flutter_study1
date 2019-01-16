import 'package:flutter/material.dart';

class ExpansionListRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExpansionListState();
  }
}

class ExpandStateBean {
  bool isOpen;
  int index;

  ExpandStateBean(this.isOpen, this.index);
}

class _ExpansionListState extends State<ExpansionListRoute> {
  var _currentPanelIndex = -1;
  List<int> mList;
  List<ExpandStateBean> _stateList;

  @override
  void initState() {
    super.initState();
    mList = List();
    _stateList = List();
    for (int i = 0; i < 10; i++) {
      mList.add(i);
      _stateList.add(ExpandStateBean(false, i));
    }
  }

  _setCurrentIndex(int index, isExpand) {
    setState(() {
      _stateList.forEach((item) {
        if (item.index == index) {
          item.isOpen = !isExpand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelList'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          children: mList.map((i) {
            return ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text('第$i个标题'),
                    leading: Icon(Icons.info),
                  );
                },
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    height: 100,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.security,
                      size: 35,
                    ),
                  ),
                ),
                isExpanded: _stateList[i].isOpen);
          }).toList(),
          expansionCallback: (index, bol) {
            _setCurrentIndex(index, bol);
          },
        ),
      ),
    );
  }
}
