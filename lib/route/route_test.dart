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
        '/test3': (_) => RouteTestChild3(
              value: 'test3',
            ),
        '/test4': (_) => RouteTestChild4(),
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
              showDialog(
                  context: context,
                  builder: (context) {
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
                            Navigator.push(context,
                                CupertinoPageRoute(builder: (ctx) {
                              return RouteTestChild2(
                                value: "dialog跳转",
                              );
                            }));
                          },
                        )
                      ],
                    );
                  });
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
                              Navigator.popUntil(context, (route) => true);
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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/test3');
//              Navigator.popAndPushNamed(context, '/test3');
            },
            child: Text('切换到第一个子页面'),
          ),
        ),
        onWillPop: () async {
          Navigator.pop(context, _controller.value);
          return true;
        });
  }
}

class RouteTestChild3 extends StatelessWidget {
  RouteTestChild3({this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第三个子页面'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '这是第三个子页面',
              style: TextStyle(color: Colors.teal, fontSize: 24),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/test4');
              },
              child: Text('切换到其他页面'),
            )
          ],
        ),
      ),
    );
  }
}

class RouteTestChild4 extends StatefulWidget {
  @override
  _RouteTestState createState() => _RouteTestState();
}

class _RouteTestState extends State<RouteTestChild4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第四个子页面'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('这是第四个子页面'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/test1', (route) => false);
              },
              child: Text('pushNamedAndRemoveUntil'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: RaisedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => false);
              },
              child: Text('popUntil'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: RaisedButton(
              onPressed: () {
//                Navigator.pushReplacement(context, newRoute)
              },
              child: Text('子页面三'),
            ),
          ),
        ],
      ),
    );
  }
}
