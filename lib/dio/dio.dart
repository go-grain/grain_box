import 'package:dio/dio.dart';

class XDio {
  static Dio dio = Dio(); // With default `Options`.

  void configureDio(String baseUrl, String tokenKey) {
    dio.options = BaseOptions(
      baseUrl: baseUrl, //"http://127.0.0.1:8080/api/v1",
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // 如果你想完成请求并返回一些自定义数据，你可以使用 `handler.resolve(response)`。
          // 如果你想终止请求并触发一个错误，你可以使用 `handler.reject(error)`。
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          // 如果你想终止请求并触发一个错误，你可以使用 `handler.reject(error)`。
          var newToken = response.headers.value(tokenKey);
          if (newToken != "") {
            print(newToken);
          }
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          // 如果你想完成请求并返回一些自定义数据，你可以使用 `handler.resolve(response)`。
          // 处理异常
          final response = e.response;
          if (response != null) {
            print(response.data);
            print(response.headers);
            print(response.requestOptions);
          } else {
            print(e.requestOptions);
            print(e.message);
          }
          return handler.next(e);
        },
      ),
    );
  }

  static setOptions(String baseUrl) {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
  }

  static setToken(String key, String token) {
    dio.options.headers[key] = token;
  }

  static Future<dynamic> get(uri) async {
    // 发送请求
    Response response = await dio.get(uri);
    // 处理响应
    print(response.data.data);
    return response.data;
  }

  static Future<dynamic> post(String path, {Map<String, dynamic>? data}) async {
    final response = await dio.post(
      path,
      data: data,
    );
    if (response.statusCode != 200) {
      throw Exception('Response status code is ${response.statusCode}');
    }
    return response.data;
  }
}
