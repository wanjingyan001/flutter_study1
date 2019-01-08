import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:study1/http_test/request_constant.dart';

class HttpClientTest1 extends StatefulWidget {
  static const String routeName = '/HttpClientTest1';

  @override
  State<StatefulWidget> createState() {
    return _HttpClient1State();
  }
}

class _HttpClient1State extends State<HttpClientTest1> {
  String searchKey = "";
  String weatherJson = "";
  bool isLoading = false;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      searchKey = _controller.text;
    });
  }

  Future<String> _queryWeather(String cityKey) async {
    HttpClient client = HttpClient();
    String result;
    try {
//      Uri uri = Uri(
//          scheme: "http",
//          host: "v.juhe.cn/weather/index",
//          queryParameters: {"cityname": cityKey, "key": WEATHER_API_KEY});
      HttpClientRequest request = await client.getUrl(Uri.parse(
          "$WEATHER_REQUEST_URL?cityname=$cityKey&key=$WEATHER_API_KEY"));
      HttpClientResponse response = await request.close();
      result = await response.transform(utf8.decoder).join();
    } on HttpException {
      print("error");
    } finally {
      client.close();
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HttpTest"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    controller: _controller,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "请填写城市名称",
                    ),
                  )),
                  RaisedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            if (searchKey.isNotEmpty) {
                              setState(() {
                                isLoading = true;
                              });
                              _queryWeather(searchKey).then((str) {
                                if (str != null && str.isNotEmpty) {
                                  setState(() {
                                    isLoading = false;
                                    weatherJson = str;
                                  });
                                }
                              });
                            } else {
                              Fluttertoast.showToast(msg: "请输入所要查询的城市名");
                            }
                          },
                    child: Text("查询"),
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Text(isLoading ? "正在查询" : weatherJson),
              )
            ],
          ),
        ),
      ),
    );
  }
}
