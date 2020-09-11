import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'dart:convert' as json;
import 'package:flutter/material.dart';
import 'package:loginapp/provider/add_student_answer_notifier.dart';
import 'package:loginapp/provider/getAllQuestionsByTest_notifier.dart';
import 'package:loginapp/provider/get_question_notifier.dart';
import 'package:loginapp/provider/submit_test_notifier.dart';
import 'package:loginapp/provider/teacher_notifier.dart';
import 'package:provider/provider.dart';

import 'student_score.dart';

class QuestionScreen extends StatefulWidget {
  int testId;
  QuestionScreen({this.testId});
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  Timer _timer;
  var _start = 30;
  int questionid;
  int nextqid;
  int studentUid;
  String studentAnswer;
  int index = 0;
  int counter = 0;
  getIds() {
    studentUid = Provider.of<TeacherNotifier>(context, listen: false).user.uid;
    print("studentId : $studentUid");
    var qidLength =
        Provider.of<GetAllQuestionsByTestNotifier>(context, listen: false)
            .getAllQuestionsByTest
            .questions
            .length;
    if (index < qidLength) {
      questionid =
          Provider.of<GetAllQuestionsByTestNotifier>(context, listen: false)
              .getAllQuestionsByTest
              .questions[index]
              .qid;
      nextqid =
          Provider.of<GetAllQuestionsByTestNotifier>(context, listen: false)
              .getAllQuestionsByTest
              .questions[index + 1]
              .qid;
      print("QuestionID : $questionid");
      print("nextId  : $nextqid");
      index++;
      print("index value : $index");
    }
  }

  _getNextQuestionFromServer() async {
    getIds();
    await Provider.of<AddStudentAnswertNotifier>(context, listen: false)
        .addStudentAnswerNotifier(
            studentUid, widget.testId, questionid, studentAnswer, nextqid);
  }

  _alertDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            title: Text('Submit Answers',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            content: Consumer<SubmitTestNotifier>(
              builder: (context, submitTestNotifier, _) {
                switch (submitTestNotifier.state) {
                  case SubmitTestStatus.loading:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case SubmitTestStatus.loaded:
                    return Text(
                      submitTestNotifier.submitTestModel.message,
                      style: TextStyle(fontSize: 15),
                    );
                  default:
                    return Center(
                      child: Text(submitTestNotifier.error),
                    );
                }
              },
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (Context) => StudentScore()));
                },
              )
            ],
          );
        });
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (Timer _timer) {
      setState(() {
        if (_start < 1) {
          _timer.cancel();
          _nextQuestion();
          _previousQuestion();
        } else {
          return _start = _start - 1;
        }
      });
    });
  }

  var qidLength;
  int singleQid;
  List qid;
  _getQidsFromQuestions() {
    qidLength =
        Provider.of<GetAllQuestionsByTestNotifier>(context, listen: false)
            .getAllQuestionsByTest
            .listQid
            .length;
    print("listQid length is :$qidLength");
    print(
        "listQid : ${Provider.of<GetAllQuestionsByTestNotifier>(context, listen: false).getAllQuestionsByTest.listQid}");
    qid = Provider.of<GetAllQuestionsByTestNotifier>(context, listen: false)
        .getAllQuestionsByTest
        .listQid;
    singleQid = qid[0];
    print("SingleQid : $singleQid");
    _getDataFromServer();
  }

