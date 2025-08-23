import 'package:json_annotation/json_annotation.dart';

part 'failure.g.dart';

@JsonSerializable()
class Failure {
  Failure({this.error = '', this.message = ''});
  final String? error;
  final String? message;

  factory Failure.fromJson(Map<String, dynamic> json) =>
      _$FailureFromJson(json);
}
