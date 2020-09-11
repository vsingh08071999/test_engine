import 'package:flutter/cupertino.dart';
import 'package:loginapp/services/server.dart';
import 'package:loginapp/widgets/login_textfield.dart';
import '../models/model.dart';

enum TeacherStatusNotifier { initial, loading, loaded, error }

class TeacherNotifier extends ChangeNotifier {
  User _user;
  Server _server = new Server();
  User get user => _user;
  String _error;
  String get error => _error;
  TeacherStatusNotifier _state = TeacherStatusNotifier.initial;
  TeacherStatusNotifier get state => _state;
  void _setState(TeacherStatusNotifier state) // it  is normal function
  {
    _state = state;
    notifyListeners();
  }

  Future<User> postTeacher() async {
    try {
      _setState(TeacherStatusNotifier.loading);
      _user = await _server.signIn(usertxt.text, passwordtxt.text);
      _setState(TeacherStatusNotifier.loaded);
    } catch (e) {
      _error = e.toString();
      _setState(TeacherStatusNotifier.error);
    }
    notifyListeners();
  }

//  TeacherNotifier() {
//    postTeacher();
//  }
}
