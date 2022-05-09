
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'feedback.g.dart';


@JsonSerializable()
class Feedbacks{
  final List<FeedBack> behaviors;

  Feedbacks(this.behaviors);

  factory Feedbacks.fromJson(Map<String, dynamic> json) => _$FeedbacksFromJson(json);
  Map<String, dynamic> toJson() => _$FeedbacksToJson(this);

  @override
  String toString() => json.encode(toJson());

}

@JsonSerializable()
class FeedBack{
  final String id;
  final DateTime date;
  final String episode;
  final String member;
  final String behavior;

  FeedBack(this.id, this.date, this.episode, this.member, this.behavior);

  factory FeedBack.fromJson(Map<String, dynamic> json) => _$FeedBackFromJson(json);
  Map<String, dynamic> toJson() => _$FeedBackToJson(this);

  @override
  String toString() => json.encode(toJson());
}

