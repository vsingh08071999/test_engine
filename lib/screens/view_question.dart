import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loginapp/models/model.dart';
import 'package:loginapp/models/question_view_model.dart';
import 'package:loginapp/provider/view_question_notifier.dart';
import 'package:provider/provider.dart';

class ViewQuestion extends StatefulWidget {
  @override
  _ViewQuestionState createState() => _ViewQuestionState();
}

class _ViewQuestionState extends State<ViewQuestion> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black.withOpacity(0.65),
          elevation: 5,
          title: Text(
            'View Question',
            // user.rights[18].createTest,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: _size.height * 1,
              width: _size.width * 1,
              color: Colors.black.withOpacity(0.8),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<ViewQuestionNotfier>(
                  builder: (context, viewQuestionNotfier, _) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        elevation: 8,
                        color: Colors.white.withOpacity(0.2),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Q : ",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  Expanded(
                                    child: Text(
                                      viewQuestionNotfier
                                          .questionModel.questions[index].name,
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ListView.builder(
                                itemBuilder: (context, i) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        '${viewQuestionNotfier.questionModel.questions[index].answers[i].name}. ',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                      Expanded(
                                        child: Text(
                                          viewQuestionNotfier
                                              .questionModel
                                              .questions[index]
                                              .answers[i]
                                              .descr,
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: viewQuestionNotfier.questionModel
                                    .questions[index].answers.length,
                              )
                            ],
                          ),
                        ));
                  },
                  itemCount: viewQuestionNotfier.questionModel.questions.length,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
