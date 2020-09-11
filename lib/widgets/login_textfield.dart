import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextEditingController usertxt = new TextEditingController();
TextEditingController passwordtxt = new TextEditingController();
bool hidePassword = true;
Container loginTextSection() {
  return Container(
    //padding: EdgeInsets.all(15),
    child: Column(
      children: <Widget>[
        txtUsername("Username", usertxt),
        SizedBox(
          height: 20,
        ),
        txtPassword("Password", passwordtxt),
      ],
    ),
  );
}

Widget txtUsername(String title, control) {
  return TextFormField(
    controller: control,
    validator: (value) {
      if (value.isEmpty) {
        return "Please enter the username";
      } else
        return null;
    },
    style: TextStyle(fontSize: 20, color: Colors.white),
    decoration: InputDecoration(
      errorStyle: TextStyle(color: Colors.red),
      errorBorder: InputBorder.none,
      //enabled: true,
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: Colors.white, width: 1.7)),
      prefixIcon: Icon(
        Icons.person,
        color: Colors.white,
      ),
      fillColor: Colors.black.withOpacity(0.3),
      filled: true,
      border: InputBorder.none,
      hintText: title,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: Colors.white, width: 1.7)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(width: 1.7, color: Colors.white)),
      hintStyle: TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
}

Widget txtPassword(String title, control) {
  return TextFormField(
    obscureText: hidePassword,
    controller: control,
    validator: (value) {
      if (value.isEmpty) {
        return "Please enter the password";
      } else if (value.length < 6) {
        return "Password must be at least 6 character";
      } else
        return null;
    },
    style: TextStyle(fontSize: 20, color: Colors.white),
    decoration: InputDecoration(
      fillColor: Colors.black.withOpacity(0.3),
      filled: true,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: Colors.white, width: 1.7)),
      border: InputBorder.none,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: Colors.white, width: 1.7)),
      prefixIcon: Icon(
        Icons.lock_open,
        color: Colors.white,
      ),
      suffixIcon: IconButton(
        onPressed: () {
          hidePassword = false;
        },
        icon: Icon(
          Icons.remove_red_eye,
          color: Colors.white,
        ),
      ),
      hintText: title,
      hintStyle: TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
}
