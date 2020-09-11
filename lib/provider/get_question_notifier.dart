import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/get_question_model.dart';
import 'package:loginapp/services/getQuestion_server.dart';

enum GetQuestionStatus { initial, loading, loaded, error }

class GetQuestionNotifier extends ChangeNotifier {
  GetQuestionServer _getQuestionServer = new GetQuestionServer();
  GetQuestionModel _getQuestionModel;
  GetQuestionModel get getQuestionModel => _getQuestionModel;
  String _error;
  String get error => _error;
  GetQuestionStatus _state = GetQuestionStatus.initial;
  GetQuestionStatus get state => _state;
  void _setState(GetQuestionStatus state) {
    _state = state;
    notifyListeners();
  }

  Future<void> postQuestion(int qid) async {
    try {
      _setState(GetQuestionStatus.loading);
      _getQuestionModel = await _getQuestionServer.getQuestion(qid);
      _setState(GetQuestionStatus.loaded);
    } catch (e) {
      _error = e.toString();
      _setState(GetQuestionStatus.error);
    }
    notifyListeners();
  }
}
