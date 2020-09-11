import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:loginapp/models/model.dart';
import 'package:loginapp/models/test_view_model.dart';
import 'package:loginapp/provider/view_test_notifier.dart';
import 'package:provider/provider.dart';

class GetAllTest {
  Future<TestModel> getAllTest(int uid) async {
    print('userId id: $uid');
    final url = 'http://92414ce1d347.ngrok.io/testenginedemo/getAllTest/$uid';
    var response = await http.get(url);
    print(response);
    var jsonData;
    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
      //print('Tests are : $jsonData');
      // print("ID is : $id");
      // TestModel testModel = TestModel.fromJson(jsonData);
      return TestModel.fromJson(jsonData);
    } else
      throw 'Something went wrong ${response.statusCode}';
    //return jsonData;
  }

  var id;
  getData(BuildContext context) {
    id = Provider.of<User>(context).uid;
  }
}
