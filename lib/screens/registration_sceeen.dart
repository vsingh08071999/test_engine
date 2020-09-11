import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/provider/add_registration_notifier.dart';
import 'package:loginapp/screens/loginscreen.dart';
import 'package:loginapp/screens/teachers_dashboard.dart';
import 'package:loginapp/services/add_registration_server.dart';
import 'package:loginapp/widgets/registration_textField.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  getDataFromServer() {
    print('Before Provider');
    RegistrationNotifier registrationNotifier =
        Provider.of<RegistrationNotifier>(context, listen: false);
    registrationNotifier.postRegistration();
    print('Aftr Provider');
  }

  _alertDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Consumer<RegistrationNotifier>(
              builder: (context, registrationNotifier, _) {
                switch (registrationNotifier.state) {
                  case RegistrationStatus.loading:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case RegistrationStatus.loaded:
                    return Text(
                      registrationNotifier.registrationModel.message,
                      style: TextStyle(fontSize: 22),
                    );
                  default:
                    return Center(
                      child: Text(registrationNotifier.error),
                    );
                }
              },
            ),
            title: Text(
              'Register',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginDemo()));
                },
                child: Text('Ok'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          Container(
            width: size.width * 1,
            height: size.height * 1,
            child: Image.asset(
              "images/bgImage.jpg",
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 14),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    registrationTextField(context),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.blue,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              getDataFromServer();
                              _alertDialog(context);
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          splashColor: Colors.grey[200],
                          child: Container(
                            height: 55,
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Register',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginDemo()));
                          },
                          child: Text(
                            "I already have an account",
                            softWrap: true,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
