import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/registration_model.dart';
import 'package:loginapp/provider/add_registration_notifier.dart';

class AddRegistrationServer {
  TextEditingController t1;
  TextEditingController t2;
  TextEditingController t3;
  TextEditingController t4;
  TextEditingController t5;
  TextEditingController t6;
  TextEditingController t7;
  TextEditingController t8;
  Future<RegistraionModel> getRegistration(
      t1, t2, t3, t4, t5, t6, t7, t8) async {
    Map<String, dynamic> data = {
      "userid": t1,
      "password": t2,
      "name": t3,
      "address": t4,
      "phone": t5,
      "email": t6,
      "role": t7,
      "regcode": t8,
    };
    var data1 = jsonEncode(data);
    print(data1);
    String url = "http://92414ce1d347.ngrok.io/testenginedemo/register";
    var response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: data1);
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(response.statusCode);
      //RegistraionModel registraionModel = RegistraionModel.fromJson(jsonData);
      print(jsonData);
      return RegistraionModel.fromJson(jsonData);
    } else
      throw "Something Went Wrong ${response.statusCode}";
  }
}
