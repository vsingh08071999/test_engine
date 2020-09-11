class AddGroupTestModel {
  final String message;
  final int testid;
  // final int uid;
  AddGroupTestModel({this.testid, this.message});
  factory AddGroupTestModel.fromJson(Map<String, dynamic> json) {
    return AddGroupTestModel(testid: json['testid'], message: json['message']);
  }
}
