import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RouteTest extends StatefulWidget {
  static const String routeName = '/RouteTest';
  @override
  State<StatefulWidget> createState() {
    return _RouteState();
  }
}

class _RouteState extends State<RouteTest> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/test1': (_) => RouteTestChild1(
              value: 'test1',
            ),
        '/test2': (_) => RouteTestChild2(
              value: 'test2',
            ),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('路由测试'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildItemBtn('基础路由', () {
              Navigator.push(context, CupertinoPageRoute(builder: (ctx) {
                return RouteTestChild1();
              }));
            }),
            _buildItemBtn('路由表1', () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                return SimpleDialog(
                  title: Text('选择跳转页面'),
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/test1');
                      },
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text('跳转到test1'),
                      ),
                    ),
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text('跳转到test2'),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/test2');
                      },
                    )
                  ],
                );
              }));
            }),
            _buildItemBtn('pushNamedAndRemoveUntil', () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/test1', (route) => true);
            }),
            _buildItemBtn('pushAndRemoveUntil', () {
              Navigator.pushAndRemoveUntil(context,
                  CupertinoPageRoute(builder: (ctx) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('第三个路由子界面'),
                  ),
                  body: Center(
                    child: Column(
                      children: <Widget>[
                        Text('这是第三个路由子界面'),
                        FlatButton(
                            onPressed: () {
                              Navigator.popUntil(
                                  context, (route) =>true);
                            },
                            child: Text('点击返回'))
                      ],
                    ),
                  ),
                );
              }), (route) => true);
            }),
            _buildItemBtn('pushReplacement', () {
              Navigator.pushReplacement(context,
                  CupertinoPageRoute(builder: (ctx) {
                return RouteTestChild2(
                  value: 'pushReplacement',
                );
              })).then((value) {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('${value.toString()}')));
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildItemBtn(String title, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: RaisedButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}

class RouteTestChild1 extends StatelessWidget {
  RouteTestChild1({this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第一个路由子界面'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              '这是第一个子页面',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            Text('传递的值${value ?? ""}'),
          ],
        ),
      ),
    );
  }
}

class RouteTestChild2 extends StatelessWidget {
  final String value;
  TextEditingController _controller = TextEditingController();

  RouteTestChild2({this.value});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text('第二个路由子界面'),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Text(
                  '这是第二个子界面',
                  style: TextStyle(color: Colors.blueAccent),
                ),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: value ?? "",
                  ),
                )
              ],
            ),
          ),
        ),
        onWillPop: () async {
          Navigator.pop(context, _controller.value);
          return true;
        });
  }
}
