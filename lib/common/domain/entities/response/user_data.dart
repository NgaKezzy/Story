import 'package:json_annotation/json_annotation.dart';
part 'user_data.g.dart';
@JsonSerializable()
class UserData {
  final String name;
  final String username;
  final String email;
  final String pass;
  UserData({
    required this.name,
    required this.username,
    required this.email,
    required this.pass,
  });
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
