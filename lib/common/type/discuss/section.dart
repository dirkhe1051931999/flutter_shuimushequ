// To parse this JSON data, do
//
//     final typeDiscussSectionResponse = typeDiscussSectionResponseFromJson(jsonString);

import 'dart:convert';

TypeDiscussSectionResponse typeDiscussSectionResponseFromJson(String str) =>
    TypeDiscussSectionResponse.fromJson(json.decode(str));

String typeDiscussSectionResponseToJson(TypeDiscussSectionResponse data) =>
    json.encode(data.toJson());

class TypeDiscussSectionResponse {
  TypeDiscussSectionResponse({
    this.code,
    this.data,
    this.kbsCode,
    this.message,
  });

  int code;
  Data data;
  int kbsCode;
  String message;

  factory TypeDiscussSectionResponse.fromJson(Map<String, dynamic> json) =>
      TypeDiscussSectionResponse(
        code: json["code"] == null ? null : json["code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        kbsCode: json["kbsCode"] == null ? null : json["kbsCode"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "data": data == null ? null : data.toJson(),
        "kbsCode": kbsCode == null ? null : kbsCode,
        "message": message == null ? null : message,
      };
}

class Data {
  Data({
    this.sections,
  });

  List<Section> sections;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sections: json["sections"] == null
            ? null
            : List<Section>.from(
                json["sections"].map((x) => Section.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sections": sections == null
            ? null
            : List<dynamic>.from(sections.map((x) => x.toJson())),
      };
}

class Section {
  Section({
    this.cover,
    this.name,
    this.description,
    this.id,
  });

  String cover;
  String name;
  String description;
  String id;

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        cover: json["cover"] == null ? null : json["cover"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "cover": cover == null ? null : cover,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "id": id == null ? null : id,
      };
}
