import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:loginapp/models/add_question_test_model.dart';

class AddQuestionsToTestServer {
  Future<AddQuestionTestModel> addQuestionsToTest(
      int testid, List questionid) async {
    String url =
        "http://92414ce1d347.ngrok.io/testenginedemo/addQuestionsToTest";
    Map<String, dynamic> map = {"testid": testid, "questionids": questionid};
    var data = jsonEncode(map);
    print("Map Data is : $data");
    var response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: data);
    print(response.statusCode);
    var jsonData;
    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
      AddQuestionTestModel addQuestionTestModel =
          AddQuestionTestModel.fromJson(jsonData);
      print("JsonData is: $jsonData");
      return AddQuestionTestModel.fromJson(jsonData);
    } else
      throw "Something Went Wrong ${response.statusCode}";
  }
}
