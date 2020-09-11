import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:loginapp/models/model.dart';

class Server {
  //var jsonData;
  TextEditingController t1;
  TextEditingController t2;
  Future<User> signIn(t1, t2) async {
    //String url = 'http://192.168.0.105:8080/testenginedemo/login';
    Map<String, String> data = {"userid": t1, "password": t2};
    var data2 = jsonEncode(data);
    print('data is $data2');
    var response = await http.post(
        'http://92414ce1d347.ngrok.io/testenginedemo/login',
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: data2);
    var jsonData = json.decode(response.body);
    print(jsonData);
    if (response.statusCode == 200) {
      print('${response.statusCode}');
      var jsonData = json.decode(response.body);
      User user = new User.fromJson(jsonData);
      return User.fromJson(jsonData);
    } else
      throw "Something Went Wrong ${response.statusCode}";
  }
}
