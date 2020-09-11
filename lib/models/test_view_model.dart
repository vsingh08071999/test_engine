class TestModel {
  final int testid;
  final String message;
  final List<Tests> tests;
  TestModel({this.testid, this.message, this.tests});
  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
        testid: json['testid'],
        message: json['message'],
        tests: parseTest(json));
  }
  static List<Tests> parseTest(parseJson) {
    var list = parseJson['tests'] as List;
    List<Tests> testsList = list.map((data) => Tests.fromJson(data)).toList();
    return testsList;
  }
}

class Tests {
  final int uid;
  final int id;
  final String name;
  final String descr;
  final int noOfAttempts;
  final int duration;
  final int passingScore;
  final String createdBy;
  final int creationDateTime;
  Tests(
      {this.uid,
      this.id,
      this.name,
      this.descr,
      this.noOfAttempts,
      this.duration,
      this.passingScore,
      this.createdBy,
      this.creationDateTime});
  factory Tests.fromJson(Map<String, dynamic> parsejson) {
    return Tests(
      uid: parsejson['uid'],
      id: parsejson['id'],
      name: parsejson['name'],
      descr: parsejson['descr'],
      noOfAttempts: parsejson['noOfAttempts'],
      duration: parsejson['duration'],
      passingScore: parsejson['passingScore'],
      createdBy: parsejson['createdBy'],
      creationDateTime: parsejson['creationDateTime'],
    );
  }
}