//  int j = 0;
//  _nextQ() {
//    setState(() {
//      if (j < qidLength) {
//        singleQid = qid[j];
//        j++;
//        print("singleQid : $singleQid");
//      } else
//        throw "Good Luck";
//    });
//  }

  _getDataFromServer() {
    //_nextQ();
    Provider.of<GetQuestionNotifier>(context, listen: false)
        .postQuestion(singleQid);
  }

  _submitTest() {
    Provider.of<SubmitTestNotifier>(context, listen: false)
        .submitTest(studentUid, widget.testId, questionid, studentAnswer);
  }

  @override
  initState() {
    super.initState();
    _getQidsFromQuestions();
//    getIDs();
    //_getDataFromServer();
    //startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  _getUpperContainer() {
    return Container(
      padding: EdgeInsets.all(13),
      height: MediaQuery.of(context).size.height * 0.14,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(13),
              bottomLeft: Radius.circular(13)),
          color: Colors.orangeAccent),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.arrow_left,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.70,
              ),
              Icon(
                Icons.forward,
                color: Colors.white,
                size: 22,
              ),
              SizedBox(
                width: 7,
              ),
              Icon(
                Icons.bookmark,
                color: Colors.white,
                size: 22,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 30),
            child: Row(
              children: <Widget>[
                Text(
                  'Question No. ',
                  softWrap: true,
                  style: TextStyle(color: Colors.white, fontSize: 23),
                ),
                Text(
                  "${Provider.of<GetAllQuestionsByTestNotifier>(context, listen: false).getAllQuestionsByTest.message}",
                  // '0$i',
                  softWrap: true,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                ),
                Text(
                  '$_start',
                  softWrap: true,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  ' (TIME LEFT)',
                  softWrap: true,
                  style: TextStyle(color: Colors.white, fontSize: 11),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _getLowerContainer() {
    return DraggableScrollableSheet(
      maxChildSize: 1,
      minChildSize: 0.25,
      //initialChildSize: 0,
      builder: (context, myController) {
        return ListView(
          controller: myController,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13),
                    topRight: Radius.circular(13)),
                color: Color(0xFF2d228d),
              ),
              padding: EdgeInsets.only(left: 10, bottom: 5, right: 10, top: 5),
              height: MediaQuery.of(context).size.height * 34.0,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 180, right: 180, bottom: 0),
                    height: 20,
                    width: MediaQuery.of(context).size.width,
                    child: CustomPaint(
                      //size: Size(0.5,100),
                      painter: MyPainter(),
                    ),
                  ),
                  Text(
                    'Questions List',
                    softWrap: true,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
//                SizedBox(
//                  height: MediaQuery.of(context).size.height * 0.20,
//                ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(7, 15, 7, 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 6,
                        child: GridView.count(
                            crossAxisCount: 8,
                            children: List.generate(40, (index) {
                              return FittedBox(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: FlatButton(
                                    //shape: Border.all(style: BorderStyle.solid),
                                    onPressed: () {},
                                    color: Colors.white,
                                    child: Text(
                                      '$index',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              );
                            })),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.15,
                      ),
                      RaisedButton(
                        color: Colors.orangeAccent,
                        onPressed: () {
                          _previousQuestion();
                          setState(() {
                            startTimer();
                          });
                        },
                        child: Text(
                          'PREVIUOS',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            decorationStyle: TextDecorationStyle.solid,
                          ),
                        ),
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                        splashColor: Color(0xFF2d228d),
                        highlightColor: Color(0xFF2d228d),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                      ),
                      RaisedButton(
                        color: Colors.orangeAccent,
                        onPressed: () {
                          _nextQuestion();
                          setState(() {
                            startTimer();
                          });
                        },
                        child: Text(
                          'NEXT',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            decorationStyle: TextDecorationStyle.solid,
                          ),
                        ),
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                        splashColor: Color(0xFF2d228d),
                        highlightColor: Color(0xFF2d228d),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  int i = 1;
  _nextQuestion() {
    _start = 30;
    setState(() {
      if (i < 10) {
        i++;
      } else {
        return 0;
      }
    });
  }

  _previousQuestion() {
    _start = 30;
    setState(() {
      if (i < 10) {
        i--;
      } else {
        return 0;
      }
    });
  }

  _getMidContainer() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.48,
      child: FutureBuilder(
        builder: (context, asyncSnapShot) {
          List myData = json.jsonDecode(asyncSnapShot.data.toString());
          if (myData == null) {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              height: MediaQuery.of(context).size.height * 0.48,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                        //alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 20, top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Q$i. ',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w700),
                            ),
                            Text(
                                //"${Provider.of<GetQuestionNotifier>(context).getQuestionModel.name}",
                                myData[0][i.toString()],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500))
                          ],
                        )),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                //"${widget.qidList}",
                                myData[1][i.toString()]['a'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                                maxLines: 2,
                              ),
                              color: Colors.orangeAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              splashColor: Color(0xFF2d228d),
                              highlightColor: Color(0xFF2d228d),
                              minWidth: 200,
                              height: 46,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                myData[1][i.toString()]['b'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                                maxLines: 2,
                              ),
                              color: Colors.orangeAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              splashColor: Color(0xFF2d228d),
                              highlightColor: Color(0xFF2d228d),
                              minWidth: 200,
                              height: 46,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                myData[1][i.toString()]['c'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                                maxLines: 2,
                              ),
                              color: Colors.orangeAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              splashColor: Color(0xFF2d228d),
                              highlightColor: Color(0xFF2d228d),
                              minWidth: 200,
                              height: 46,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                myData[1][i.toString()]['d'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                                maxLines: 2,
                              ),
                              color: Colors.orangeAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              splashColor: Color(0xFF2d228d),
                              highlightColor: Color(0xFF2d228d),
                              minWidth: 200,
                              height: 46,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        },
        future: DefaultAssetBundle.of(context)
            .loadString('question_json/question.json'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: size.height * 1,
              width: size.width * 1,
              color: Colors.black.withOpacity(0.76),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Good Luck!",
                      style: TextStyle(
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          color: Colors.lightBlue),
                    ),
                  ),
                  //_getUpperContainer(),
                  // _midCon(),
