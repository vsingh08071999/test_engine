import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/group_view_model.dart';
import 'package:loginapp/services/getAllGroups_server.dart';

enum ViewgroupStatusNotifier { initial, loading, loaded, error }

class ViewGroupNotifier extends ChangeNotifier {
  GroupModel _groupModel;
  GetAllGroup _getAllGroup = GetAllGroup();
  GroupModel get groupModel => _groupModel;
  String _error;
  String get error => _error;
  ViewgroupStatusNotifier _state = ViewgroupStatusNotifier.initial;
  ViewgroupStatusNotifier get state => _state;
  void _setState(ViewgroupStatusNotifier state) {
    _state = state;
    notifyListeners();
  }

  Future<void> getGroup(int uid) async {
    try {
      _setState(ViewgroupStatusNotifier.loading);
      _groupModel = await _getAllGroup.getAllGroup(uid);
      _setState(ViewgroupStatusNotifier.loaded);
    } catch (e) {
      _error = e.toString();
      _setState(ViewgroupStatusNotifier.error);
    }
    notifyListeners();
  }

//  ViewGroupNotifier() {
//    _getGroup();
//  }
}
