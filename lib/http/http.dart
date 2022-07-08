import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:maskpark/util/bus.dart';
import 'package:maskpark/widget/toast.dart';

var http = Http();

class Http {
  var dio = Dio();
  var useCharles = false;

  ///使用charles需修改对应ip
  String charlesProxy = '169.254.124.128:8887';

  Http._internal() {
    dio.options.baseUrl = "http://rest.vtpm.starblingbling.com/";
    dio.options.connectTimeout = 20000;
    dio.options.receiveTimeout = 10000;

    dio.interceptors.add(LogInterceptor());
    dio.interceptors.add(InterceptorsWrapper(onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      options.headers.addAll({"token": "1231231231231"});
      return handler.next(options);
    }, onResponse:
        (Response response, ResponseInterceptorHandler handler) async {
      return handler.next(response);
    }, onError: (DioError error, ErrorInterceptorHandler handler) async {
      if (error.response?.statusCode == 401) {
        bus.emit("401");
      } else {
        if (error.type == DioErrorType.connectTimeout ||
            error.type == DioErrorType.receiveTimeout ||
            error.type == DioErrorType.other) {
          toast.show("network error");
        } else {
          var errData = error.response?.data;
          if (errData != null) {
            toast.show(errData["message"]);
          }
        }
      }
      return error;
    }));

    ///charles抓包
    if (kDebugMode && useCharles) {
      bool isProxyChecked = true;
      String proxy = charlesProxy;
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          return isProxyChecked && Platform.isAndroid;
        };
        client.findProxy = (url) {
          return isProxyChecked ? 'PROXY $proxy' : 'DIRECT';
        };
      };
    }
  }

  static Http _singleton = new Http._internal();

  factory Http() => _singleton;

  Future<Response<T>> get<T>(
      {String path, Map<String, dynamic> params, Options options}) {
    return dio.get<T>(path, queryParameters: params, options: options);
  }

  Future<Response<T>> post<T>({
    String path,
    body,
    Map<String, dynamic> params,
    bool isFormData = false,
    Options options,
  }) {
    if (isFormData) {
      FormData formData = new FormData.fromMap(body);
      body = formData;
    }
    return dio.post<T>(path,
        data: body, queryParameters: params, options: options);
  }

  Future<Response> download({
    String urlPath,
    savePath,
    Map<String, dynamic> queryParams,
    ProgressCallback progressCallback,
  }) {
    return dio.download(urlPath, savePath,
        queryParameters: queryParams, onReceiveProgress: progressCallback);
  }
}
