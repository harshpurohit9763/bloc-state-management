import 'dart:convert';

class CreatedUserDataModel {
  String name;
  String job;
  String id;
  DateTime createdAt;

  CreatedUserDataModel({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  });

  factory CreatedUserDataModel.fromRawJson(String str) =>
      CreatedUserDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreatedUserDataModel.fromJson(Map<String, dynamic> json) =>
      CreatedUserDataModel(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt.toIso8601String(),
      };
}
