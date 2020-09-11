import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/get_reg_codes_model.dart';
import 'package:loginapp/services/getRegCodes_server.dart';

class GetRegCodesNotifier extends ChangeNotifier {
  GetRegCodesServer _getRegCodesServer = new GetRegCodesServer();
  RegCodeModel _regCodeModel;
  RegCodeModel get regCodeModel => _regCodeModel;
  Future<void> postRegCode(int gid, var noOfRegCodes) async {
    _regCodeModel = await _getRegCodesServer.getRegCode(gid, noOfRegCodes);
    notifyListeners();
  }
}
