import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter/services.dart' show rootBundle;

class WebSocketRoute extends StatefulWidget {
  static const String routeName = "/WebSocketRoute";

  @override
  State<StatefulWidget> createState() {
    return _WebSocketState();
  }
}

class _WebSocketState extends State<WebSocketRoute> {
  WebSocketChannel channel;
  TextEditingController _controller = TextEditingController();
  String _text = "";

  @override
  void initState() {
    super.initState();
    channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebSocket(内容回显)"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
                child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Send a message"),
            )),
            StreamBuilder(
              stream: channel.stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  _text = "网络错误";
                } else if (snapshot.hasData) {
                  _text = "echo:" + snapshot.data;
                }
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(_text),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        child: Icon(Icons.send),
        tooltip: "Send message",
      ),
    );
  }

  Future<Null> _sendMessage() async {
    if (_controller.text.isNotEmpty) {
      channel.sink.add(_controller.text);
//      var bytes = await rootBundle.load("assets/as_background.jpeg");
//      String txt = await rootBundle.loadString("assets/res/my_file.txt");
      channel.sink.add(_controller.text);
    } else {
      Fluttertoast.showToast(msg: "请输入发送内容");
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
