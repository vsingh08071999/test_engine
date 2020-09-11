import 'package:flutter/material.dart';
import 'package:loginapp/provider/add_question_notifier.dart';
import 'package:loginapp/provider/teacher_notifier.dart';
import 'package:loginapp/screens/teachers_dashboard.dart';
import 'package:loginapp/widgets/add_question_textField.dart';
import 'package:provider/provider.dart';

class AddQuestion extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  _alertDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            title: Text('Add Question',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            content: Consumer<AddQuestionNotifier>(
              builder: (context, addQuestionNotifier, _) {
                switch (addQuestionNotifier.state) {
                  case AddQuestionStatus.loading:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case AddQuestionStatus.loaded:
                    return Text(
                      addQuestionNotifier.addQuestionModel.message,
                      style: TextStyle(fontSize: 15),
                    );
                  default:
                    return Center(
                      child: Text(addQuestionNotifier.error),
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

  _postDataToServer(context) {
    int uid = Provider.of<TeacherNotifier>(context, listen: false).user.uid;
    Provider.of<AddQuestionNotifier>(context, listen: false).addQuestions(uid);
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Question',
            // user.rights[4].createGroup,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black.withOpacity(0.68),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: _size.height * 1,
                width: _size.width * 1,
                color: Colors.black.withOpacity(0.76),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      addQuestionTextSection1(context),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Answer :',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      //_answerText(context),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      addQuestionTextSection2(context),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          FlatButton(
                            color: Colors.blue,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _postDataToServer(context);
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
                                'Add Question',
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
