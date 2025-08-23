// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LanguageStateCWProxy {
  LanguageState languageCode(String languageCode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LanguageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LanguageState(...).copyWith(id: 12, name: "My name")
  /// ````
  LanguageState call({String languageCode});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLanguageState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLanguageState.copyWith.fieldName(...)`
class _$LanguageStateCWProxyImpl implements _$LanguageStateCWProxy {
  const _$LanguageStateCWProxyImpl(this._value);

  final LanguageState _value;

  @override
  LanguageState languageCode(String languageCode) =>
      this(languageCode: languageCode);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LanguageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LanguageState(...).copyWith(id: 12, name: "My name")
  /// ````
  LanguageState call({Object? languageCode = const $CopyWithPlaceholder()}) {
    return LanguageState(
      languageCode:
          languageCode == const $CopyWithPlaceholder()
              ? _value.languageCode
              // ignore: cast_nullable_to_non_nullable
              : languageCode as String,
    );
  }
}

extension $LanguageStateCopyWith on LanguageState {
  /// Returns a callable class that can be used as follows: `instanceOfLanguageState.copyWith(...)` or like so:`instanceOfLanguageState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LanguageStateCWProxy get copyWith => _$LanguageStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageState _$LanguageStateFromJson(Map<String, dynamic> json) =>
    LanguageState(languageCode: json['languageCode'] as String? ?? 'vi');

Map<String, dynamic> _$LanguageStateToJson(LanguageState instance) =>
    <String, dynamic>{'languageCode': instance.languageCode};
