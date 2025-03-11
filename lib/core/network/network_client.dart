import 'dart:developer';

import 'package:amicus/core/error/exceptions.dart';
import 'package:dio/dio.dart';

class NetworkClient {
  Dio _dio = Dio();

  NetworkClient(String baseUrl) {
    BaseOptions baseOptions = BaseOptions(
      receiveTimeout: const Duration(seconds: 20),
      connectTimeout: const Duration(seconds: 30),
      baseUrl: baseUrl,
      maxRedirects: 0,
      //maxRedirects: 0,
      // followRedirects: false,
    );
    _dio = Dio(baseOptions);
    // adding logging interceptor.
    _dio.interceptors.add(LogInterceptor(
      requestBody: false,
      error: true,
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      logPrint: (object) => log('Log: $object'),
    ));
  }


  Future<Response> get(String url, Map<String, dynamic> params,
      {String? token}) async {
    Response response;
    try {
      Map<String, dynamic> map = {};

      if (token != null) map.addAll({"Authorization": "Bearer $token"});
      response = await _dio.get(
        url,
        queryParameters: params,
        options: Options(
          responseType: ResponseType.json,
          headers: map,
        ),
      );
    } on DioException catch (exception) {
      throw RemoteException(dioError: exception);
    }
    return response;
  }


  Future<Response> post(String url, dynamic params, {String? token}) async {


      Response response;
      try {
        Map<String, dynamic> map = {};

        if (token != null) map.addAll({"Authorization": "Bearer $token"});
        response = await _dio.post(url,
            data: params,
            options: Options(
              responseType: ResponseType.json,
              headers: map,
            ));
      } on DioException catch (exception) {
        throw RemoteException(dioError: exception);
      }
      return response;

  }


  Future<Response> put(String url, Map<String, Object> params,
      {String? token}) async {
    Response response;
    try {
      Map<String, dynamic> map = {};

      if (token != null) map.addAll({"Authorization": "Bearer $token"});
      response = await _dio.put(url,
          data: params,
          options: Options(
            responseType: ResponseType.json,
            headers: map,
          ));
    } on DioException catch (exception) {
      throw RemoteException(dioError: exception);
    }
    return response;
  }


  Future<Response> delete(String url, dynamic params, {String? token}) async {
    Response response;
    try {
      Map<String, dynamic> map = {};

      if (token != null) map.addAll({"Authorization": "Bearer $token"});
      response = await _dio.delete(url,
          data: params,
          options: Options(
            responseType: ResponseType.json,
            headers: map,
          ));
    } on DioException catch (exception) {
      throw RemoteException(dioError: exception);
    }
    return response;
  }


  Future<Response> download(String url, String pathName,
      void Function(int, int)? onReceiveProgress) async {
    Response response;
    try {
      response = await _dio.download(
        url,
        pathName,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (exception) {
      throw RemoteException(dioError: exception);
    }
    return response;
  }


}

class ConnectionStatusModel {
  Response? response;
  bool connected;

  ConnectionStatusModel({this.response, required this.connected});
}
