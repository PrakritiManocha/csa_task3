import 'package:flutter/material.dart';

class LikedQuestionsProvider with ChangeNotifier {
  List<String> _likedQuestions = [];

  List<String> get likedQuestions => _likedQuestions;

  void addLikedQuestion(String question) {
    if (!_likedQuestions.contains(question)) {
      _likedQuestions.add(question);
      notifyListeners(); 
    }
  }
}
