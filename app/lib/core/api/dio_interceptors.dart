import 'dart:developer';

import 'package:app/core/storage/storage_helpers.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioInterceptors extends Interceptor {
  DioInterceptors(this.ref);

  Ref ref;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = ref.read(storageHelpersProvider).getAuthToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    log('Request[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('Response Status Code: [${response.statusCode}]');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('Error[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
