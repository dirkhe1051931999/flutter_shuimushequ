// To parse this JSON data, do
//
//     final typeSearchBoardResponse = typeSearchBoardResponseFromJson(jsonString);

import 'dart:convert';

TypeSearchBoardResponse typeSearchBoardResponseFromJson(String str) =>
    TypeSearchBoardResponse.fromJson(json.decode(str));

String typeSearchBoardResponseToJson(TypeSearchBoardResponse data) =>
    json.encode(data.toJson());

class TypeSearchBoardResponse {
  TypeSearchBoardResponse({
    this.code,
    this.data,
    this.kbsCode,
    this.message,
  });

  int code;
  List<Datum> data;
  int kbsCode;
  String message;

  factory TypeSearchBoardResponse.fromJson(Map<String, dynamic> json) =>
      TypeSearchBoardResponse(
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
    this.manager,
    this.groupId,
    this.accessScore,
    this.readOnly,
    this.articleCount,
    this.sectionId,
    this.title,
    this.type,
    this.isAttachment,
    this.todayPostCount,
    this.forbiddenReply,
    this.name,
    this.topicCount,
    this.isFavorites,
    this.id,
    this.isFavorite,
    this.status,
  });

  List<dynamic> manager;
  String groupId;
  int accessScore;
  bool readOnly;
  int articleCount;
  String sectionId;
  String title;
  int type;
  int isAttachment;
  int todayPostCount;
  bool forbiddenReply;
  String name;
  int topicCount;
  int isFavorites;
  String id;
  int isFavorite;
  int status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        manager: json["manager"] == null
            ? null
            : List<dynamic>.from(json["manager"].map((x) => x)),
        groupId: json["groupId"] == null ? null : json["groupId"],
        accessScore: json["accessScore"] == null ? null : json["accessScore"],
        readOnly: json["readOnly"] == null ? null : json["readOnly"],
        articleCount:
            json["articleCount"] == null ? null : json["articleCount"],
        sectionId: json["sectionId"] == null ? null : json["sectionId"],
        title: json["title"] == null ? null : json["title"],
        type: json["type"] == null ? null : json["type"],
        isAttachment:
            json["isAttachment"] == null ? null : json["isAttachment"],
        todayPostCount:
            json["todayPostCount"] == null ? null : json["todayPostCount"],
        forbiddenReply:
            json["forbiddenReply"] == null ? null : json["forbiddenReply"],
        name: json["name"] == null ? null : json["name"],
        topicCount: json["topicCount"] == null ? null : json["topicCount"],
        isFavorites: json["isFavorites"] == null ? null : json["isFavorites"],
        id: json["id"] == null ? null : json["id"],
        isFavorite: json["isFavorite"] == null ? null : json["isFavorite"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "manager":
            manager == null ? null : List<dynamic>.from(manager.map((x) => x)),
        "groupId": groupId == null ? null : groupId,
        "accessScore": accessScore == null ? null : accessScore,
        "readOnly": readOnly == null ? null : readOnly,
        "articleCount": articleCount == null ? null : articleCount,
        "sectionId": sectionId == null ? null : sectionId,
        "title": title == null ? null : title,
        "type": type == null ? null : type,
        "isAttachment": isAttachment == null ? null : isAttachment,
        "todayPostCount": todayPostCount == null ? null : todayPostCount,
        "forbiddenReply": forbiddenReply == null ? null : forbiddenReply,
        "name": name == null ? null : name,
        "topicCount": topicCount == null ? null : topicCount,
        "isFavorites": isFavorites == null ? null : isFavorites,
        "id": id == null ? null : id,
        "isFavorite": isFavorite == null ? null : isFavorite,
        "status": status == null ? null : status,
      };
}
