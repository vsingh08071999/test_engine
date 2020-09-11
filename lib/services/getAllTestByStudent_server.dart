import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loginapp/models/get_all_test_by_student_model.dart';
import 'package:loginapp/models/get_reg_codes_model.dart';

class GetAllTestByStudentServer {
  getAllTestByStudent(int uid) async {
    String url =
        "http://92414ce1d347.ngrok.io/testenginedemo/getAllTestByStudent/$uid";
    var response = await http.get(url);
    print(response);
    print(response.statusCode);
    var jsonData = jsonDecode(response.body);
    //var jsonData;
    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
      print(jsonData);
      GetAllTestByStudentModel getAllTest =
          GetAllTestByStudentModel.fromJson(jsonData);
      return getAllTest;
    }
    throw "Something Went Wrong ${response.statusCode}";
  }
}
