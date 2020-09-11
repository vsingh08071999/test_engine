import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/test_add_model.dart';
import 'package:loginapp/models/test_view_model.dart';
import 'package:loginapp/services/create_test_server.dart';
import 'package:loginapp/widgets/create_test_textField.dart';

enum CreateTestStatus { initial, loading, loaded, error }

class CreateTestNotifier extends ChangeNotifier {
  CreateTestServer _createTestServer = new CreateTestServer();
  TestAddModel _testAddModel;
  TestAddModel get testAddModel => _testAddModel;
  String _error;
  String get error => _error;
  CreateTestStatus _state = CreateTestStatus.initial;
  CreateTestStatus get state => _state;
  void _setState(CreateTestStatus state) {
    _state = state;
    notifyListeners();
  }

  Future<TestAddModel> createTests(int uid, String userid) async {
    try {
      _setState(CreateTestStatus.loading);
      _testAddModel = await _createTestServer.createTest(
          name.text,
          desc.text,
          attempts.text,
          duration.text,
          score.text,
          //createdBy.text,
          userid,
          uid
//        uid.text
          );
      _setState(CreateTestStatus.loaded);
    } catch (e) {
      _error = e.toString();
      _setState(CreateTestStatus.error);
    }
    notifyListeners();
  }
//  CreateTestNotifier() {
//    createTests();
//  }
}
