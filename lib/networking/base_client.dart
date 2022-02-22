import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../values/apis.dart';

class BaseClient {
  Dio? _dio;
  int timeout = 65000;
  static BaseClient? _instance;

  factory BaseClient() => _instance ??= BaseClient._internal();

  BaseClient._internal() {
    _dio = _getDioClient();

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback = ((cert, host, port) => true);
      return null;
    };
  }

  Dio _getDioClient() {
    if (_dio == null) {
      var baseOption = BaseOptions(
          connectTimeout: timeout, receiveTimeout: timeout, baseUrl: baseUrl);
      _dio = Dio(baseOption);
    }
    return _dio!;
  }

  Dio get dio => _dio!;
}
