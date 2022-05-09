// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Episodes _$EpisodesFromJson(Map<String, dynamic> json) => Episodes(
      (json['values'] as List<dynamic>)
          .map((e) => Episode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EpisodesToJson(Episodes instance) => <String, dynamic>{
      'values': instance.values,
    };

Episode _$EpisodeFromJson(Map<String, dynamic> json) => Episode(
      json['id'] as String,
      json['contents'] as String,
      DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'id': instance.id,
      'contents': instance.contents,
      'date': instance.date.toIso8601String(),
    };
