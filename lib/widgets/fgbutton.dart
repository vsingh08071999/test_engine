import 'package:flutter/material.dart';

class FGButton extends StatelessWidget {
  Color _color;
  String _txt;
  //Future<bool>  fn;
  FGButton(this._txt, this._color);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(5),
      onPressed: () {},
      child: Text(
        _txt,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      color: _color,
    );
  }
}
