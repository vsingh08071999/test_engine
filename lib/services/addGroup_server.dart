import 'dart:convert';
import 'dart:io';
import '../models/group_add_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:loginapp/models/group_add_model.dart';
import 'package:loginapp/models/group_add_model.dart';
import 'package:loginapp/models/group_add_model.dart';
import 'package:loginapp/models/group_view_model.dart';

class AddGroup {
  //TextEditingController t1;
  TextEditingController t2;
  TextEditingController t3;
  Future<GroupAddModel> addGroup(int uid, t2, t3) async {
    Map<String, dynamic> data = {"uid": uid, "name": t2, "descr": t3};
    var data1 = jsonEncode(data);
    print('Data is : $data1');
    var response = await http.post(
        'http://92414ce1d347.ngrok.io/testenginedemo/addGroup',
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: data1);
    print(response);
    var jsonData;
    print(response.statusCode);
    if (response.statusCode == 200) {
      // print(response.statusCode);
      jsonData = jsonDecode(response.body);
      print('JsonData Is : $jsonData');
      GroupAddModel groupAddModel = GroupAddModel.fromJson(jsonData);
      return GroupAddModel.fromJson(jsonData);
    } else
      throw "Something Went Wrong${response.statusCode}";
  }
}
