import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/group_view_model.dart';
import 'package:loginapp/screens/create_group.dart';
import 'package:loginapp/services/addGroup_server.dart';
import 'package:loginapp/widgets/add_group_textfield.dart';
import '../models/group_add_model.dart';

enum AddGroupStatus { initial, loading, loaded, error }

class AddGroupNotifier extends ChangeNotifier {
  GroupAddModel _groupAddModel;
  AddGroup _addGroup = new AddGroup();
  GroupAddModel get groupAddModel => _groupAddModel;

  String _error;
  String get error => _error;
  AddGroupStatus _state = AddGroupStatus.initial;
  AddGroupStatus get state => _state;
  void _setState(AddGroupStatus state) {
    _state = state;
    notifyListeners();
  }

  Future<GroupAddModel> postGroup(int uid) async {
    try {
      _setState(AddGroupStatus.loading);
      _groupAddModel = await _addGroup.addGroup(
          //uidController.text,
          uid,
          nameController.text,
          descController.text);
      _setState(AddGroupStatus.loaded);
    } catch (e) {
      _error = e.toString();
      _setState(AddGroupStatus.error);
    }
    notifyListeners();
  }

//  AddGroupNotifier() {
//    postGroup();
//  }
}
