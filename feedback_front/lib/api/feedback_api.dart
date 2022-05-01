import 'dart:convert';

import 'package:feedback_front/models/feedback.dart';
import 'package:http/http.dart' as http;

const String feedbackApi = String.fromEnvironment('FEEDBACK_ENDPOINT');
Future<Feedbacks> fetchFeedback(String memberName) async {
  final res = await http.get(Uri.parse('$feedbackApi/episodes?memberName=$memberName') );
  if (res.statusCode == 200){
    return Feedbacks.fromJson(jsonDecode(utf8.decode(res.bodyBytes)));
  } else {
    throw Exception('Failed to load feedback');
  }
}
