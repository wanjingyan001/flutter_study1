import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

Future<SharedPreferences> getSP() async {
  SharedPreferences sp;
  if (sp == null) {
    sp = await SharedPreferences.getInstance();
  }
  return sp;
}

class DioSingleton {
  DioSingleton._internal();

  Dio _dio;

  Dio httpDio({Options opt}) {
    if (opt == null) {
      opt = defaultOptions;
    }
    if (_dio == null) {
      _dio = Dio(opt);
    }
    return _dio;
  }

  static final DioSingleton _singleton = DioSingleton._internal();

  factory DioSingleton() {
    return _singleton;
  }
}

Options buildOptions({
  @required String baseUrl,
  int connectTimeout = 15000,
  int receiveTimeout = 5000,
  Map<String, dynamic> headers,
  ResponseType responseType,
  ContentType contentType,
}) {
  Options options = Options(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      headers: headers,
      responseType: responseType,
      contentType: contentType);
  return options;
}

Options defaultOptions = buildOptions(baseUrl: "http://v.juhe.cn/",responseType: ResponseType.PLAIN);








abstract class JsonString{
  static final String mockdata = ''' {
  "by" : "dhouston",
  "descendants" : 71,
  "id" : 8863,
  "kids" : [ 8952, 9224, 8917, 8884, 8887, 8943, 8869, 8958, 9005, 9671, 8940, 9067, 8908, 9055, 8865, 8881, 8872, 8873, 8955, 10403, 8903, 8928, 9125, 8998, 8901, 8902, 8907, 8894, 8878, 8870, 8980, 8934, 8876 ],
  "score" : 111,
  "time" : 1175714200,
  "title" : "My YC app: Dropbox - Throw away your USB drive",
  "type" : "story",
  "url" : "http://www.getdropbox.com/u/2/screencast.html"
}''';
}



void printContextInfo(String name,BuildContext context){
  print('$name context type:${context.runtimeType}\n');
  print('$name context widget type:${context.widget.runtimeType}\n');
  print('$name context owner type:${context.owner.runtimeType}\n');
  print('$name context:${context.toString()}\n');
}

