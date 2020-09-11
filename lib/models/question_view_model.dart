//class QuestionsModel {
//  final int testid;
//  final int uid;
//  final List<Questions> questions;
//  QuestionsModel({this.testid, this.uid, this.questions});
//  factory QuestionsModel.fromJson(Map<String, dynamic> questionJson) {
//    return QuestionsModel(
//        testid: questionJson['testid'],
//        uid: questionJson['uid'],
//        questions: parseQuestionsModel(questionJson));
//  }
//  static List<Questions> parseQuestionsModel(parseQuestionJson) {
//    var list = parseQuestionJson['questions'] as List;
//    List<Questions> questionsList =
//        list.map((data1) => Questions.fromJson(data1)).toList();
//    return questionsList;
//  }
//}
//
//class Questions {
//  final int uid;
//  final int qid;
//  final String name;
//  final int score;
//  final List<Answers> answers;
//  Questions({this.uid, this.qid, this.name, this.score, this.answers});
//  factory Questions.fromJson(Map<String, dynamic> json) {
//    return Questions(
//        uid: json['uid'],
//        qid: json['qid'],
//        name: json['name'],
//        score: json['score'],
//        answers: parseQuestion(json));
//  }
//  static List<Answers> parseQuestion(parseJson) {
//    var list = parseJson['answers'] as List;
//    List<Answers> questionList =
//        list.map((data) => Answers.fromJson(data)).toList();
//    return questionList;
//  }
//}
//
//class Answers {
//  final int qid;
//  final int id;
//  final String name;
//  final String descr;
//  final String rightAns;
//  Answers({this.qid, this.id, this.name, this.descr, this.rightAns});
//  factory Answers.fromJson(Map<String, dynamic> parsejson) {
//    return Answers(
//        qid: parsejson['qid'],
//        id: parsejson['id'],
//        name: parsejson['name'],
//        descr: parsejson['descr'],
//        rightAns: parsejson['rightAns']);
//  }
//}
// To parse this JSON data, do
//
//     final questionsModel = questionsModelFromJson(jsonString);

import 'dart:convert';

QuestionsModel questionsModelFromJson(String str) =>
    QuestionsModel.fromJson(json.decode(str));

String questionsModelToJson(QuestionsModel data) => json.encode(data.toJson());

class QuestionsModel {
  QuestionsModel({
    this.message,
    this.statusCode,
    this.testid,
    this.uid,
    this.questions,
  });

  dynamic message;
  String statusCode;
  int testid;
  int uid;
  List<Question> questions;

  factory QuestionsModel.fromJson(Map<String, dynamic> json) => QuestionsModel(
        message: json["message"],
        statusCode: json["statusCode"],
        testid: json["testid"],
        uid: json["uid"],
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
        "testid": testid,
        "uid": uid,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class Question {
  Question({
    this.uid,
    this.qid,
    this.name,
    this.score,
    this.status,
    this.answers,
  });

  int uid;
  int qid;
  String name;
  int score;
  String status;
  List<Answer> answers;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        uid: json["uid"],
        qid: json["qid"],
        name: json["name"],
        score: json["score"],
        status: json["status"],
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "qid": qid,
        "name": name,
        "score": score,
        "status": status,
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
      };
}

class Answer {
  Answer({
    this.qid,
    this.id,
    this.name,
    this.descr,
    this.status,
    this.rightAns,
  });

  int qid;
  int id;
  String name;
  String descr;
  String status;
  String rightAns;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        qid: json["qid"],
        id: json["id"],
        name: json["name"],
        descr: json["descr"],
        status: json["status"],
        rightAns: json["rightAns"],
      );

  Map<String, dynamic> toJson() => {
        "qid": qid,
        "id": id,
        "name": name,
        "descr": descr,
        "status": status,
        "rightAns": rightAns,
      };
}
