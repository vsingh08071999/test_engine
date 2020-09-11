import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/add_question_model.dart';
import 'package:loginapp/models/question_view_model.dart';

class AddQuestionServer {
  TextEditingController t1;
  TextEditingController t2;
  TextEditingController t3;
  TextEditingController t4;
  TextEditingController t5;
  TextEditingController t6;
  TextEditingController t7;
  TextEditingController t8;
  TextEditingController t9;
  TextEditingController t10;
  TextEditingController t11;
  TextEditingController t12;
  TextEditingController t13;
  TextEditingController t14;
  TextEditingController t15;
  Future<AddQuestionModel> addQuestion(int uid, t2, t3, t4, t5, t6, t7, t8, t9,
      t10, t11, t12, t13, t14, t15) async {
    Map<String, dynamic> data = {
      "uid": uid,
      "name": t2,
      "score": t3,
      "answers": [
        {"name": t4, "descr": t5, "rightAns": t6},
        {"name": t7, "descr": t8, "rightAns": t9},
        {"name": t10, "descr": t11, "rightAns": t12},
        {"name": t13, "descr": t14, "rightAns": t15}
      ]
    };
    var data1 = jsonEncode(data);
    print(data1);
    var response = await http.post(
        'http://92414ce1d347.ngrok.io/testenginedemo/addquestion',
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: data1);
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      AddQuestionModel addQuestionModel = AddQuestionModel.fromJson(jsonData);
      print(response.statusCode);
      print(jsonData);
      return AddQuestionModel.fromJson(jsonData);
    } else
      throw " Something Went Wrong ${response.statusCode}";
  }
}
