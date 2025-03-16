import 'package:courses_eshop_app/common/utils/constants.dart';
import 'package:courses_eshop_app/global.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AppHttpClient {
  late Dio dio;

  static final AppHttpClient _instance = AppHttpClient._internal();

  factory AppHttpClient() {
    return _instance;
  }

  AppHttpClient._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: "application/json: charset=utf-8",
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // if (kDebugMode) {
        //   print('App request data: ${options.data}');
        // }

        return handler.next(options);
      },
      onResponse: (response, handler) {
        // if (kDebugMode) {
        //   print('App response data: ${response.data}');
        // }

        return handler.next(response);
      },
      onError: (e, handler) {
        HttpRequestError requestError = createHttpRequestError(e);
        onError(requestError);
      },
    ));
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    String accessToken = Global.storageService.getUserToken();
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }

    return headers;
  }

  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    // CancelToken? cancelToken,
    // void Function(int, int)? onSendProgress,
    // void Function(int, int)? onReceiveProgress,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorization = getAuthorizationHeader();

    if (authorization != null && authorization.isNotEmpty) {
      requestOptions.headers!.addAll(authorization);
    }

    if (kDebugMode) {
      print(path);
    }

    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );

    if (kDebugMode) {
      print(response);
    }

    return response.data;
  }

  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    // CancelToken? cancelToken,
    // void Function(int, int)? onSendProgress,
    // void Function(int, int)? onReceiveProgress,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorization = getAuthorizationHeader();

    if (authorization != null && authorization.isNotEmpty) {
      requestOptions.headers!.addAll(authorization);
    }

    if (kDebugMode) {
      print(path);
    }

    var response = await dio.get(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );

    if (kDebugMode) {
      print(response);
    }

    return response.data;
  }
}

class HttpRequestError implements Exception {
  int code = -1;
  String message = '';

  HttpRequestError({
    required this.code,
    required this.message,
  });

  @override
  String toString() {
    if (message == '') {
      return 'Exception';
    }

    return 'Exception code $code, $message';
  }
}

HttpRequestError createHttpRequestError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return HttpRequestError(code: -1, message: 'Connection timeout');

    case DioExceptionType.sendTimeout:
      return HttpRequestError(code: -1, message: 'Send timed out');

    case DioExceptionType.receiveTimeout:
      return HttpRequestError(code: -1, message: 'Receive timed out');

    case DioExceptionType.badCertificate:
      return HttpRequestError(code: -1, message: 'Bad ssl certificate');

    case DioExceptionType.badResponse:
      if (kDebugMode) {
        print('bad response......');
      }
      switch (error.response!.statusCode) {
        case 400:
          return HttpRequestError(code: 400, message: 'Request syntax error');
        case 401:
          return HttpRequestError(code: 401, message: 'Permission denied');
        case 404:
          return HttpRequestError(code: 404, message: error.response!.statusMessage ?? 'Not found');
        case 500:
          return HttpRequestError(code: 500, message: 'Internal server error');
      }
      return HttpRequestError(code: -1, message: 'Server bad response');

    case DioExceptionType.cancel:
      return HttpRequestError(code: -1, message: 'Server canceled it');

    case DioExceptionType.connectionError:
      return HttpRequestError(code: -1, message: 'Connection error');

    case DioExceptionType.unknown:
      return HttpRequestError(code: -1, message: 'Unknown error');
  }
}

void onError(HttpRequestError error) {
  if (kDebugMode) {
    print('error code: ${error.code} error message: ${error.message}');
  }

  switch (error.code) {
    case 400:
      print('Server syntax error');
      break;
    case 401:
      print('You are denied to continue');
      break;
    case 404:
      print('Not found');
      break;
    case 500:
      print('Internal server error');
      break;
    default:
      print('Unknown error');
      break;
  }
}
