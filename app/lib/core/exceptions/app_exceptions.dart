import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exceptions.freezed.dart';
part 'app_exceptions.g.dart';

@freezed
class AppException with _$AppException implements Exception {
  const factory AppException({
    final int? statusCode,
    final String? message,
    final Map<String, dynamic>? errors,
  }) = _AppException;

  factory AppException.fromJson(Map<String, dynamic> json) =>
      _$AppExceptionFromJson(json);

  factory AppException.fromDioException(DioException dioException) {
    String message;
    switch (dioException.type) {
      case DioExceptionType.badResponse:
        switch (dioException.response!.statusCode) {
          case 400:
            message = 'api_error_bad_request';
            break;
          case 401:
            message = 'api_error_unauthorized';
            break;
          case 403:
            message = 'api_error_forbidden';
            break;
          case 404:
            message = 'api_error_not_found';
            break;
          case 405:
            message = 'api_error_unsupported_method';
            break;
          case 500:
            message = 'api_error_server_error';
            break;
          default:
            message = 'api_error_default';
        }
        break;
      case DioExceptionType.unknown:
        message = 'api_error_default';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'api_error_receive_timeout';
        break;
      case DioExceptionType.connectionTimeout:
        message = 'api_error_connection_timeout';
        break;
      case DioExceptionType.badCertificate:
        message = 'api_error_bad_certificate';
        break;
      case DioExceptionType.cancel:
        message = 'api_error_request_canceled';
      case DioExceptionType.connectionError:
        message = 'api_error_connection_error';
        break;
      case DioExceptionType.sendTimeout:
        message = 'api_error_send_timeout';
        break;
    }

    final statusCode = dioException.response != null
        ? dioException.response!.statusCode
        : null;

    final errors = dioException.response != null
        ? dioException.response?.data['errors'] != null
            ? dioException.response?.data['errors'] as Map<String, dynamic>
            : null
        : null;

    return AppException(
      statusCode: statusCode,
      message: message,
      errors: errors,
    );
  }
}
