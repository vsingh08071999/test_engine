import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loginapp/models/get_all_Questions_By_Test_model.dart';

class GetAllQuestionsByTestServer {
  getAllQuestionsByTest(int testid) async {
    print("testid Is : $testid");
    String url =
        'http://92414ce1d347.ngrok.io/testenginedemo/getAllQuestionsByTest/$testid';
    var response = await http.get(url);
    print(response);
    var jsonData;
    if (response.statusCode == 200) {
      print(response.statusCode);
      jsonData = json.decode(response.body);
      print('Questions are : $jsonData');
      // QuestionsModel questionModel = QuestionsModel.fromJson(jsonData);
      return GetAllQuestionsByTestModel.fromJson(jsonData);
    } else
      throw "Something Went Wrong ${response.statusCode}";
  }
}
