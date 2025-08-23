// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthStateCWProxy {
  AuthState users(List<UserData> users);

  AuthState user(UserData? user);

  AuthState isLogin(bool isLogin);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthState(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthState call({List<UserData> users, UserData? user, bool isLogin});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthState.copyWith.fieldName(...)`
class _$AuthStateCWProxyImpl implements _$AuthStateCWProxy {
  const _$AuthStateCWProxyImpl(this._value);

  final AuthState _value;

  @override
  AuthState users(List<UserData> users) => this(users: users);

  @override
  AuthState user(UserData? user) => this(user: user);

  @override
  AuthState isLogin(bool isLogin) => this(isLogin: isLogin);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthState(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthState call({
    Object? users = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
    Object? isLogin = const $CopyWithPlaceholder(),
  }) {
    return AuthState(
      users:
          users == const $CopyWithPlaceholder()
              ? _value.users
              // ignore: cast_nullable_to_non_nullable
              : users as List<UserData>,
      user:
          user == const $CopyWithPlaceholder()
              ? _value.user
              // ignore: cast_nullable_to_non_nullable
              : user as UserData?,
      isLogin:
          isLogin == const $CopyWithPlaceholder()
              ? _value.isLogin
              // ignore: cast_nullable_to_non_nullable
              : isLogin as bool,
    );
  }
}

extension $AuthStateCopyWith on AuthState {
  /// Returns a callable class that can be used as follows: `instanceOfAuthState.copyWith(...)` or like so:`instanceOfAuthState.copyWith.fieldName(...)`.
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
  user:
      json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
  isLogin: json['isLogin'] as bool? ?? false,
);

Map<String, dynamic> _$AuthStateToJson(AuthState instance) => <String, dynamic>{
  'users': instance.users,
  'user': instance.user,
  'isLogin': instance.isLogin,
};
