import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loginapp/models/get_reg_codes_model.dart';

class GetRegCodesServer {
  getRegCode(int gid, var noOfRegCodes) async {
    print("GID id : $gid,  Codes : $noOfRegCodes");
    String url =
        "http://92414ce1d347.ngrok.io/testenginedemo/getRegCodes/$gid/$noOfRegCodes";
    var response = await http.get(url);
    print(response);
    print(response.statusCode);
    var jsonData = jsonDecode(response.body);
    //var jsonData;
    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
      print(jsonData);
      RegCodeModel regCodeModel = RegCodeModel.fromJson(jsonData);
      return regCodeModel;
    }
    throw "Something went wrong";
  }
}
