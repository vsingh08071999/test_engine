class GroupModel {
  final int groupid;
  final int userid;
  final String message;
  final List<Groups> groups;
  GroupModel({this.groupid, this.userid, this.message, this.groups});
  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
        groupid: json['groupid'],
        userid: json['userid'],
        message: json['message'],
        groups: parseGroup(json));
  }
  static List<Groups> parseGroup(parseJson) {
    var list = parseJson['groups'] as List;
    List<Groups> groupList = list.map((data) => Groups.fromJson(data)).toList();
    return groupList;
  }
}

class Groups {
  final int uid;
  final int gid;
  final String name;
  final String descr;
  Groups({
    this.uid,
    this.gid,
    this.name,
    this.descr,
  });
  factory Groups.fromJson(Map<String, dynamic> parsejson) {
    return Groups(
      uid: parsejson['uid'],
      gid: parsejson['gid'],
      name: parsejson['name'],
      descr: parsejson['descr'],
    );
  }
}
