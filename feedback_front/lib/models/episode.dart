import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'episode.g.dart';

@JsonSerializable()
class Episode {
  final String contents;
  final DateTime date;

  Episode(this.contents, this.date);

  factory Episode.fromJson(Map<String, dynamic> json) => _$EpisodeFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeToJson(this);

  @override
  String toString() => json.encode(toJson());

}