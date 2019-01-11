import 'package:flutter/material.dart';

class DialogDemo extends StatefulWidget {
  static const String routeName = "/DialogDemo";

  @override
  _DialogDemo createState() {
    return _DialogDemo();
  }
}

class _DialogDemo extends State<DialogDemo> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  void showDemoDialog({BuildContext context, Widget child}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => child).then((value) {
      _globalKey.currentState
          .showSnackBar(SnackBar(content: Text("你点击了$value")));
    });
  }

  AlertDialog _buildAlertDialog(TextStyle dialogTextStyle) {
    return AlertDialog(
      title: Text(
        "AlertDialog标题",
      ),
      content: Text(
        "AlertDialog内容",
        style: dialogTextStyle,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.pop(context, "AlertDialog的取消按钮");
            },
            child: Text("取消")),
        FlatButton(
            onPressed: () {
              Navigator.pop(context, "AlertDialog的确定按钮");
            },
            child: Text("确定"))
      ],
    );
  }

  SimpleDialog _buildSimpleDialog(BuildContext context, ThemeData theme) {
    return SimpleDialog(
      title: Text("SimpleDialog"),
      children: <Widget>[
        SimpleDialogItem(
          icon: Icons.account_circle,
          color: theme.primaryColor,
          text: "第一个账户",
          onPressed: () => Navigator.pop(context, "第一个账户"),
        ),
        SimpleDialogItem(
          icon: Icons.account_box,
          color: theme.secondaryHeaderColor,
          text: "第二个账户",
          onPressed: () => Navigator.pop(context, "第二个账户"),
        ),
        SimpleDialogItem(
          icon: Icons.add_circle,
          color: theme.accentColor,
          text: "添加",
          onPressed: () => Navigator.pop(context, "添加"),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle dialogTextStyle =
        theme.textTheme.subhead.copyWith(color: theme.textTheme.caption.color);
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text("Dialog Demo"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.help), onPressed: () => print("menu click"))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 72),
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              showDemoDialog(
                context: context,
                child: _buildAlertDialog(dialogTextStyle),
              );
            },
            child: Text("AlertDialog"),
          ),
          RaisedButton(
            onPressed: () {
              showDemoDialog(
                context: context,
                child: _buildSimpleDialog(context, theme),
              );
            },
            child: Text("SimpleDialog"),
          ),
          RaisedButton(
            onPressed: () {
              _globalKey.currentState.showBottomSheet<void>((context) {
                return Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[350],
                            offset: Offset(3, 3),
                            blurRadius: 4)
                      ]),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          ListView.builder(
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Icon(Icons.adjust),
                                title: Text("第${index + 1}项"),
                              );
                            },
                            itemCount: 15,
                            itemExtent: 50,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                FlatButton(
                                  onPressed: null,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                    child: Text(
                                      "确定",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                ),
                                FlatButton(
                                  onPressed: null,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                    child: Text("取消",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Theme.of(context)
                                                .primaryColor)),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
            },
            child: Text("BottomSheet"),
          )
        ],
      ),
    );
  }
}

class SimpleDialogItem extends StatelessWidget {
  SimpleDialogItem({Key k, this.icon, this.text, this.color, this.onPressed})
      : super(key: k);

  final IconData icon;
  final String text;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 36,
            color: color,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(text),
          )
        ],
      ),
    );
  }
}
