import 'package:json_annotation/json_annotation.dart';
part 'page.g.dart';

@JsonSerializable()
class PageMovie {
  int page;

  PageMovie({required this.page});

  factory PageMovie.fromJson(Map<String, dynamic> json) =>
      _$PageMovieFromJson(json);

  Map<String, dynamic> toJson() => _$PageMovieToJson(this);
}
