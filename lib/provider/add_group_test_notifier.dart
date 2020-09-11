import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/add_group_test_model.dart';
import 'package:loginapp/services/add_groups_to_test_server.dart';

enum AddGroupToTestStatus { initial, loading, loaded, error }

class AddGroupTestNotifier extends ChangeNotifier {
  AddGroupsToTestServer _addGroupsToTestServer = new AddGroupsToTestServer();
  AddGroupTestModel _addGroupTestModel;
  AddGroupTestModel get addGroupTestModel => _addGroupTestModel;
  String _error;
  String get error => _error;
  AddGroupToTestStatus _state = AddGroupToTestStatus.initial;
  AddGroupToTestStatus get state => _state;
  void _setState(AddGroupToTestStatus state) {
    _state = state;
    notifyListeners();
  }

  Future<void> addGroupTestNotifier(int testid, List qid) async {
    try {
      _setState(AddGroupToTestStatus.loading);
      _addGroupTestModel =
          await _addGroupsToTestServer.addGroupsToTest(testid, qid);
      _setState(AddGroupToTestStatus.loaded);
    } catch (e) {
      _error = e.toString();
      _setState(AddGroupToTestStatus.error);
    }
    notifyListeners();
  }
}
