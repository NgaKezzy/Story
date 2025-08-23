
 import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'language_state.g.dart';

@CopyWith()
@JsonSerializable()
class LanguageState extends Equatable {
  const LanguageState({this.languageCode = 'vi'});
  final String languageCode;

  @override
  List<Object> get props => [languageCode];
  factory LanguageState.fromJson(Map<String, dynamic> json) =>
      _$LanguageStateFromJson(json);
  Map<String, dynamic> toJson() => _$LanguageStateToJson(this);
}

