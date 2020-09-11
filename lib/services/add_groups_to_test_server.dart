import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:loginapp/models/add_group_test_model.dart';

class AddGroupsToTestServer {
  Future<AddGroupTestModel> addGroupsToTest(int testid, List gid) async {
    String url = "http://92414ce1d347.ngrok.io/testenginedemo/addGroupTest";
    Map<String, dynamic> map = {"testid": testid, "gIds": gid};
    var data = jsonEncode(map);
    print("Map Data is: $data");
    var response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: data);
    print(response.statusCode);
    var jsonData;
    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
      print("JsonData is : $jsonData");
      return AddGroupTestModel.fromJson(jsonData);
    } else
      throw "Something Went Wrong ${response.statusCode}";
  }
}
