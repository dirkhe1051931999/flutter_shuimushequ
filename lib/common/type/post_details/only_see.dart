// To parse this JSON data, do
//
//     final typePostDetailsOnlySeeResponse = typePostDetailsOnlySeeResponseFromJson(jsonString);

import 'dart:convert';

TypePostDetailsOnlySeeResponse typePostDetailsOnlySeeResponseFromJson(
        String str) =>
    TypePostDetailsOnlySeeResponse.fromJson(json.decode(str));

String typePostDetailsOnlySeeResponseToJson(
        TypePostDetailsOnlySeeResponse data) =>
    json.encode(data.toJson());

class TypePostDetailsOnlySeeResponse {
  TypePostDetailsOnlySeeResponse({
    this.code,
    this.data,
    this.kbsCode,
    this.message,
  });

  int code;
  Data data;
  int kbsCode;
  String message;

  factory TypePostDetailsOnlySeeResponse.fromJson(Map<String, dynamic> json) =>
      TypePostDetailsOnlySeeResponse(
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
    this.topic,
    this.articles,
    this.board,
  });

  Pager pager;
  Topic topic;
  List<Article> articles;
  Board board;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pager: json["pager"] == null ? null : Pager.fromJson(json["pager"]),
        topic: json["topic"] == null ? null : Topic.fromJson(json["topic"]),
        articles: json["articles"] == null
            ? null
            : List<Article>.from(
                json["articles"].map((x) => Article.fromJson(x))),
        board: json["board"] == null ? null : Board.fromJson(json["board"]),
      );

  Map<String, dynamic> toJson() => {
        "pager": pager == null ? null : pager.toJson(),
        "topic": topic == null ? null : topic.toJson(),
        "articles": articles == null
            ? null
            : List<dynamic>.from(articles.map((x) => x.toJson())),
        "board": board == null ? null : board.toJson(),
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
    this.fav,
    this.id,
    this.renderType,
    this.topicOrder,
    this.account,
    this.status,
  });

  Subject subject;
  Id groupId;
  int editTime;
  String body;
  AccountId accountId;
  int score;
  int postTime;
  TopicIdEnum topicId;
  bool public;
  int size;
  bool forbiddenReply;
  String replyId;
  BoardIdEnum boardId;
  bool fav;
  String id;
  int renderType;
  int topicOrder;
  Account account;
  int status;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        subject:
            json["subject"] == null ? null : subjectValues.map[json["subject"]],
        groupId: json["groupId"] == null ? null : idValues.map[json["groupId"]],
        editTime: json["editTime"] == null ? null : json["editTime"],
        body: json["body"] == null ? null : json["body"],
        accountId: json["accountId"] == null
            ? null
            : accountIdValues.map[json["accountId"]],
        score: json["score"] == null ? null : json["score"],
        postTime: json["postTime"] == null ? null : json["postTime"],
        topicId: json["topicId"] == null
            ? null
            : topicIdEnumValues.map[json["topicId"]],
        public: json["public"] == null ? null : json["public"],
        size: json["size"] == null ? null : json["size"],
        forbiddenReply:
            json["forbiddenReply"] == null ? null : json["forbiddenReply"],
        replyId: json["replyId"] == null ? null : json["replyId"],
        boardId: json["boardId"] == null
            ? null
            : boardIdEnumValues.map[json["boardId"]],
        fav: json["fav"] == null ? null : json["fav"],
        id: json["id"] == null ? null : json["id"],
        renderType: json["renderType"] == null ? null : json["renderType"],
        topicOrder: json["topicOrder"] == null ? null : json["topicOrder"],
        account:
            json["account"] == null ? null : Account.fromJson(json["account"]),
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "subject": subject == null ? null : subjectValues.reverse[subject],
        "groupId": groupId == null ? null : idValues.reverse[groupId],
        "editTime": editTime == null ? null : editTime,
        "body": body == null ? null : body,
        "accountId":
            accountId == null ? null : accountIdValues.reverse[accountId],
        "score": score == null ? null : score,
        "postTime": postTime == null ? null : postTime,
        "topicId": topicId == null ? null : topicIdEnumValues.reverse[topicId],
        "public": public == null ? null : public,
        "size": size == null ? null : size,
        "forbiddenReply": forbiddenReply == null ? null : forbiddenReply,
        "replyId": replyId == null ? null : replyId,
        "boardId": boardId == null ? null : boardIdEnumValues.reverse[boardId],
        "fav": fav == null ? null : fav,
        "id": id == null ? null : id,
        "renderType": renderType == null ? null : renderType,
        "topicOrder": topicOrder == null ? null : topicOrder,
        "account": account == null ? null : account.toJson(),
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
  LevelTitle levelTitle;
  int type;
  Nick nick;
  int score;
  int loginTime;
  int createTime;
  bool isBlack;
  Name name;
  AccountId id;
  String k3SUrl;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        gender: json["gender"] == null ? null : json["gender"],
        avatarUrl: json["avatarUrl"] == null ? null : json["avatarUrl"],
        level: json["level"] == null ? null : json["level"],
        isFans: json["isFans"] == null ? null : json["isFans"],
        avatar:
            json["avatar"] == null ? null : avatarValues.map[json["avatar"]],
        levelTitle: json["levelTitle"] == null
            ? null
            : levelTitleValues.map[json["levelTitle"]],
        type: json["type"] == null ? null : json["type"],
        nick: json["nick"] == null ? null : nickValues.map[json["nick"]],
        score: json["score"] == null ? null : json["score"],
        loginTime: json["loginTime"] == null ? null : json["loginTime"],
        createTime: json["createTime"] == null ? null : json["createTime"],
        isBlack: json["isBlack"] == null ? null : json["isBlack"],
        name: json["name"] == null ? null : nameValues.map[json["name"]],
        id: json["id"] == null ? null : accountIdValues.map[json["id"]],
        k3SUrl: json["k3sUrl"] == null ? null : json["k3sUrl"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender == null ? null : gender,
        "avatarUrl": avatarUrl == null ? null : avatarUrl,
        "level": level == null ? null : level,
        "isFans": isFans == null ? null : isFans,
        "avatar": avatar == null ? null : avatarValues.reverse[avatar],
        "levelTitle":
            levelTitle == null ? null : levelTitleValues.reverse[levelTitle],
        "type": type == null ? null : type,
        "nick": nick == null ? null : nickValues.reverse[nick],
        "score": score == null ? null : score,
        "loginTime": loginTime == null ? null : loginTime,
        "createTime": createTime == null ? null : createTime,
        "isBlack": isBlack == null ? null : isBlack,
        "name": name == null ? null : nameValues.reverse[name],
        "id": id == null ? null : accountIdValues.reverse[id],
        "k3sUrl": k3SUrl == null ? null : k3SUrl,
      };
}

