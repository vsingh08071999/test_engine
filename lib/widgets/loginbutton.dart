import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  Color _color;
  Function fn;
  LoginButton(this._color, this.fn);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: FlatButton(
        padding: EdgeInsets.all(5),
        onPressed: fn,
        splashColor: Colors.black38,
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        color: _color,
      ),
    );
  }
}
