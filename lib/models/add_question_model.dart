class AddQuestionModel {
  final String message;
  final int testid;
  final int uid;

  AddQuestionModel({this.message, this.testid, this.uid});
  factory AddQuestionModel.fromJson(Map<String, dynamic> json) {
    return AddQuestionModel(
        message: json['message'], testid: json['testid'], uid: json['uid']);
  }
}
