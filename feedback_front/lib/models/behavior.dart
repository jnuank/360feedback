import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'behavior.g.dart';

@JsonSerializable()
class Behavior {
  final String memberName;
  final String contents;

  Behavior(this.memberName, this.contents);

  factory Behavior.fromJson(Map<String, dynamic> json) => _$BehaviorFromJson(json);
  Map<String, dynamic> toJson() => _$BehaviorToJson(this);

  @override
  String toString() => json.encode(toJson());
}
