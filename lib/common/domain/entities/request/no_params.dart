import 'package:json_annotation/json_annotation.dart';
part 'no_params.g.dart';

@JsonSerializable()
class NoParams {
  NoParams();
  factory NoParams.fromJson(Map<String, dynamic> json) =>
      _$NoParamsFromJson(json);
}
