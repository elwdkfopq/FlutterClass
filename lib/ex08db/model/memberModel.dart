import 'dart:convert';

List<MemberModel> memberModelFromJson(String str) => List<MemberModel>.from(json.decode(str).map((x) => MemberModel.fromJson(x)));

String memberModelToJson(List<MemberModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MemberModel {
  String id;
  String pw;
  int age;

  MemberModel({
    required this.id,
    required this.pw,
    required this.age,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) => MemberModel(
    id: json["id"],
    pw: json["pw"],
    age: json["age"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pw": pw,
    "age": age,
  };
}