class GetAllTestByStudentModel {
  GetAllTestByStudentModel({
    this.testid,
    this.gIds,
    this.tests,
    this.message,
  });

  int testid;
  dynamic gIds;
  List<Test> tests;
  String message;

  factory GetAllTestByStudentModel.fromJson(Map<String, dynamic> json) =>
      GetAllTestByStudentModel(
        testid: json["testid"],
        gIds: json["gIds"],
        tests: List<Test>.from(json["tests"].map((x) => Test.fromJson(x))),
        message: json["message"],
      );
}

class Test {
  Test({
    this.uid,
    this.id,
    this.name,
    this.descr,
    this.noOfAttempts,
    this.duration,
    this.passingScore,
    this.createdBy,
    this.creationDateTime,
  });

  int uid;
  int id;
  String name;
  String descr;
  int noOfAttempts;
  int duration;
  int passingScore;
  String createdBy;
  int creationDateTime;

  factory Test.fromJson(Map<String, dynamic> json) => Test(
        uid: json["uid"],
        id: json["id"],
        name: json["name"],
        descr: json["descr"],
        noOfAttempts: json["noOfAttempts"],
        duration: json["duration"],
        passingScore: json["passingScore"],
        createdBy: json["createdBy"],
        creationDateTime: json["creationDateTime"],
      );
}
