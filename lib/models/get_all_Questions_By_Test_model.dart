class GetAllQuestionsByTestModel {
  GetAllQuestionsByTestModel(
      {this.message,
      this.statusCode,
      this.testid,
      this.uid,
      this.questions,
      this.listQid // this stores list of qids customisely
      });

  dynamic message;
  String statusCode;
  int testid;
  int uid;
  List<Question> questions;
  List listQid;

  factory GetAllQuestionsByTestModel.fromJson(Map<String, dynamic> json) =>
      GetAllQuestionsByTestModel(
        message: json["message"],
        statusCode: json["statusCode"],
        testid: json["testid"],
        uid: json["uid"],
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );
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
}
