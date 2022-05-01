import 'package:feedback_front/api/feedback_api.dart';
import 'package:feedback_front/models/feedback.dart';
import 'package:flutter/material.dart';


class FeedBackNotifier extends ChangeNotifier {
  final Map<String, Feedbacks> _feedBackMap = {};

  Map<String, Feedbacks> get feedbacks => _feedBackMap;

  void addFeedBacks(Feedbacks feedbacks){
    _feedBackMap['behaviors'] = feedbacks;
    notifyListeners();
  }

  Future<Feedbacks?> byMemberName(String memberName) async {
    return await fetchFeedback(memberName);
  }
}