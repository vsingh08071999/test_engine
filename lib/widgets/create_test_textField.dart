import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextEditingController name = new TextEditingController();
TextEditingController desc = new TextEditingController();
TextEditingController attempts = new TextEditingController();
TextEditingController duration = new TextEditingController();
TextEditingController score = new TextEditingController();
//TextEditingController createdBy = new TextEditingController();
//TextEditingController uid = new TextEditingController();
Container createTestTextSection(context) {
  return Container(
    child: Column(
      children: <Widget>[
        text('Test name', context, name),
        text('Description', context, desc),
        numberText('No. of Attempts', context, attempts),
        numberText('Duration', context, duration),
        numberText('Passing Score', context, score),
        //text('Created by', context, createdBy),
        //      text('Uid', context, uid),
      ],
    ),
  );
}

Widget text(String name, context, controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: TextFormField(
      controller: controller,
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter the value";
        } else
          return null;
      },
      textAlign: TextAlign.left,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
      decoration: InputDecoration(
          labelText: name,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
          filled: true,
          fillColor: Colors.black.withOpacity(0.3),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white, width: 1.7)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white, width: 1.7)),
          //hintText: name,
          hintStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200)),
    ),
  );
}

Widget numberText(String name, context, controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: TextFormField(
      controller: controller,
      validator: (value) {
        if (value.isEmpty) {
          return "This field can't be empty";
        } else
          return null;
      },
      textAlign: TextAlign.left,
      keyboardType: TextInputType.number,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
      decoration: InputDecoration(
          labelText: name,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
          filled: true,
          fillColor: Colors.black.withOpacity(0.3),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white, width: 1.7)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white, width: 1.7)),
          //hintText: name,
          hintStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200)),
    ),
  );
}
