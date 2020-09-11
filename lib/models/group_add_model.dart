class GroupAddModel {
  final int groupid;
  final int userid;
  final String message;
  GroupAddModel({this.groupid, this.userid, this.message});
  factory GroupAddModel.fromJson(Map<String, dynamic> json) {
    return GroupAddModel(
        groupid: json['groupid'],
        userid: json['userid'],
        message: json['message']);
  }
}
