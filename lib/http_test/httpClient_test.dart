import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logging/logging.dart';
import 'package:study1/bean/ApiResult.dart';
import 'package:study1/bean/WeatherResult.dart';
import 'package:study1/bean/weather.dart';
import 'package:study1/http_test/request_constant.dart';
import 'package:study1/util/util.dart';


class HttpClientTest1 extends StatefulWidget {
  static const String routeName = '/HttpClientTest1';

  @override
  State<StatefulWidget> createState() {
    return _HttpClient1State();
  }
}

class _HttpClient1State extends State<HttpClientTest1> {
  final Logger log = Logger("Http");
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

  Future _queryWeather(String cityKey) async {
    HttpClient client = HttpClient();
    String result;
    try {
      HttpClientRequest request = await client.getUrl(Uri.parse(
          "$WEATHER_REQUEST_URL?cityname=$cityKey&key=$WEATHER_API_KEY"));
      HttpClientResponse response = await request.close();
      result = await response.transform(utf8.decoder).join();
      print(response.headers);
    } on HttpException {
      print("error");
    } finally {
      client.close();
    }
    return result;
  }

  Future<WeatherResult> _queryWeatherByDio(String cityKey) async {
    Dio dio = DioSingleton().httpDio();
    Response response = await dio.get("/weather/index",
        data: {"cityname": cityKey, "key": WEATHER_API_KEY, "format": 2});
//    print(response.headers);
    print("data==>${response.data}");
    Map dataMap = json.decode(response.data);
    WeatherResult result = WeatherResult.fromJson(dataMap);
    print("json model=====>${result.toJson()}");
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
                              _queryWeatherByDio(searchKey).then((bean) {
                                if (bean != null) {
                                  setState(() {
                                    isLoading = false;
                                    weatherJson =
                                        bean.result.today.dressingAdvice;
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
