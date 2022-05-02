import 'dart:convert';

import 'package:feedback_front/models/episode.dart';
import 'package:feedback_front/models/feedback.dart';
import 'package:http/http.dart' as http;

import '../models/behavior.dart';

const String feedbackApi = String.fromEnvironment('FEEDBACK_ENDPOINT');

Future<Feedbacks> fetchFeedback(String memberName) async {
  final res =
      await http.get(Uri.parse('$feedbackApi/episodes?memberName=$memberName'));
  if (res.statusCode == 200) {
    return Feedbacks.fromJson(jsonDecode(utf8.decode(res.bodyBytes)));
  } else {
    throw Exception('Failed to load feedback');
  }
}

Future<String> registerEpisode(Episode episode) async {
  final res = await http.post(Uri.parse('$feedbackApi/episodes'),
      body: json.encode(episode.toJson()),
      headers: {"Content-Type": "application/json"});
  if (res.statusCode == 200) {
    return res.body;
  } else {
    throw Exception('Failed to post episode');
  }
}

Future<int> registerBehavior(Behavior behavior, String episodeId) async {
  print(Uri.parse('$feedbackApi/episodes/$episodeId/behavior'));
  final res = await http.post(
      Uri.parse('$feedbackApi/episodes/$episodeId/behavior'),
      body: json.encode(behavior.toJson()),
      headers: {"Content-Type": "application/json"});
  if (res.statusCode == 200) {
    return res.statusCode;
  } else {
    throw Exception('Failed to post behavior');
  }
}
