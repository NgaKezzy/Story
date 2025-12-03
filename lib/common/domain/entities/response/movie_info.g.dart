// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieInfo _$MovieInfoFromJson(Map<String, dynamic> json) => MovieInfo(
  status: json['status'] as bool?,
  msg: json['msg'] as String?,
  movie: json['movie'] == null
      ? null
      : Movie.fromJson(json['movie'] as Map<String, dynamic>),
  episodes: (json['episodes'] as List<dynamic>?)
      ?.map((e) => Episode.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MovieInfoToJson(MovieInfo instance) => <String, dynamic>{
  'status': instance.status,
  'msg': instance.msg,
  'movie': instance.movie,
  'episodes': instance.episodes,
};

Episode _$EpisodeFromJson(Map<String, dynamic> json) => Episode(
  serverName: json['serverName'] as String?,
  serverData: (json['server_data'] as List<dynamic>?)
      ?.map((e) => ServerData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
  'serverName': instance.serverName,
  'server_data': instance.serverData,
};

ServerData _$ServerDataFromJson(Map<String, dynamic> json) => ServerData(
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  filename: json['filename'] as String?,
  linkEmbed: json['link_embed'] as String?,
  linkM3U8: json['link_m3u8'] as String?,
);

Map<String, dynamic> _$ServerDataToJson(ServerData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'filename': instance.filename,
      'link_embed': instance.linkEmbed,
      'link_m3u8': instance.linkM3U8,
    };
