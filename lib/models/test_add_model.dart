class TestAddModel {
  final int testid;
  final String message;

  TestAddModel({this.testid, this.message});
  factory TestAddModel.fromJson(Map<String, dynamic> json) {
    return TestAddModel(testid: json['testid'], message: json['message']);
  }
}
