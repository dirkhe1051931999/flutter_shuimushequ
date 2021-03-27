// To parse this JSON data, do
//
//     final typeAlbumPostResponse = typeAlbumPostResponseFromJson(jsonString);

import 'dart:convert';

TypeAlbumPostResponse typeAlbumPostResponseFromJson(String str) =>
    TypeAlbumPostResponse.fromJson(json.decode(str));

String typeAlbumPostResponseToJson(TypeAlbumPostResponse data) =>
    json.encode(data.toJson());

class TypeAlbumPostResponse {
  TypeAlbumPostResponse({
    this.code,
    this.data,
    this.kbsCode,
    this.message,
  });

  int code;
  Data data;
  int kbsCode;
  String message;

  factory TypeAlbumPostResponse.fromJson(Map<String, dynamic> json) =>
      TypeAlbumPostResponse(
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
    this.pager,
    this.adList,
    this.articles,
  });

  Pager pager;
  List<dynamic> adList;
  List<Article> articles;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pager: json["pager"] == null ? null : Pager.fromJson(json["pager"]),
        adList: json["adList"] == null
            ? null
            : List<dynamic>.from(json["adList"].map((x) => x)),
        articles: json["articles"] == null
            ? null
            : List<Article>.from(
                json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pager": pager == null ? null : pager.toJson(),
        "adList":
            adList == null ? null : List<dynamic>.from(adList.map((x) => x)),
        "articles": articles == null
            ? null
            : List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    this.attachments,
    this.subject,
    this.groupId,
    this.editTime,
    this.body,
    this.accountId,
    this.score,
    this.postTime,
    this.topicId,
    this.public,
    this.size,
    this.forbiddenReply,
    this.replyId,
    this.boardId,
    this.fav,
    this.id,
    this.renderType,
    this.topicOrder,
    this.account,
    this.board,
    this.status,
  });

  List<Attachment> attachments;
  String subject;
  Id groupId;
  int editTime;
  String body;
  String accountId;
  int score;
  int postTime;
  String topicId;
  bool public;
  int size;
  bool forbiddenReply;
  Id replyId;
  String boardId;
  bool fav;
  String id;
  int renderType;
  int topicOrder;
  Account account;
  Board board;
  int status;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        attachments: json["attachments"] == null
            ? null
            : List<Attachment>.from(
                json["attachments"].map((x) => Attachment.fromJson(x))),
        subject: json["subject"] == null ? null : json["subject"],
        groupId: json["groupId"] == null ? null : idValues.map[json["groupId"]],
        editTime: json["editTime"] == null ? null : json["editTime"],
        body: json["body"] == null ? null : json["body"],
        accountId: json["accountId"] == null ? null : json["accountId"],
        score: json["score"] == null ? null : json["score"],
        postTime: json["postTime"] == null ? null : json["postTime"],
        topicId: json["topicId"] == null ? null : json["topicId"],
        public: json["public"] == null ? null : json["public"],
        size: json["size"] == null ? null : json["size"],
        forbiddenReply:
            json["forbiddenReply"] == null ? null : json["forbiddenReply"],
        replyId: json["replyId"] == null ? null : idValues.map[json["replyId"]],
        boardId: json["boardId"] == null ? null : json["boardId"],
        fav: json["fav"] == null ? null : json["fav"],
        id: json["id"] == null ? null : json["id"],
        renderType: json["renderType"] == null ? null : json["renderType"],
        topicOrder: json["topicOrder"] == null ? null : json["topicOrder"],
        account:
            json["account"] == null ? null : Account.fromJson(json["account"]),
        board: json["board"] == null ? null : Board.fromJson(json["board"]),
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "attachments": attachments == null
            ? null
            : List<dynamic>.from(attachments.map((x) => x.toJson())),
        "subject": subject == null ? null : subject,
        "groupId": groupId == null ? null : idValues.reverse[groupId],
        "editTime": editTime == null ? null : editTime,
        "body": body == null ? null : body,
        "accountId": accountId == null ? null : accountId,
        "score": score == null ? null : score,
        "postTime": postTime == null ? null : postTime,
        "topicId": topicId == null ? null : topicId,
        "public": public == null ? null : public,
        "size": size == null ? null : size,
        "forbiddenReply": forbiddenReply == null ? null : forbiddenReply,
        "replyId": replyId == null ? null : idValues.reverse[replyId],
        "boardId": boardId == null ? null : boardId,
        "fav": fav == null ? null : fav,
        "id": id == null ? null : id,
        "renderType": renderType == null ? null : renderType,
        "topicOrder": topicOrder == null ? null : topicOrder,
        "account": account == null ? null : account.toJson(),
        "board": board == null ? null : board.toJson(),
        "status": status == null ? null : status,
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
        "id": id == null ? null : id,
        "k3sUrl": k3SUrl == null ? null : k3SUrl,
      };
}

