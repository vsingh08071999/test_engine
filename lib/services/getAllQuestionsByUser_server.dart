import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginapp/models/question_view_model.dart';
import 'package:loginapp/provider/view_question_notifier.dart';
import 'package:loginapp/screens/teachers_dashboard.dart';

class GetQuestion {
  Future<QuestionsModel> getQuestion(int uid) async {
    print("userID Is : $uid");
    String url =
        'http://92414ce1d347.ngrok.io/testenginedemo/getAllQuestionsByUser/$uid';
    var response = await http.get(url);
    print(response);
    var jsonData;
    if (response.statusCode == 200) {
      print(response.statusCode);
      jsonData = json.decode(response.body);
      //  print('Questions are : $jsonData');
      // QuestionsModel questionModel = QuestionsModel.fromJson(jsonData);
      return QuestionsModel.fromJson(jsonData);
    }
//    else
//      throw "Something Went Wrong ${response.statusCode}";
  }
}
