import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/add_question_test_model.dart';
import 'package:loginapp/models/add_student_answer_model.dart';
import 'package:loginapp/services/add_questions_to_test_server.dart';
import 'package:loginapp/services/add_student_answer_server.dart';

enum AddStudentAnswerStatus { initial, loading, loaded, error }

class AddStudentAnswertNotifier extends ChangeNotifier {
  AddStudentAnswerServer _studentAnswerServer = new AddStudentAnswerServer();
  AddStudentAnswerModel _addStudentAnswerModel;
  AddStudentAnswerModel get addStudentAnswerModel => _addStudentAnswerModel;
  String _error;
  String get error => _error;
  AddStudentAnswerStatus _state = AddStudentAnswerStatus.initial;
  AddStudentAnswerStatus get state => _state;
  void _setState(AddStudentAnswerStatus state) {
    _state = state;
    notifyListeners();
  }

  Future<void> addStudentAnswerNotifier(
      int uid, int testId, int qid, String studentAnswer, int nextqid) async {
    try {
      _setState(AddStudentAnswerStatus.loading);
      _addStudentAnswerModel = await _studentAnswerServer
          .addStudentAnswerServer(uid, testId, qid, studentAnswer, nextqid);
      _setState(AddStudentAnswerStatus.loaded);
    } catch (e) {
      _error = e.toString();
      _setState(AddStudentAnswerStatus.error);
    }
    notifyListeners();
  }
}
