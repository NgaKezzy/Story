import 'dart:io';

import 'package:alice/alice.dart';

import 'package:dio/dio.dart';
import 'package:dio_curl_logger/dio_curl_logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:story/core/dio/intercepter.dart';
import 'package:story/main.dart';

abstract class AppNetworkModule {
  static bool _shouldEnableAlice() {
    // Bật Alice cho môi trường dev, staging và testflight
    return appFlavor != BuildFlavor.production;
  }

  static Dio provideDio(Alice alice) {
    Dio dio = Dio(
      BaseOptions(
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(RequestInterceptor());
    dio.interceptors.add(
      CurlLoggingInterceptor(
        showRequestLog:
            true, // Set to false to disable logging of HTTP requests
        showResponseLog:
            false, // Set to false to disable logging of HTTP responses
      ),
    );
    if (_shouldEnableAlice()) {
      if (Platform.isIOS) {
        dio.interceptors.add(alice.getDioInterceptor());
      }
    }

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    return dio;
  }
}
