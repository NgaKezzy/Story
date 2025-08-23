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

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MovieState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MovieState(...).copyWith(id: 12, name: "My name")
  /// ````
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

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMovieState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMovieState.copyWith.fieldName(...)`
class _$MovieStateCWProxyImpl implements _$MovieStateCWProxy {
  const _$MovieStateCWProxyImpl(this._value);

  final MovieState _value;

  @override
  MovieState newMovieList(List<Movie> newMovieList) =>
      this(newMovieList: newMovieList);

  @override
  MovieState movieInfo(MovieInfo? movieInfo) => this(movieInfo: movieInfo);

  @override
  MovieState movieSearchList(List<Movie> movieSearchList) =>
      this(movieSearchList: movieSearchList);

  @override
  MovieState movieHistory(List<Movie> movieHistory) =>
      this(movieHistory: movieHistory);

  @override
  MovieState movieSeries(List<Movie> movieSeries) =>
      this(movieSeries: movieSeries);

  @override
  MovieState movieSingle(List<Movie> movieSingle) =>
      this(movieSingle: movieSingle);

  @override
  MovieState movieCartoon(List<Movie> movieCartoon) =>
      this(movieCartoon: movieCartoon);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MovieState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MovieState(...).copyWith(id: 12, name: "My name")
  /// ````
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
          newMovieList == const $CopyWithPlaceholder()
              ? _value.newMovieList
              // ignore: cast_nullable_to_non_nullable
              : newMovieList as List<Movie>,
      movieInfo:
          movieInfo == const $CopyWithPlaceholder()
              ? _value.movieInfo
              // ignore: cast_nullable_to_non_nullable
              : movieInfo as MovieInfo?,
      movieSearchList:
          movieSearchList == const $CopyWithPlaceholder()
              ? _value.movieSearchList
              // ignore: cast_nullable_to_non_nullable
              : movieSearchList as List<Movie>,
      movieHistory:
          movieHistory == const $CopyWithPlaceholder()
              ? _value.movieHistory
              // ignore: cast_nullable_to_non_nullable
              : movieHistory as List<Movie>,
      movieSeries:
          movieSeries == const $CopyWithPlaceholder()
              ? _value.movieSeries
              // ignore: cast_nullable_to_non_nullable
              : movieSeries as List<Movie>,
      movieSingle:
          movieSingle == const $CopyWithPlaceholder()
              ? _value.movieSingle
              // ignore: cast_nullable_to_non_nullable
              : movieSingle as List<Movie>,
      movieCartoon:
          movieCartoon == const $CopyWithPlaceholder()
              ? _value.movieCartoon
              // ignore: cast_nullable_to_non_nullable
              : movieCartoon as List<Movie>,
    );
  }
}

extension $MovieStateCopyWith on MovieState {
  /// Returns a callable class that can be used as follows: `instanceOfMovieState.copyWith(...)` or like so:`instanceOfMovieState.copyWith.fieldName(...)`.
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
  movieInfo:
      json['movieInfo'] == null
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
