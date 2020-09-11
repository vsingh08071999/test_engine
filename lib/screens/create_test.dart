import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/models/model.dart';
import 'package:loginapp/provider/create_test_notifier.dart';
import 'package:loginapp/provider/teacher_notifier.dart';
import 'package:loginapp/provider/view_test_notifier.dart';
import 'package:loginapp/screens/teachers_dashboard.dart';
import 'package:loginapp/widgets/create_test_textField.dart';
import 'package:provider/provider.dart';
import '../services/create_test_server.dart';

class CreateTest extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  _alertDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            title: Text('Test Create',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            content: Consumer<CreateTestNotifier>(
              builder: (context, createTest, _) {
                switch (createTest.state) {
                  case CreateTestStatus.loading:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case CreateTestStatus.loaded:
                    return Text(
                      createTest.testAddModel.message,
                      style: TextStyle(fontSize: 15),
                    );
                  default:
                    return Center(
                      child: Text(createTest.error),
                    );
                }
              },
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (Context) => TeacherDashBoard()));
                },
              )
            ],
          );
        });
  }

  _getDataFromServer(context) {
    int uid = Provider.of<TeacherNotifier>(context, listen: false).user.uid;
    String userid =
        Provider.of<TeacherNotifier>(context, listen: false).user.userid;
    Provider.of<CreateTestNotifier>(context, listen: false)
        .createTests(uid, userid);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: (AppBar(
          title: Text(
            "Create Test",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black.withOpacity(0.68),
        )),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: size.height * 1,
                width: size.width * 1,
                color: Colors.black.withOpacity(0.76),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      createTestTextSection(context),
                      SizedBox(
                        height: 9,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          FlatButton(
                            color: Colors.blue,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _getDataFromServer(context);
                                _alertDialog(context);
                              }
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            splashColor: Colors.grey[200],
                            child: Container(
                              height: 55,
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'Create Test',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
