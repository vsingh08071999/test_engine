import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loginapp/models/get_question_model.dart';

class GetQuestionServer {
  getQuestion(int qid) async {
    String url = "http://92414ce1d347.ngrok.io/testenginedemo/getQuestion/$qid";
    var response = await http.get(url);
    print(response);
    print(response.statusCode);
    var jsonData = jsonDecode(response.body);
    //var jsonData;
    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
      print(jsonData);
      GetQuestionModel getQuestionModel = GetQuestionModel.fromJson(jsonData);
      return getQuestionModel;
    } else
      throw "Something Went Wrong ${response.statusCode}";
  }
}
