import 'dart:convert';

TestCase testCaseFromJson(String str) => TestCase.fromJson(json.decode(str));

String testCaseToJson(TestCase data) => json.encode(data.toJson());

class TestCase {
  TestCase({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String image;
  DateTime creationAt;
  DateTime updatedAt;

  factory TestCase.fromJson(Map<String, dynamic> json) => TestCase(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