//              _getMidContainer(),
//              _getMidContainer(),
//              Expanded(
//                child: _getLowerContainer(),
//              ),
//              Text(
//                  "${Provider.of<GetAllQuestionsByTestNotifier>(context).getAllQuestionsByTest.listQid}"),
                  counter == 0
                      ? Consumer<GetQuestionNotifier>(
                          builder: (context, getQuestionNotifier, _) {
                            switch (getQuestionNotifier.state) {
                              case GetQuestionStatus.loading:
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              case GetQuestionStatus.loaded:
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.45,
                                  // padding: EdgeInsets.only(left: 10, top: 10),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    elevation: 8,
                                    color: Colors.white.withOpacity(0.2),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, top: 15),
                                          child: Text(
                                            getQuestionNotifier
                                                .getQuestionModel.name,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                        ),
//                          Row(
//                            children: <Widget>[
//                              Text(
//                                "Q : ",
//                                style: TextStyle(
//                                    fontSize: 25, fontWeight: FontWeight.w700),
//                              ),
//                              Expanded(
//                                child: Text(
//                                  getQuestionNotifier.getQuestionModel.name,
//                                  style: TextStyle(
//                                      fontSize: 25,
//                                      fontWeight: FontWeight.w500),
//                                ),
//                              ),
//                            ],
//                          ),
//                          SizedBox(
//                            height: 10,
//                          ),
                                        ListView.builder(
                                          itemBuilder: (context, index) {
                                            String descr = getQuestionNotifier
                                                .getQuestionModel
                                                .answers[index]
                                                .descr;
                                            radioGroupValue(val) {
                                              setState(() {
                                                descr = val;
                                              });
                                            }

                                            return Row(
                                              children: <Widget>[
                                                Radio(
                                                  value: descr,
                                                  groupValue: radioGroupValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      studentAnswer = value;
                                                      print(
                                                          "student answer : $studentAnswer");
                                                    });
                                                    print(value);
                                                  },
                                                  activeColor: Colors.blue,
                                                  autofocus: true,
                                                  focusColor: Colors.blue,
                                                  hoverColor: Colors.blue,
                                                ),
                                                Text(
                                                  getQuestionNotifier
                                                      .getQuestionModel
                                                      .answers[index]
                                                      .descr,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                )
                                              ],
                                            );
//                                  RadioListTile(
//                                  title: Text(getQuestionNotifier
//                                      .getQuestionModel.answers[index].descr),
//                                  onChanged: (value) {
//                                    print(value);
//                                  },
//                                  value: rightAns,
//                                  groupValue: radioGroupValue,
//                                  activeColor: Colors.blue,
//                                  selected: false,
//                                );
//                                Row(
//                                mainAxisAlignment:
//                                    MainAxisAlignment.spaceBetween,
//                                children: <Widget>[
//                                  Text(
//                                    '${getQuestionNotifier.getQuestionModel.answers[index].name}. ',
//                                    style: TextStyle(
//                                        fontSize: 24,
//                                        fontWeight: FontWeight.w700),
//                                  ),
//                                  Expanded(
//                                    child: Text(
//                                      getQuestionNotifier.getQuestionModel
//                                          .answers[index].descr,
//                                      style: TextStyle(
//                                          fontSize: 24,
//                                          fontWeight: FontWeight.w400),
//                                    ),
//                                  ),
//                                ],
//                              );
                                          },
                                          //physics: NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: getQuestionNotifier
                                              .getQuestionModel.answers.length,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              default:
                                return Center(
                                  child: Text(getQuestionNotifier.error),
                                );
                            }
                          },
                        )
                      : Column(
                          children: <Widget>[
                            Consumer<AddStudentAnswertNotifier>(
                              builder: (context, addStudentAnswerNotifier, _) {
                                switch (addStudentAnswerNotifier.state) {
                                  case AddStudentAnswerStatus.loading:
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  case AddStudentAnswerStatus.loaded:
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.45,
                                      // padding: EdgeInsets.only(left: 10, top: 10),
                                      child: Card(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 5),
                                        shape: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        color: Colors.white.withOpacity(0.2),
                                        elevation: 8,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15, top: 15),
                                              child: Text(
                                                addStudentAnswerNotifier
                                                    .addStudentAnswerModel.name,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                              ),
                                            ),
//                          Row(
//                            children: <Widget>[
//                              Text(
//                                "Q : ",
//                                style: TextStyle(
//                                    fontSize: 25, fontWeight: FontWeight.w700),
//                              ),
//                              Expanded(
//                                child: Text(
//                                  getQuestionNotifier.getQuestionModel.name,
//                                  style: TextStyle(
//                                      fontSize: 25,
//                                      fontWeight: FontWeight.w500),
//                                ),
//                              ),
//                            ],
//                          ),
//                          SizedBox(
//                            height: 10,
//                          ),
                                            ListView.builder(
                                              itemBuilder: (context, index) {
                                                String descr =
                                                    addStudentAnswerNotifier
                                                        .addStudentAnswerModel
                                                        .answers[index]
                                                        .descr;
                                                radioGroupValue(val) {
                                                  setState(() {
                                                    descr = val;
                                                  });
                                                }

                                                return Row(
                                                  children: <Widget>[
                                                    Radio(
                                                      value: descr,
                                                      groupValue:
                                                          radioGroupValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          studentAnswer = value;
                                                          print(
                                                              "student answer : $studentAnswer");
                                                        });
                                                        print(value);
                                                      },
                                                      activeColor: Colors.white,
                                                      autofocus: false,
                                                      focusColor: Colors.white,
                                                      hoverColor: Colors.white,
                                                    ),
                                                    Text(
                                                      addStudentAnswerNotifier
                                                          .addStudentAnswerModel
                                                          .answers[index]
                                                          .descr,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                );
//                                  RadioListTile(
//                                  title: Text(getQuestionNotifier
//                                      .getQuestionModel.answers[index].descr),
//                                  onChanged: (value) {
//                                    print(value);
//                                  },
//                                  value: rightAns,
//                                  groupValue: radioGroupValue,
//                                  activeColor: Colors.blue,
//                                  selected: false,
//                                );
//                                Row(
//                                mainAxisAlignment:
//                                    MainAxisAlignment.spaceBetween,
//                                children: <Widget>[
//                                  Text(
//                                    '${getQuestionNotifier.getQuestionModel.answers[index].name}. ',
//                                    style: TextStyle(
//                                        fontSize: 24,
//                                        fontWeight: FontWeight.w700),
//                                  ),
//                                  Expanded(
//                                    child: Text(
//                                      getQuestionNotifier.getQuestionModel
//                                          .answers[index].descr,
//                                      style: TextStyle(
//                                          fontSize: 24,
//                                          fontWeight: FontWeight.w400),
//                                    ),
//                                  ),
//                                ],
//                              );
                                              },
                                              //physics: NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount:
                                                  addStudentAnswerNotifier
                                                      .addStudentAnswerModel
                                                      .answers
                                                      .length,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  default:
                                    return Center(
                                      child:
                                          Text(addStudentAnswerNotifier.error),
                                    );
                                }
                              },
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                FlatButton(
                                  color: Colors.blue,
                                  onPressed: () {
                                    _submitTest();
                                    _alertDialog(context);
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  splashColor: Colors.grey[200],
                                  child: Container(
                                    height: 55,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            _getNextQuestionFromServer();
                            counter++;
                            print(counter);
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        splashColor: Colors.grey[200],
                        child: Container(
                          height: 55,
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'Next Question',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  void paint(canvas, size) {
    var paint = Paint();
    paint.color = Colors.white;
    paint.strokeWidth = 2.5;
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );
  }

  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
