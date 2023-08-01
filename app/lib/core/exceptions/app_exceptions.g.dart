// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_exceptions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppException _$$_AppExceptionFromJson(Map<String, dynamic> json) =>
    _$_AppException(
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      errors: json['errors'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_AppExceptionToJson(_$_AppException instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'errors': instance.errors,
    };
