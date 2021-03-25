// To parse this JSON data, do
//
//     final typeDiscussSectionDetailResponse = typeDiscussSectionDetailResponseFromJson(jsonString);

import 'dart:convert';

TypeDiscussSectionDetailResponse typeDiscussSectionDetailResponseFromJson(
        String str) =>
    TypeDiscussSectionDetailResponse.fromJson(json.decode(str));

String typeDiscussSectionDetailResponseToJson(
        TypeDiscussSectionDetailResponse data) =>
    json.encode(data.toJson());

class TypeDiscussSectionDetailResponse {
  TypeDiscussSectionDetailResponse({
    this.code,
    this.data,
    this.kbsCode,
    this.message,
  });

  int code;
  Data data;
  int kbsCode;
  String message;

  factory TypeDiscussSectionDetailResponse.fromJson(
          Map<String, dynamic> json) =>
      TypeDiscussSectionDetailResponse(
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
    this.boards,
  });

  List<Board> boards;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        boards: json["boards"] == null
            ? null
            : List<Board>.from(json["boards"].map((x) => Board.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "boards": boards == null
            ? null
            : List<dynamic>.from(boards.map((x) => x.toJson())),
      };
}

class Board {
  Board({
    this.groupId,
    this.accessScore,
    this.readOnly,
    this.sectionId,
    this.title,
    this.type,
    this.todayPostCount,
    this.forbiddenReply,
    this.name,
    this.id,
    this.isFavorite,
    this.status,
  });

  String groupId;
  int accessScore;
  bool readOnly;
  SectionId sectionId;
  String title;
  int type;
  int todayPostCount;
  bool forbiddenReply;
  String name;
  String id;
  int isFavorite;
  int status;

  factory Board.fromJson(Map<String, dynamic> json) => Board(
        groupId: json["groupId"] == null ? null : json["groupId"],
        accessScore: json["accessScore"] == null ? null : json["accessScore"],
        readOnly: json["readOnly"] == null ? null : json["readOnly"],
        sectionId: json["sectionId"] == null
            ? null
            : sectionIdValues.map[json["sectionId"]],
        title: json["title"] == null ? null : json["title"],
        type: json["type"] == null ? null : json["type"],
        todayPostCount:
            json["todayPostCount"] == null ? null : json["todayPostCount"],
        forbiddenReply:
            json["forbiddenReply"] == null ? null : json["forbiddenReply"],
        name: json["name"] == null ? null : json["name"],
        id: json["id"] == null ? null : json["id"],
        isFavorite: json["isFavorite"] == null ? null : json["isFavorite"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "groupId": groupId == null ? null : groupId,
        "accessScore": accessScore == null ? null : accessScore,
        "readOnly": readOnly == null ? null : readOnly,
        "sectionId":
            sectionId == null ? null : sectionIdValues.reverse[sectionId],
        "title": title == null ? null : title,
        "type": type == null ? null : type,
        "todayPostCount": todayPostCount == null ? null : todayPostCount,
        "forbiddenReply": forbiddenReply == null ? null : forbiddenReply,
        "name": name == null ? null : name,
        "id": id == null ? null : id,
        "isFavorite": isFavorite == null ? null : isFavorite,
        "status": status == null ? null : status,
      };
}

enum SectionId { THE_7_FBA65_E45_F678_EB8_C605_D4107_DE04185 }

final sectionIdValues = EnumValues({
  "7fba65e45f678eb8c605d4107de04185":
      SectionId.THE_7_FBA65_E45_F678_EB8_C605_D4107_DE04185
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
