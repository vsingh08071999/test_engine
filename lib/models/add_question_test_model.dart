class AddQuestionTestModel {
  final String message;
  final int testid;
  // final int uid;

  AddQuestionTestModel({
    this.testid,
    this.message,
  });
  factory AddQuestionTestModel.fromJson(Map<String, dynamic> json) {
    return AddQuestionTestModel(
        testid: json['testid'], message: json['message']);
  }
}