class Attachment {
  Attachment({
    this.public,
    this.size,
    this.serial,
    this.cdnUrl,
    this.ks3Url,
    this.name,
    this.id,
    this.type,
    this.hash,
    this.url,
    this.status,
  });

  bool public;
  int size;
  int serial;
  String cdnUrl;
  String ks3Url;
  String name;
  String id;
  Type type;
  String hash;
  String url;
  int status;

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        public: json["public"] == null ? null : json["public"],
        size: json["size"] == null ? null : json["size"],
        serial: json["serial"] == null ? null : json["serial"],
        cdnUrl: json["cdnUrl"] == null ? null : json["cdnUrl"],
        ks3Url: json["ks3Url"] == null ? null : json["ks3Url"],
        name: json["name"] == null ? null : json["name"],
        id: json["id"] == null ? null : json["id"],
        type: json["type"] == null ? null : typeValues.map[json["type"]],
        hash: json["hash"] == null ? null : json["hash"],
        url: json["url"] == null ? null : json["url"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "public": public == null ? null : public,
        "size": size == null ? null : size,
        "serial": serial == null ? null : serial,
        "cdnUrl": cdnUrl == null ? null : cdnUrl,
        "ks3Url": ks3Url == null ? null : ks3Url,
        "name": name == null ? null : name,
        "id": id == null ? null : id,
        "type": type == null ? null : typeValues.reverse[type],
        "hash": hash == null ? null : hash,
        "url": url == null ? null : url,
        "status": status == null ? null : status,
      };
}

enum Type { IMAGE_JPEG, IMAGE_PNG }

final typeValues =
    EnumValues({"image/jpeg": Type.IMAGE_JPEG, "image/png": Type.IMAGE_PNG});

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
  String sectionId;
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
        sectionId: json["sectionId"] == null ? null : json["sectionId"],
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
        "sectionId": sectionId == null ? null : sectionId,
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

enum Id {
  THE_5777978_B430_D2_A7_D82_BBE9_E1_E8313367,
  THE_486881_BA7_E253_CE615482722150_A14_DD,
  THE_2574_A48939_C7619_B3_B05175_B51324_F9_B,
  THE_923_D67_AB07_B647_D1_BAC94_C77966_AD308,
  D76_C8_F62_ADE5_C5_E08734_C7_BF27_C6_C1_FA
}

final idValues = EnumValues({
  "d76c8f62ade5c5e08734c7bf27c6c1fa":
      Id.D76_C8_F62_ADE5_C5_E08734_C7_BF27_C6_C1_FA,
  "2574a48939c7619b3b05175b51324f9b":
      Id.THE_2574_A48939_C7619_B3_B05175_B51324_F9_B,
  "486881ba7e253ce615482722150a14dd":
      Id.THE_486881_BA7_E253_CE615482722150_A14_DD,
  "5777978b430d2a7d82bbe9e1e8313367":
      Id.THE_5777978_B430_D2_A7_D82_BBE9_E1_E8313367,
  "923d67ab07b647d1bac94c77966ad308":
      Id.THE_923_D67_AB07_B647_D1_BAC94_C77966_AD308
});

class Pager {
  Pager({
    this.total,
    this.size,
    this.page,
    this.items,
  });

  int total;
  int size;
  int page;
  int items;

  factory Pager.fromJson(Map<String, dynamic> json) => Pager(
        total: json["total"] == null ? null : json["total"],
        size: json["size"] == null ? null : json["size"],
        page: json["page"] == null ? null : json["page"],
        items: json["items"] == null ? null : json["items"],
      );

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "size": size == null ? null : size,
        "page": page == null ? null : page,
        "items": items == null ? null : items,
      };
}

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
