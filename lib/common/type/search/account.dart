// To parse this JSON data, do
//
//     final typeSearchAccountResponse = typeSearchAccountResponseFromJson(jsonString);

import 'dart:convert';

TypeSearchAccountResponse typeSearchAccountResponseFromJson(String str) =>
    TypeSearchAccountResponse.fromJson(json.decode(str));

String typeSearchAccountResponseToJson(TypeSearchAccountResponse data) =>
    json.encode(data.toJson());

class TypeSearchAccountResponse {
  TypeSearchAccountResponse({
    this.code,
    this.data,
    this.kbsCode,
    this.message,
  });

  int code;
  Data data;
  int kbsCode;
  String message;

  factory TypeSearchAccountResponse.fromJson(Map<String, dynamic> json) =>
      TypeSearchAccountResponse(
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
    this.total,
    this.size,
    this.start,
    this.accounts,
  });

  int total;
  int size;
  int start;
  List<Account> accounts;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"] == null ? null : json["total"],
        size: json["size"] == null ? null : json["size"],
        start: json["start"] == null ? null : json["start"],
        accounts: json["accounts"] == null
            ? null
            : List<Account>.from(
                json["accounts"].map((x) => Account.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "size": size == null ? null : size,
        "start": start == null ? null : start,
        "accounts": accounts == null
            ? null
            : List<dynamic>.from(accounts.map((x) => x.toJson())),
      };
}

class Account {
  Account({
    this.gender,
    this.avatarUrl,
    this.level,
    this.isFans,
    this.avatar,
    this.levelTitle,
    this.type,
    this.nick,
    this.score,
    this.loginTime,
    this.createTime,
    this.isBlack,
    this.name,
    this.isFriend,
    this.id,
    this.k3SUrl,
  });

  int gender;
  String avatarUrl;
  int level;
  bool isFans;
  String avatar;
  String levelTitle;
  int type;
  String nick;
  int score;
  int loginTime;
  int createTime;
  bool isBlack;
  String name;
  int isFriend;
  String id;
  String k3SUrl;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        gender: json["gender"] == null ? null : json["gender"],
        avatarUrl: json["avatarUrl"] == null ? null : json["avatarUrl"],
        level: json["level"] == null ? null : json["level"],
        isFans: json["isFans"] == null ? null : json["isFans"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        levelTitle: json["levelTitle"] == null ? null : json["levelTitle"],
        type: json["type"] == null ? null : json["type"],
        nick: json["nick"] == null ? null : json["nick"],
        score: json["score"] == null ? null : json["score"],
        loginTime: json["loginTime"] == null ? null : json["loginTime"],
        createTime: json["createTime"] == null ? null : json["createTime"],
        isBlack: json["isBlack"] == null ? null : json["isBlack"],
        name: json["name"] == null ? null : json["name"],
        isFriend: json["isFriend"] == null ? null : json["isFriend"],
        id: json["id"] == null ? null : json["id"],
        k3SUrl: json["k3sUrl"] == null ? null : json["k3sUrl"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender == null ? null : gender,
        "avatarUrl": avatarUrl == null ? null : avatarUrl,
        "level": level == null ? null : level,
        "isFans": isFans == null ? null : isFans,
        "avatar": avatar == null ? null : avatar,
        "levelTitle": levelTitle == null ? null : levelTitle,
        "type": type == null ? null : type,
        "nick": nick == null ? null : nick,
        "score": score == null ? null : score,
        "loginTime": loginTime == null ? null : loginTime,
        "createTime": createTime == null ? null : createTime,
        "isBlack": isBlack == null ? null : isBlack,
        "name": name == null ? null : name,
        "isFriend": isFriend == null ? null : isFriend,
        "id": id == null ? null : id,
        "k3sUrl": k3SUrl == null ? null : k3SUrl,
      };
}
