// To parse this JSON data, do
//
//     final typeSearchArticleResponse = typeSearchArticleResponseFromJson(jsonString);

import 'dart:convert';

TypeSearchArticleResponse typeSearchArticleResponseFromJson(String str) =>
    TypeSearchArticleResponse.fromJson(json.decode(str));

String typeSearchArticleResponseToJson(TypeSearchArticleResponse data) =>
    json.encode(data.toJson());

class TypeSearchArticleResponse {
  TypeSearchArticleResponse({
    this.code,
    this.data,
    this.kbsCode,
    this.message,
  });

  int code;
  Data data;
  int kbsCode;
  String message;

  factory TypeSearchArticleResponse.fromJson(Map<String, dynamic> json) =>
      TypeSearchArticleResponse(
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
    this.articles,
  });

  int total;
  int size;
  int start;
  List<Article> articles;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"] == null ? null : json["total"],
        size: json["size"] == null ? null : json["size"],
        start: json["start"] == null ? null : json["start"],
        articles: json["articles"] == null
            ? null
            : List<Article>.from(
                json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "size": size == null ? null : size,
        "start": start == null ? null : start,
        "articles": articles == null
            ? null
            : List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Article({
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
    this.topic,
    this.fav,
    this.id,
    this.renderType,
    this.topicOrder,
    this.account,
    this.board,
    this.status,
  });

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
  Topic topic;
  bool fav;
  String id;
  int renderType;
  int topicOrder;
  Account account;
  Board board;
  int status;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
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
        topic: json["topic"] == null ? null : Topic.fromJson(json["topic"]),
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
        "topic": topic == null ? null : topic.toJson(),
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
  Avatar avatar;
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
        avatar:
            json["avatar"] == null ? null : avatarValues.map[json["avatar"]],
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
        "avatar": avatar == null ? null : avatarValues.reverse[avatar],
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

enum Avatar {
  FILE_0_C5_A90_EB513_A832_FCD6_C25_CB2_CA181_B9,
  FILE_5_DB15_E1_D27_AD0_CCAA79_A6_B856_FBE9_C5_F,
  FILE_82_F0_E5_ECC91_D14_AADE7087_DA3_C2_E39_CA,
  FILE_C9_AD892_A77_D7266_E24_C5123_C5406387_E
}

final avatarValues = EnumValues({
  "file/0c5a90eb513a832fcd6c25cb2ca181b9":
      Avatar.FILE_0_C5_A90_EB513_A832_FCD6_C25_CB2_CA181_B9,
  "file/5db15e1d27ad0ccaa79a6b856fbe9c5f":
      Avatar.FILE_5_DB15_E1_D27_AD0_CCAA79_A6_B856_FBE9_C5_F,
  "file/82f0e5ecc91d14aade7087da3c2e39ca":
      Avatar.FILE_82_F0_E5_ECC91_D14_AADE7087_DA3_C2_E39_CA,
  "file/c9ad892a77d7266e24c5c5406387e":
      Avatar.FILE_C9_AD892_A77_D7266_E24_C5123_C5406387_E
});

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

  GroupId groupId;
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
        groupId:
            json["groupId"] == null ? null : groupIdValues.map[json["groupId"]],
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
        "groupId": groupId == null ? null : groupIdValues.reverse[groupId],
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

enum GroupId {
  THE_3_D1_A6_F8_D2521_F6066507_F2_BC3_CCA2_BF5,
  THE_26_CD41_CBDECD8_F868_CCA98_DB866_E95_A4,
  THE_4477_A8_DC499828_E674_EDC843032_ABCF5,
  EMPTY
}

final groupIdValues = EnumValues({
  "": GroupId.EMPTY,
  "26cd41cbdecd8f868cca98db866e95a4":
      GroupId.THE_26_CD41_CBDECD8_F868_CCA98_DB866_E95_A4,
  "3d1a6f8d2521f6066507f2bc3cca2bf5":
      GroupId.THE_3_D1_A6_F8_D2521_F6066507_F2_BC3_CCA2_BF5,
  "4477a8dc499828e674edc843032abcf5":
      GroupId.THE_4477_A8_DC499828_E674_EDC843032_ABCF5
});

enum SectionId {
  THE_5_B634_FDC9_ECDDF6042561_C959176_C077,
  C2_EA7_C56020_EB65_B0_F4_DFC2_A867_D97_E7,
  THE_4_FCAB28694_A0_BE93_D9297_D8_CEDE052_D9
}

final sectionIdValues = EnumValues({
  "c2ea7c56020eb65b0f4dfc2a867d97e7":
      SectionId.C2_EA7_C56020_EB65_B0_F4_DFC2_A867_D97_E7,
  "4fcab28694a0be93d9297d8cede052d9":
      SectionId.THE_4_FCAB28694_A0_BE93_D9297_D8_CEDE052_D9,
  "5b634fdc9ecddf6042561c959176c077":
      SectionId.THE_5_B634_FDC9_ECDDF6042561_C959176_C077
});

enum Id { THE_486881_BA7_E253_CE615482722150_A14_DD }

final idValues = EnumValues({
  "486881ba7e253ce615482722150a14dd":
      Id.THE_486881_BA7_E253_CE615482722150_A14_DD
});

class Topic {
  Topic({
    this.availables,
    this.subject,
    this.firstArticleId,
    this.likeAvailables,
    this.flushTime,
    this.lastPostTime,
    this.lastArticleOrder,
    this.boardId,
    this.fav,
    this.id,
    this.lastArticleId,
    this.status,
  });

  int availables;
  String subject;
  String firstArticleId;
  int likeAvailables;
  int flushTime;
  int lastPostTime;
  int lastArticleOrder;
  String boardId;
  bool fav;
  String id;
  String lastArticleId;
  int status;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        availables: json["availables"] == null ? null : json["availables"],
        subject: json["subject"] == null ? null : json["subject"],
        firstArticleId:
            json["firstArticleId"] == null ? null : json["firstArticleId"],
        likeAvailables:
            json["likeAvailables"] == null ? null : json["likeAvailables"],
        flushTime: json["flushTime"] == null ? null : json["flushTime"],
        lastPostTime:
            json["lastPostTime"] == null ? null : json["lastPostTime"],
        lastArticleOrder:
            json["lastArticleOrder"] == null ? null : json["lastArticleOrder"],
        boardId: json["boardId"] == null ? null : json["boardId"],
        fav: json["fav"] == null ? null : json["fav"],
        id: json["id"] == null ? null : json["id"],
        lastArticleId:
            json["lastArticleId"] == null ? null : json["lastArticleId"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "availables": availables == null ? null : availables,
        "subject": subject == null ? null : subject,
        "firstArticleId": firstArticleId == null ? null : firstArticleId,
        "likeAvailables": likeAvailables == null ? null : likeAvailables,
        "flushTime": flushTime == null ? null : flushTime,
        "lastPostTime": lastPostTime == null ? null : lastPostTime,
        "lastArticleOrder": lastArticleOrder == null ? null : lastArticleOrder,
        "boardId": boardId == null ? null : boardId,
        "fav": fav == null ? null : fav,
        "id": id == null ? null : id,
        "lastArticleId": lastArticleId == null ? null : lastArticleId,
        "status": status == null ? null : status,
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
