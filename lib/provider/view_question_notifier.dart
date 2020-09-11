import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/question_view_model.dart';
import 'package:loginapp/services/getAllQuestionsByUser_server.dart';

//enum ViewQuestionStatusNotifier { initial, loading, loaded, error }

class ViewQuestionNotfier extends ChangeNotifier {
  GetQuestion _getQuestion = GetQuestion();
  QuestionsModel _questionModel;

//  ViewQuestionNotfier() {
//    getQuestions();
//  }
  QuestionsModel get questionModel => _questionModel;
//  String _error;
//  String get error => _error;
//  ViewQuestionStatusNotifier _state = ViewQuestionStatusNotifier.initial;
//  ViewQuestionStatusNotifier get state => _state;
//  void _setState(ViewQuestionStatusNotifier state) {
//    _state = state;
//    notifyListeners();
//  }

  Future<void> getQuestions(int uid) async {
//    try {
//      _setState(ViewQuestionStatusNotifier.loading);
//      _questionModel = await _getQuestion.getQuestion();
//      _setState(ViewQuestionStatusNotifier.loaded);
//    } catch (e) {
//      _error = e.toString();
//      _setState(ViewQuestionStatusNotifier.error);
//    }
    _questionModel = await _getQuestion.getQuestion(uid);
    notifyListeners();
  }
}
