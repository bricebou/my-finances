import 'package:app/core/exceptions/app_exceptions.dart';
import 'package:app/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';

class AppExceptionsTranslator {
  const AppExceptionsTranslator(
      {required this.context, required this.exception});

  final BuildContext context;
  final AppException exception;

  AppException translate() {
    final translatedMessages = <String, String>{
      'api_error_bad_request': L.of(context).api_error_bad_request,
      'api_error_unauthorized': L.of(context).api_error_unauthorized,
      'api_error_forbidden': L.of(context).api_error_forbidden,
      'api_error_not_found': L.of(context).api_error_not_found,
      'api_error_unsupported_method':
          L.of(context).api_error_unsupported_method,
      'api_error_server_error': L.of(context).api_error_server_error,
      'api_error_receive_timeout': L.of(context).api_error_receive_timeout,
      'api_error_connection_timeout':
          L.of(context).api_error_connection_timeout,
      'api_error_bad_certificate': L.of(context).api_error_bad_certificate,
      'api_error_request_canceled': L.of(context).api_error_request_canceled,
      'api_error_connection_error': L.of(context).api_error_connection_error,
      'api_error_send_timeout': L.of(context).api_error_send_timeout,
      'api_error_default': L.of(context).api_error_default,
      'api_validation_errors': L.of(context).api_validation_errors,
    };

    final translatedErrors = <String, String>{
      'api_validation_name_required':
          L.of(context).api_validation_name_required,
      'api_validation_name_min': L.of(context).api_validation_name_min,
      'api_validation_email_required':
          L.of(context).api_validation_email_required,
      'api_validation_email_email': L.of(context).api_validation_email_email,
      'api_validation_email_unique': L.of(context).api_validation_email_unique,
      'api_validation_password_required':
          L.of(context).api_validation_password_required,
      'api_validation_password_min': L.of(context).api_validation_password_min,
      'api_validation_avatar_required':
          L.of(context).api_validation_avatar_required,
      'api_validation_avatar_image': L.of(context).api_validation_avatar_image,
      'api_validation_avatar_max': L.of(context).api_validation_avatar_max,
      'api_login_error_no_record': L.of(context).api_login_error_no_record,
    };

    final updatedErrors = <String, String>{};

    if (exception.errors != null) {
      exception.errors!.forEach((key, value) {
        if (value.runtimeType == String) {
          updatedErrors[value.toString()] = translatedErrors[value.toString()]!;
        }
      });
    }

    return exception.copyWith(
        message: translatedMessages[exception.message] ?? exception.message,
        errors: updatedErrors);
  }
}