enum Avatar { FILE_E4_F6_C378_C9_E856913798_D0_D6_DE6154_D0 }

final avatarValues = EnumValues({
  "file/e4f6c378c9e856913798d0d6de6154d0":
      Avatar.FILE_E4_F6_C378_C9_E856913798_D0_D6_DE6154_D0
});

enum AccountId { A19_DEDC8773_B8_F8_FF18470_CA38_AF0_BFA }

final accountIdValues = EnumValues({
  "a19dedc8773b8f8ff18470ca38af0bfa":
      AccountId.A19_DEDC8773_B8_F8_FF18470_CA38_AF0_BFA
});

enum LevelTitle { EMPTY }

final levelTitleValues = EnumValues({"砥柱": LevelTitle.EMPTY});

enum Name { WHITELIES }

final nameValues = EnumValues({"whitelies": Name.WHITELIES});

enum Nick { EMPTY }

final nickValues = EnumValues({"国企职场观察": Nick.EMPTY});

enum BoardIdEnum { THE_45_FF94_C59_BBCCF733381_AEEBC5_AD5_E55 }

final boardIdEnumValues = EnumValues({
  "45ff94c59bbccf733381aeebc5ad5e55":
      BoardIdEnum.THE_45_FF94_C59_BBCCF733381_AEEBC5_AD5_E55
});

enum Id { DCF6_DC9_C4_A8_DCFADA0_C5_A240_AEA3_AB1_A }

