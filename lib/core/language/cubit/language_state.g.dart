// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LanguageStateCWProxy {
  LanguageState languageCode(String languageCode);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `LanguageState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// LanguageState(...).copyWith(id: 12, name: "My name")
  /// ```
  LanguageState call({String languageCode});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfLanguageState.copyWith(...)` or call `instanceOfLanguageState.copyWith.fieldName(value)` for a single field.
class _$LanguageStateCWProxyImpl implements _$LanguageStateCWProxy {
  const _$LanguageStateCWProxyImpl(this._value);

  final LanguageState _value;

  @override
  LanguageState languageCode(String languageCode) =>
      call(languageCode: languageCode);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `LanguageState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// LanguageState(...).copyWith(id: 12, name: "My name")
  /// ```
  LanguageState call({Object? languageCode = const $CopyWithPlaceholder()}) {
    return LanguageState(
      languageCode:
          languageCode == const $CopyWithPlaceholder() || languageCode == null
          ? _value.languageCode
          // ignore: cast_nullable_to_non_nullable
          : languageCode as String,
    );
  }
}

extension $LanguageStateCopyWith on LanguageState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfLanguageState.copyWith(...)` or `instanceOfLanguageState.copyWith.fieldName(...)`.
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
