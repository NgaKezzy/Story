// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Failure _$FailureFromJson(Map<String, dynamic> json) => Failure(
  error: json['error'] as String? ?? '',
  message: json['message'] as String? ?? '',
);

Map<String, dynamic> _$FailureToJson(Failure instance) => <String, dynamic>{
  'error': instance.error,
  'message': instance.message,
};
