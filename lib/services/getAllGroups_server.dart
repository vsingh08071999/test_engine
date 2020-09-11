import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginapp/models/group_view_model.dart';

class GetAllGroup {
  Future<GroupModel> getAllGroup(int uid) async {
    print("userId is : $uid");
    final url = 'http://92414ce1d347.ngrok.io/testenginedemo/getAllGroups/$uid';
    var response = await http.get(url);
    print(response);
    var jsonData;
    if (response.statusCode == 200) {
      print(response.statusCode);
      jsonData = jsonDecode(response.body);
      //  print('Groups are : $jsonData');
      GroupModel groupModel = GroupModel.fromJson(jsonData);
      return GroupModel.fromJson(jsonData);
    } else
      throw "Something Went Wrong ${response.statusCode}";
  }
}
