import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginapp/models/model.dart';
import 'package:loginapp/models/test_add_model.dart';
import 'package:loginapp/models/test_view_model.dart';

class CreateTestServer {
  User user;
  //var id = user.uid;
  //static var id = user.uid;
  TextEditingController t1;
  TextEditingController t2;
  TextEditingController t3;
  TextEditingController t4;
  TextEditingController t5;
  //TextEditingController t6;
  //TextEditingController t7;
  var jsonData;
  Future<TestAddModel> createTest(
      t1, t2, t3, t4, t5, String userid, int uid) async {
    Map<String, String> data = {
      "name": t1,
      "descr": t2,
      "noOfAttempts": t3,
      "duration": t4,
      "passingScore": t5,
      "createdBy": userid,
      "uid": uid.toString()
    };
    var data2 = jsonEncode(data);
    print(data2);
    var response = await http.post(
        'http://92414ce1d347.ngrok.io/testenginedemo/addtest',
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: data2);
    var jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      print('${response.statusCode}');
      var jsonData = jsonDecode(response.body);
      TestAddModel testAddModel = TestAddModel.fromJson(jsonData);
      print('$jsonData');
      return TestAddModel.fromJson(jsonData);
    } else
      throw "Something Went Wrong ${response.statusCode}";
  }
}
