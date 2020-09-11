class RegCodeModel {
  RegCodeModel({
    this.codes,
    this.groupid,
    this.statusCode,
    this.message,
  });

  List<String> codes;
  int groupid;
  String statusCode;
  String message;

  factory RegCodeModel.fromJson(Map<String, dynamic> json) => RegCodeModel(
        codes: List<String>.from(json["codes"].map((x) => x)),
        groupid: json["groupid"],
        statusCode: json["statusCode"],
        message: json["message"],
      );
}
