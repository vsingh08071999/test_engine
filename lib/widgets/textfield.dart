import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  TextEditingController _txt = TextEditingController();
  String text;
  bool pass;
  TextFields(this._txt, this.pass, this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: _txt,
        obscureText: pass,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
        ),
      ),
    );
  }
}
