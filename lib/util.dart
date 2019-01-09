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
