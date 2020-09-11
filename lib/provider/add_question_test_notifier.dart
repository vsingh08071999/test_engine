import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/add_question_test_model.dart';
import 'package:loginapp/services/add_questions_to_test_server.dart';

enum AddQuestionToTestStatus { initial, loading, loaded, error }

class AddQuestionToTestNotifier extends ChangeNotifier {
  AddQuestionsToTestServer _addQuestionsToTestServer =
      new AddQuestionsToTestServer();
  AddQuestionTestModel _addQuestionTestModel;
  AddQuestionTestModel get addQuestionTestModel => _addQuestionTestModel;
  String _error;
  String get error => _error;
  AddQuestionToTestStatus _state = AddQuestionToTestStatus.initial;
  AddQuestionToTestStatus get state => _state;
  void _setState(AddQuestionToTestStatus state) {
    _state = state;
    notifyListeners();
  }

  Future<void> addQuestionTestNotifier(int testid, List qid) async {
    try {
      _setState(AddQuestionToTestStatus.loading);
      _addQuestionTestModel =
          await _addQuestionsToTestServer.addQuestionsToTest(testid, qid);
      _setState(AddQuestionToTestStatus.loaded);
    } catch (e) {
      _error = e.toString();
      _setState(AddQuestionToTestStatus.error);
    }
    notifyListeners();
  }
}
