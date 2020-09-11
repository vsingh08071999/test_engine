import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/get_all_Questions_By_Test_model.dart';
import 'package:loginapp/models/get_all_test_by_student_model.dart';
import 'package:loginapp/services/getAllQuestionsByTest_server.dart';
import 'package:loginapp/services/getAllTestByStudent_server.dart';

class GetAllQuestionsByTestNotifier extends ChangeNotifier {
  GetAllQuestionsByTestServer _allQuestionsByTestServer =
      new GetAllQuestionsByTestServer();
  GetAllQuestionsByTestModel _getAllQuestionsByTestModel;
  GetAllQuestionsByTestModel get getAllQuestionsByTest =>
      _getAllQuestionsByTestModel;
  Future<void> postQuestionsByTest(int testid) async {
    _getAllQuestionsByTestModel =
        await _allQuestionsByTestServer.getAllQuestionsByTest(testid);
    notifyListeners();
  }
}
