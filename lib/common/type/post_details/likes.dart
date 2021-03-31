// To parse this JSON data, do
//
//     final typePostDetailsLikesResponse = typePostDetailsLikesResponseFromJson(jsonString);

import 'dart:convert';

TypePostDetailsLikesResponse typePostDetailsLikesResponseFromJson(String str) =>
    TypePostDetailsLikesResponse.fromJson(json.decode(str));

String typePostDetailsLikesResponseToJson(TypePostDetailsLikesResponse data) =>
    json.encode(data.toJson());

class TypePostDetailsLikesResponse {
  TypePostDetailsLikesResponse({
    this.code,
    this.data,
    this.kbsCode,
    this.message,
  });

  int code;
  List<dynamic> data;
  int kbsCode;
  String message;

  factory TypePostDetailsLikesResponse.fromJson(Map<String, dynamic> json) =>
      TypePostDetailsLikesResponse(
        code: json["code"] == null ? null : json["code"],
        data: json["data"] == null
            ? null
            : List<dynamic>.from(json["data"].map((x) => x)),
        kbsCode: json["kbsCode"] == null ? null : json["kbsCode"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x)),
        "kbsCode": kbsCode == null ? null : kbsCode,
        "message": message == null ? null : message,
      };
}

class DatumClass {
  DatumClass({
    this.account,
    this.accountId,
    this.accountName,
    this.articleId,
    this.body,
    this.id,
    this.score,
    this.serial,
    this.status,
    this.tag,
    this.time,
  });

  Account account;
  String accountId;
  String accountName;
  ArticleId articleId;
  String body;
  String id;
  int score;
  int serial;
  int status;
  String tag;
  int time;

  factory DatumClass.fromJson(Map<String, dynamic> json) => DatumClass(
        account:
            json["account"] == null ? null : Account.fromJson(json["account"]),
        accountId: json["accountId"] == null ? null : json["accountId"],
        accountName: json["accountName"] == null ? null : json["accountName"],
        articleId: json["articleId"] == null
            ? null
            : articleIdValues.map[json["articleId"]],
        body: json["body"] == null ? null : json["body"],
        id: json["id"] == null ? null : json["id"],
        score: json["score"] == null ? null : json["score"],
        serial: json["serial"] == null ? null : json["serial"],
        status: json["status"] == null ? null : json["status"],
        tag: json["tag"] == null ? null : json["tag"],
        time: json["time"] == null ? null : json["time"],
      );

  Map<String, dynamic> toJson() => {
        "account": account == null ? null : account.toJson(),
        "accountId": accountId == null ? null : accountId,
        "accountName": accountName == null ? null : accountName,
        "articleId":
            articleId == null ? null : articleIdValues.reverse[articleId],
        "body": body == null ? null : body,
        "id": id == null ? null : id,
        "score": score == null ? null : score,
        "serial": serial == null ? null : serial,
        "status": status == null ? null : status,
        "tag": tag == null ? null : tag,
        "time": time == null ? null : time,
      };
}

class Account {
  Account({
    this.avatar,
    this.avatarUrl,
    this.createTime,
    this.gender,
    this.id,
    this.isBlack,
    this.isFans,
    this.k3SUrl,
    this.level,
    this.levelTitle,
    this.loginTime,
    this.name,
    this.nick,
    this.score,
    this.type,
  });

  String avatar;
  String avatarUrl;
  int createTime;
  int gender;
  String id;
  bool isBlack;
  bool isFans;
  String k3SUrl;
  int level;
  String levelTitle;
  int loginTime;
  String name;
  String nick;
  int score;
  int type;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        avatar: json["avatar"] == null ? null : json["avatar"],
        avatarUrl: json["avatarUrl"] == null ? null : json["avatarUrl"],
        createTime: json["createTime"] == null ? null : json["createTime"],
        gender: json["gender"] == null ? null : json["gender"],
        id: json["id"] == null ? null : json["id"],
        isBlack: json["isBlack"] == null ? null : json["isBlack"],
        isFans: json["isFans"] == null ? null : json["isFans"],
        k3SUrl: json["k3sUrl"] == null ? null : json["k3sUrl"],
        level: json["level"] == null ? null : json["level"],
        levelTitle: json["levelTitle"] == null ? null : json["levelTitle"],
        loginTime: json["loginTime"] == null ? null : json["loginTime"],
        name: json["name"] == null ? null : json["name"],
        nick: json["nick"] == null ? null : json["nick"],
        score: json["score"] == null ? null : json["score"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar == null ? null : avatar,
        "avatarUrl": avatarUrl == null ? null : avatarUrl,
        "createTime": createTime == null ? null : createTime,
        "gender": gender == null ? null : gender,
        "id": id == null ? null : id,
        "isBlack": isBlack == null ? null : isBlack,
        "isFans": isFans == null ? null : isFans,
        "k3sUrl": k3SUrl == null ? null : k3SUrl,
        "level": level == null ? null : level,
        "levelTitle": levelTitle == null ? null : levelTitle,
        "loginTime": loginTime == null ? null : loginTime,
        "name": name == null ? null : name,
        "nick": nick == null ? null : nick,
        "score": score == null ? null : score,
        "type": type == null ? null : type,
      };
}

enum ArticleId { DC47084_FF849_AED7_F156276_E50_BDEEE3 }

final articleIdValues = EnumValues({
  "dc47084ff849aed7f156276e50bdeee3":
      ArticleId.DC47084_FF849_AED7_F156276_E50_BDEEE3
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
