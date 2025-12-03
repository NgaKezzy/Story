// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthStateCWProxy {
  AuthState users(List<UserData> users);

  AuthState user(UserData? user);

  AuthState isLogin(bool isLogin);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AuthState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AuthState(...).copyWith(id: 12, name: "My name")
  /// ```
  AuthState call({List<UserData> users, UserData? user, bool isLogin});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAuthState.copyWith(...)` or call `instanceOfAuthState.copyWith.fieldName(value)` for a single field.
class _$AuthStateCWProxyImpl implements _$AuthStateCWProxy {
  const _$AuthStateCWProxyImpl(this._value);

  final AuthState _value;

  @override
  AuthState users(List<UserData> users) => call(users: users);

  @override
  AuthState user(UserData? user) => call(user: user);

  @override
  AuthState isLogin(bool isLogin) => call(isLogin: isLogin);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AuthState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AuthState(...).copyWith(id: 12, name: "My name")
  /// ```
  AuthState call({
    Object? users = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
    Object? isLogin = const $CopyWithPlaceholder(),
  }) {
    return AuthState(
      users: users == const $CopyWithPlaceholder() || users == null
          ? _value.users
          // ignore: cast_nullable_to_non_nullable
          : users as List<UserData>,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as UserData?,
      isLogin: isLogin == const $CopyWithPlaceholder() || isLogin == null
          ? _value.isLogin
          // ignore: cast_nullable_to_non_nullable
          : isLogin as bool,
    );
  }
}

extension $AuthStateCopyWith on AuthState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAuthState.copyWith(...)` or `instanceOfAuthState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthStateCWProxy get copyWith => _$AuthStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthState _$AuthStateFromJson(Map<String, dynamic> json) => AuthState(
  users:
      (json['users'] as List<dynamic>?)
          ?.map((e) => UserData.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  user: json['user'] == null
      ? null
      : UserData.fromJson(json['user'] as Map<String, dynamic>),
  isLogin: json['isLogin'] as bool? ?? false,
);

Map<String, dynamic> _$AuthStateToJson(AuthState instance) => <String, dynamic>{
  'users': instance.users,
  'user': instance.user,
  'isLogin': instance.isLogin,
};
