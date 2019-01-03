import 'package:flutter/material.dart';

class InputTest extends StatefulWidget {
  static const String routeName = '/InputTest';
  @override
  _InputTestState createState() {
    return _InputTestState();
  }
}

class _InputTestState extends State<InputTest> {
  var controller1 = TextEditingController();
  var controller2 = TextEditingController();
  FocusNode _node1 = FocusNode();
  FocusNode _node2 = FocusNode();
  FocusScopeNode focusScopeNode;
  var _flag = false;
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller1.addListener(() {
      print(controller1.text);
      setState(() {
        _flag = controller1.text.isNotEmpty && controller2.text.isNotEmpty;
      });
    });
    controller2.addListener(() {
      print(controller2.text);
      setState(() {
        _flag = controller1.text.isNotEmpty && controller2.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("inputTest"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: controller1,
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    return value.trim().length > 0 ? null : "用户名不能为空";
                  },
                  focusNode: _node1,
                  onEditingComplete: () {
                    if (focusScopeNode == null) {
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(_node2);
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: "用戶名",
                      hintText: "请输入用户名"),
                ),
                TextFormField(
                  controller: controller2,
                  textInputAction: TextInputAction.go,
                  focusNode: _node2,
                  validator: (v) {
                    return v.trim().length > 6 ? null : "密碼長度不得低於6位";
                  },
                  onEditingComplete: () {
                    _node1.unfocus();
                    _node2.unfocus();
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: "密碼",
                      hintText: "請輸入密碼"),
                  obscureText: true,
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          onPressed: _flag
                              ? () {
                                  if ((_formKey.currentState as FormState)
                                      .validate()) {
                                    print("登陆");
                                  }
                                }
                              : null,
                          child: Text("登錄"),
                          disabledColor: Colors.grey,
                          color: Colors.blue,
                          textColor: Colors.white,
                          disabledElevation: 0,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
