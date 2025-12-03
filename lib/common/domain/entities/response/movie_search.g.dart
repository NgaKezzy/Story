// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieSearch _$MovieSearchFromJson(Map<String, dynamic> json) => MovieSearch(
  status: json['status'] as String?,
  msg: json['msg'] as String?,
  data: json['data'] == null
      ? null
      : MovieData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MovieSearchToJson(MovieSearch instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };
