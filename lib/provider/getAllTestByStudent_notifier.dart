import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/get_all_test_by_student_model.dart';
import 'package:loginapp/models/get_reg_codes_model.dart';
import 'package:loginapp/services/getAllTestByStudent_server.dart';
import 'package:loginapp/services/getRegCodes_server.dart';

enum GetAllTestByStudentStatus { initial, loading, loaded, error }

class GetAllTestByStudentNotifier extends ChangeNotifier {
  GetAllTestByStudentServer _getAllTestByStudentServer =
      new GetAllTestByStudentServer();
  GetAllTestByStudentModel _allTestByStudentModel;
  GetAllTestByStudentModel get getAllTest => _allTestByStudentModel;
  String _error;
  String get error => _error;
  GetAllTestByStudentStatus _state = GetAllTestByStudentStatus.initial;
  GetAllTestByStudentStatus get state => _state;
  void _setState(GetAllTestByStudentStatus state) {
    _state = state;
    notifyListeners();
  }

  Future<void> getAllTestByStudent(int uid) async {
    try {
      _setState(GetAllTestByStudentStatus.loading);
      _allTestByStudentModel =
          await _getAllTestByStudentServer.getAllTestByStudent(uid);
      _setState(GetAllTestByStudentStatus.loaded);
    } catch (e) {
      _error = e.toString();
      _setState(GetAllTestByStudentStatus.error);
    }
    notifyListeners();
  }
}
