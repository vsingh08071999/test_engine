class SubmitTestModel {
  final String message;
  final int score;

  SubmitTestModel({this.message, this.score});
  factory SubmitTestModel.fromJson(Map<String, dynamic> json) {
    return SubmitTestModel(message: json["message"], score: json["score"]);
  }
}
