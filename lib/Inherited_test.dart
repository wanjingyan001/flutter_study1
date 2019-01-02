import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  int data;

  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestWidgetState();
  }
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Dependencies change");
  }
}

class InheritedTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InheritedTestState();
  }
}

class InheritedTestState extends State<InheritedTest> {
  int data = 0;

  @override
  Widget build(BuildContext context) {
    return ShareDataWidget(
      data: data,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: _TestWidget(),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                data++;
              });
            },
            child: Text("Increment"),
          )
        ],
      ),
    );
  }
}
