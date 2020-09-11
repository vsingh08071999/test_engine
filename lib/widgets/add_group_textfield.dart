import 'package:flutter/material.dart';

//TextEditingController uidController = new TextEditingController();
TextEditingController nameController = new TextEditingController();
TextEditingController descController = new TextEditingController();
Container addGroupTextSection() {
  return Container(
    child: Column(
      children: <Widget>[
        //text('Uid', uidController),
        text('Group name', nameController),
        text('Description', descController),
      ],
    ),
  );
}

Widget text(String name, controller) {
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
      onTap: () {},
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
          // hintText: name,
          hintStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200)),
      // maxLines: _line,
    ),
  );
}
