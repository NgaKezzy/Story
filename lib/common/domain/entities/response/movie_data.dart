// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_data.g.dart';

@JsonSerializable()
class MovieData {
  List<Movie>? items;
  Pagination? pagination;

  MovieData({this.items, this.pagination});

  factory MovieData.fromJson(Map<String, dynamic> json) =>
      _$MovieDataFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDataToJson(this);
}

@JsonSerializable()
@CopyWith()
class Movie {
  String? id;
  String? name;
  String? slug;
  String? originName;
  String? content;
  String? type;
  String? status;
  @JsonKey(name: 'poster_url')
  String? posterUrl;
  @JsonKey(name: 'thumb_url')
  String? thumbUrl;
  bool? isCopyright;
  bool? subDocquyen;
  bool? chieurap;
  String? trailerUrl;
  String? time;
  String? episodeCurrent;
  String? episodeTotal;
  String? quality;
  String? lang;
  String? notify;
  String? showtimes;
  int? year;
  int? view;
  List<String>? actor;
  List<String>? director;
  List<Category>? category;
  List<Category>? country;
  int episodeCurrentlyWatching;
  Duration? duration;

  Movie({
    this.id,
    this.name,
    this.slug,
    this.originName,
    this.content,
    this.type,
    this.status,
    this.posterUrl,
    this.thumbUrl,
    this.isCopyright,
    this.subDocquyen,
    this.chieurap,
    this.trailerUrl,
    this.time,
    this.episodeCurrent,
    this.episodeTotal,
    this.quality,
    this.lang,
    this.notify,
    this.showtimes,
    this.year,
    this.view,
    this.actor,
    this.director,
    this.category,
    this.country,
    this.duration,
    this.episodeCurrentlyWatching = 0,
  });

  String get fullThumbUrl {
    const prefix = 'https://img.phimapi.com/';
    if (thumbUrl == null || thumbUrl!.isEmpty) return '';
    return thumbUrl!.startsWith('http') ? thumbUrl! : '$prefix$thumbUrl';
  }

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable()
class Modified {
  DateTime? time;

  Modified({this.time});

  factory Modified.fromJson(Map<String, dynamic> json) =>
      _$ModifiedFromJson(json);

  Map<String, dynamic> toJson() => _$ModifiedToJson(this);
}

@JsonSerializable()
class Pagination {
  int? totalItems;
  int? totalItemsPerPage;
  int? currentPage;
  int? totalPages;

  Pagination({
    this.totalItems,
    this.totalItemsPerPage,
    this.currentPage,
    this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

@JsonSerializable()
class Category {
  String? id;
  String? name;
  String? slug;

  Category({this.id, this.name, this.slug});
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  String toString() => '$name ';
}
