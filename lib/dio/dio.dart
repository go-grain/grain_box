import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioHttp {
  static DioHttp? _instance;
  static final dio = Dio(); // With default `Options`.

  DioHttp._internal();

  factory DioHttp() {
    if (_instance == null) {
      interceptors();
      initAdapter();
    }
    _instance ??= DioHttp._internal();
    return _instance!;
  }

  static void configureDio(baseUrl, {connectTimeout = 5, receiveTimeout = 3}) {
    // Update default configs.
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = Duration(seconds: connectTimeout);
    dio.options.receiveTimeout = Duration(seconds: receiveTimeout);
  }

  static void interceptors() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // 处理请求前的逻辑
        return handler.next(options);
      },
      onResponse: (response, handler) async {
        // 处理响应后的逻辑
        return handler.next(response);
      },
      onError: (DioException e, handler) async {
        // 处理错误
        final response = e.response;
        if (response != null) {
          // 服务器响应了，但状态码不是2xx
          print('Error response from server: ${response.statusCode}');
          print('Error message from server: ${response.data}');
        }
        // 可以选择抛出异常或者返回错误信息
        return handler.next(e);
      },
    ));
  }

  static void initAdapter() {
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.findProxy = (uri) {
          // 将请求代理至 localhost:8888。
          // 请注意，代理会在你正在运行应用的设备上生效，而不是在宿主平台生效。
          return 'localhost:8888';
        };
        return client;
      },
    );
  }

  Future<Response<dynamic>> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return await dio.get(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw Exception('GET request failed: ${e.message}');
    }
  }

  Future<Response<dynamic>> post(String path,
      {data, Map<String, String>? headers}) async {
    try {
      return await dio.post(path,
          data: data, options: Options(headers: headers));
    } on DioException catch (e) {
      throw Exception('POST request failed: ${e.message}');
    }
  }

  Future<Response<dynamic>> delete(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return await dio.delete(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw Exception('DELETE request failed: ${e.message}');
    }
  }

  Future<Response<dynamic>> put(String path,
      {data, Map<String, String>? headers}) async {
    try {
      return await dio.put(path,
          data: data, options: Options(headers: headers));
    } on DioException catch (e) {
      throw Exception('PUT request failed: ${e.message}');
    }
  }
}
