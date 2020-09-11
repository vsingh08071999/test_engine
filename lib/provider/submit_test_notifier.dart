import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/submit_test_model.dart';
import 'package:loginapp/services/submit_test_server.dart';

enum SubmitTestStatus { initial, loading, loaded, error }

class SubmitTestNotifier extends ChangeNotifier {
  SubmitTestServer _server = new SubmitTestServer();
  SubmitTestModel _testModel;
  SubmitTestModel get submitTestModel => _testModel;
  String _error;
  String get error => _error;
  SubmitTestStatus _state = SubmitTestStatus.initial;
  SubmitTestStatus get state => _state;
  void _setState(SubmitTestStatus state) {
    _state = state;
    notifyListeners();
  }

  Future<void> submitTest(
      int uid, int testid, int qid, String studentAns) async {
    try {
      _setState(SubmitTestStatus.loading);
      _testModel = await _server.submitTestServer(uid, testid, qid, studentAns);
      _setState(SubmitTestStatus.loaded);
    } catch (e) {
      _error = e.toString();
      _setState(SubmitTestStatus.error);
    }
    notifyListeners();
  }
}
