// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feedbacks _$FeedbacksFromJson(Map<String, dynamic> json) => Feedbacks(
      (json['behaviors'] as List<dynamic>)
          .map((e) => FeedBack.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedbacksToJson(Feedbacks instance) => <String, dynamic>{
      'behaviors': instance.behaviors,
    };

FeedBack _$FeedBackFromJson(Map<String, dynamic> json) => FeedBack(
      json['id'] as String,
      DateTime.parse(json['date'] as String),
      json['episode'] as String,
      json['member'] as String,
      json['behavior'] as String,
    );

Map<String, dynamic> _$FeedBackToJson(FeedBack instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'episode': instance.episode,
      'member': instance.member,
      'behavior': instance.behavior,
    };
