import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginapp/models/add_student_answer_model.dart';
import 'package:loginapp/models/model.dart';
import 'package:loginapp/models/test_add_model.dart';
import 'package:loginapp/models/test_view_model.dart';

class AddStudentAnswerServer {
  Future<AddStudentAnswerModel> addStudentAnswerServer(
      int uid, int testId, int qid, String studentAnswer, int nextqid) async {
    Map<String, String> data = {
      "uid": uid.toString(),
      "testid": testId.toString(),
      "qid": qid.toString(),
      "yourAns": studentAnswer,
      "nextqid": nextqid.toString()
    };
    var data2 = jsonEncode(data);
    print(data2);
    var response = await http.post(
        'http://92414ce1d347.ngrok.io/testenginedemo/addStudentAnswers',
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: data2);
    var jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      print('${response.statusCode}');
      var jsonData = jsonDecode(response.body);
      AddStudentAnswerModel model = AddStudentAnswerModel.fromJson(jsonData);
      print('$jsonData');
      return model;
    } else
      throw "Something Went Wrong ${response.statusCode}";
  }
}
