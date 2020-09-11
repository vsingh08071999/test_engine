class AddStudentAnswerModel {
  AddStudentAnswerModel({
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

  factory AddStudentAnswerModel.fromJson(Map<String, dynamic> json) =>
      AddStudentAnswerModel(
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
