import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'episode.g.dart';

@JsonSerializable()
class Episodes {
  final List<Episode> values;

  Episodes(this.values);

  factory Episodes.fromJson(Map<String, dynamic> json) => _$EpisodesFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodesToJson(this);

  @override
  String toString() => json.encode(toJson());
}


@JsonSerializable()
class Episode {
  final String? id;
  final String contents;
  final DateTime date;

  Episode(this.id, this.contents, this.date);

  factory Episode.fromJson(Map<String, dynamic> json) => _$EpisodeFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeToJson(this);

  factory Episode.of(String contents, DateTime date) => Episode(null, contents, date);

  @override
  String toString() => json.encode(toJson());

}