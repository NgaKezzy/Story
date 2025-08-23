import 'package:json_annotation/json_annotation.dart';
part 'limit_movie.g.dart';
@JsonSerializable()
class LimitMovie {
  final int limit;
  LimitMovie({
    required this.limit,
  });
  
   factory LimitMovie.fromJson(Map<String, dynamic> json) =>
      _$LimitMovieFromJson(json);

  Map<String, dynamic> toJson() => _$LimitMovieToJson(this);
}
