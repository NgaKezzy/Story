// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MovieStateCWProxy {
  MovieState newMovieList(List<Movie> newMovieList);

  MovieState movieInfo(MovieInfo? movieInfo);

  MovieState movieSearchList(List<Movie> movieSearchList);

  MovieState movieHistory(List<Movie> movieHistory);

  MovieState movieSeries(List<Movie> movieSeries);

  MovieState movieSingle(List<Movie> movieSingle);

  MovieState movieCartoon(List<Movie> movieCartoon);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `MovieState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MovieState(...).copyWith(id: 12, name: "My name")
  /// ```
  MovieState call({
    List<Movie> newMovieList,
    MovieInfo? movieInfo,
    List<Movie> movieSearchList,
    List<Movie> movieHistory,
    List<Movie> movieSeries,
    List<Movie> movieSingle,
    List<Movie> movieCartoon,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfMovieState.copyWith(...)` or call `instanceOfMovieState.copyWith.fieldName(value)` for a single field.
class _$MovieStateCWProxyImpl implements _$MovieStateCWProxy {
  const _$MovieStateCWProxyImpl(this._value);

  final MovieState _value;

  @override
  MovieState newMovieList(List<Movie> newMovieList) =>
      call(newMovieList: newMovieList);

  @override
  MovieState movieInfo(MovieInfo? movieInfo) => call(movieInfo: movieInfo);

  @override
  MovieState movieSearchList(List<Movie> movieSearchList) =>
      call(movieSearchList: movieSearchList);

  @override
  MovieState movieHistory(List<Movie> movieHistory) =>
      call(movieHistory: movieHistory);

  @override
  MovieState movieSeries(List<Movie> movieSeries) =>
      call(movieSeries: movieSeries);

  @override
  MovieState movieSingle(List<Movie> movieSingle) =>
      call(movieSingle: movieSingle);

  @override
  MovieState movieCartoon(List<Movie> movieCartoon) =>
      call(movieCartoon: movieCartoon);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `MovieState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MovieState(...).copyWith(id: 12, name: "My name")
  /// ```
  MovieState call({
    Object? newMovieList = const $CopyWithPlaceholder(),
    Object? movieInfo = const $CopyWithPlaceholder(),
    Object? movieSearchList = const $CopyWithPlaceholder(),
    Object? movieHistory = const $CopyWithPlaceholder(),
    Object? movieSeries = const $CopyWithPlaceholder(),
    Object? movieSingle = const $CopyWithPlaceholder(),
    Object? movieCartoon = const $CopyWithPlaceholder(),
  }) {
    return MovieState(
      newMovieList:
          newMovieList == const $CopyWithPlaceholder() || newMovieList == null
          ? _value.newMovieList
          // ignore: cast_nullable_to_non_nullable
          : newMovieList as List<Movie>,
      movieInfo: movieInfo == const $CopyWithPlaceholder()
          ? _value.movieInfo
          // ignore: cast_nullable_to_non_nullable
          : movieInfo as MovieInfo?,
      movieSearchList:
          movieSearchList == const $CopyWithPlaceholder() ||
              movieSearchList == null
          ? _value.movieSearchList
          // ignore: cast_nullable_to_non_nullable
          : movieSearchList as List<Movie>,
      movieHistory:
          movieHistory == const $CopyWithPlaceholder() || movieHistory == null
          ? _value.movieHistory
          // ignore: cast_nullable_to_non_nullable
          : movieHistory as List<Movie>,
      movieSeries:
          movieSeries == const $CopyWithPlaceholder() || movieSeries == null
          ? _value.movieSeries
          // ignore: cast_nullable_to_non_nullable
          : movieSeries as List<Movie>,
      movieSingle:
          movieSingle == const $CopyWithPlaceholder() || movieSingle == null
          ? _value.movieSingle
          // ignore: cast_nullable_to_non_nullable
          : movieSingle as List<Movie>,
      movieCartoon:
          movieCartoon == const $CopyWithPlaceholder() || movieCartoon == null
          ? _value.movieCartoon
          // ignore: cast_nullable_to_non_nullable
          : movieCartoon as List<Movie>,
    );
  }
}

extension $MovieStateCopyWith on MovieState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfMovieState.copyWith(...)` or `instanceOfMovieState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MovieStateCWProxy get copyWith => _$MovieStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieState _$MovieStateFromJson(Map<String, dynamic> json) => MovieState(
  newMovieList:
      (json['newMovieList'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  movieInfo: json['movieInfo'] == null
      ? null
      : MovieInfo.fromJson(json['movieInfo'] as Map<String, dynamic>),
  movieSearchList:
      (json['movieSearchList'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  movieHistory:
      (json['movieHistory'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  movieSeries:
      (json['movieSeries'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  movieSingle:
      (json['movieSingle'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  movieCartoon:
      (json['movieCartoon'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$MovieStateToJson(MovieState instance) =>
    <String, dynamic>{
      'newMovieList': instance.newMovieList,
      'movieInfo': instance.movieInfo,
      'movieSearchList': instance.movieSearchList,
      'movieHistory': instance.movieHistory,
      'movieSingle': instance.movieSingle,
      'movieSeries': instance.movieSeries,
      'movieCartoon': instance.movieCartoon,
    };
