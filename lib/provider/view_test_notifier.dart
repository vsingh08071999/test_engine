import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/test_view_model.dart';
import 'package:loginapp/services/getAllTest_server.dart';

enum ViewTestStatusNotifier { initial, loading, loaded, error }

class UserNotifier extends ChangeNotifier {
  GetAllTest _getAllTest = GetAllTest();
  TestModel _testModel;
  TestModel get testModel => _testModel;
  String _error;
  String get error => _error;
  ViewTestStatusNotifier _state = ViewTestStatusNotifier.initial;
  ViewTestStatusNotifier get state => _state;
  void _setState(ViewTestStatusNotifier state) {
    _state = state;
    notifyListeners();
  }

//  UserNotifier() {
//    _getTest();
//  }
  Future<void> getTest(int uid) async {
    try {
      _setState(ViewTestStatusNotifier.loading);
      _testModel = await _getAllTest.getAllTest(uid);
      _setState(ViewTestStatusNotifier.loaded);
    } catch (e) {
      _error = e.toString();
      _setState(ViewTestStatusNotifier.error);
    }
    notifyListeners();
  }
}