final idValues = EnumValues({
  "dcf6dc9c4a8dcfada0c5a240aea3ab1a":
      Id.DCF6_DC9_C4_A8_DCFADA0_C5_A240_AEA3_AB1_A
});

enum Subject { RE_33, RE_RE_33 }

final subjectValues = EnumValues({
  "Re: 33岁了，想做个清醒正常的打工人": Subject.RE_33,
  "Re: Re:33岁了，想做个清醒正常的打工人": Subject.RE_RE_33
});

enum TopicIdEnum { THE_3_EE9_A3_D2_C758_FB32_DA47_EBFD072_C4_C11 }

final topicIdEnumValues = EnumValues({
  "3ee9a3d2c758fb32da47ebfd072c4c11":
      TopicIdEnum.THE_3_EE9_A3_D2_C758_FB32_DA47_EBFD072_C4_C11
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

  String groupId;
  int accessScore;
  bool readOnly;
  String sectionId;
  String title;
  int type;
  int todayPostCount;
  bool forbiddenReply;
  String name;
  BoardIdEnum id;
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
        id: json["id"] == null ? null : boardIdEnumValues.map[json["id"]],
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
        "id": id == null ? null : boardIdEnumValues.reverse[id],
        "isFavorite": isFavorite == null ? null : isFavorite,
        "status": status == null ? null : status,
      };
}

class Pager {
  Pager({
    this.currentPage,
    this.pageSize,
    this.start,
    this.totalItems,
    this.totalPages,
  });

  int currentPage;
  int pageSize;
  int start;
  int totalItems;
  int totalPages;

  factory Pager.fromJson(Map<String, dynamic> json) => Pager(
        currentPage: json["currentPage"] == null ? null : json["currentPage"],
        pageSize: json["pageSize"] == null ? null : json["pageSize"],
        start: json["start"] == null ? null : json["start"],
        totalItems: json["totalItems"] == null ? null : json["totalItems"],
        totalPages: json["totalPages"] == null ? null : json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "currentPage": currentPage == null ? null : currentPage,
        "pageSize": pageSize == null ? null : pageSize,
        "start": start == null ? null : start,
        "totalItems": totalItems == null ? null : totalItems,
        "totalPages": totalPages == null ? null : totalPages,
      };
}

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
  Id firstArticleId;
  int likeAvailables;
  int flushTime;
  int lastPostTime;
  int lastArticleOrder;
  BoardIdEnum boardId;
  bool fav;
  TopicIdEnum id;
  String lastArticleId;
  int status;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        availables: json["availables"] == null ? null : json["availables"],
        subject: json["subject"] == null ? null : json["subject"],
        firstArticleId: json["firstArticleId"] == null
            ? null
            : idValues.map[json["firstArticleId"]],
        likeAvailables:
            json["likeAvailables"] == null ? null : json["likeAvailables"],
        flushTime: json["flushTime"] == null ? null : json["flushTime"],
        lastPostTime:
            json["lastPostTime"] == null ? null : json["lastPostTime"],
        lastArticleOrder:
            json["lastArticleOrder"] == null ? null : json["lastArticleOrder"],
        boardId: json["boardId"] == null
            ? null
            : boardIdEnumValues.map[json["boardId"]],
        fav: json["fav"] == null ? null : json["fav"],
        id: json["id"] == null ? null : topicIdEnumValues.map[json["id"]],
        lastArticleId:
            json["lastArticleId"] == null ? null : json["lastArticleId"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "availables": availables == null ? null : availables,
        "subject": subject == null ? null : subject,
        "firstArticleId":
            firstArticleId == null ? null : idValues.reverse[firstArticleId],
        "likeAvailables": likeAvailables == null ? null : likeAvailables,
        "flushTime": flushTime == null ? null : flushTime,
        "lastPostTime": lastPostTime == null ? null : lastPostTime,
        "lastArticleOrder": lastArticleOrder == null ? null : lastArticleOrder,
        "boardId": boardId == null ? null : boardIdEnumValues.reverse[boardId],
        "fav": fav == null ? null : fav,
        "id": id == null ? null : topicIdEnumValues.reverse[id],
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
