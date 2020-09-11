import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/submit_test_model.dart';
import 'package:http/http.dart' as http;

class SubmitTestServer {
  Future<SubmitTestModel> submitTestServer(
      int uid, int testid, int qid, String studentAns) async {
    String url = "http://92414ce1d347.ngrok.io/testenginedemo/submitTest";
    Map<String, dynamic> data = {
      "uid": uid,
      "testid": testid,
      "qid": qid,
      "yourAns": studentAns
    };
    var data1 = await jsonEncode(data);
    var response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: data1);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(jsonData);
      SubmitTestModel testModel = SubmitTestModel.fromJson(jsonData);
      return testModel;
    } else
      throw "Something Went Wrong ${response.statusCode}";
  }
}
