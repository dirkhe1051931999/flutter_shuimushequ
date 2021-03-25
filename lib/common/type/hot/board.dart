// To parse this JSON data, do
//
//     final typeHotBoardResponse = typeHotBoardResponseFromJson(jsonString);

import 'dart:convert';

TypeHotBoardResponse typeHotBoardResponseFromJson(String str) =>
    TypeHotBoardResponse.fromJson(json.decode(str));

String typeHotBoardResponseToJson(TypeHotBoardResponse data) =>
    json.encode(data.toJson());

class TypeHotBoardResponse {
  TypeHotBoardResponse({
    this.code,
    this.data,
    this.kbsCode,
    this.message,
  });

  int code;
  List<Datum> data;
  int kbsCode;
  String message;

  factory TypeHotBoardResponse.fromJson(Map<String, dynamic> json) =>
      TypeHotBoardResponse(
        code: json["code"] == null ? null : json["code"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        kbsCode: json["kbsCode"] == null ? null : json["kbsCode"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "kbsCode": kbsCode == null ? null : kbsCode,
        "message": message == null ? null : message,
      };
}

class Datum {
  Datum({
    this.groupId,
    this.id,
    this.name,
    this.popularity,
    this.sectionId,
    this.status,
    this.title,
    this.type,
  });

  String groupId;
  String id;
  String name;
  int popularity;
  String sectionId;
  int status;
  String title;
  int type;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        groupId: json["groupId"] == null ? null : json["groupId"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        popularity: json["popularity"] == null ? null : json["popularity"],
        sectionId: json["sectionId"] == null ? null : json["sectionId"],
        status: json["status"] == null ? null : json["status"],
        title: json["title"] == null ? null : json["title"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "groupId": groupId == null ? null : groupId,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "popularity": popularity == null ? null : popularity,
        "sectionId": sectionId == null ? null : sectionId,
        "status": status == null ? null : status,
        "title": title == null ? null : title,
        "type": type == null ? null : type,
      };
}
