// To parse this JSON data, do
//
//     final typePostDetailsCommentResponse = typePostDetailsCommentResponseFromJson(jsonString);

import 'dart:convert';

TypePostDetailsCommentResponse typePostDetailsCommentResponseFromJson(
        String str) =>
    TypePostDetailsCommentResponse.fromJson(json.decode(str));

String typePostDetailsCommentResponseToJson(
        TypePostDetailsCommentResponse data) =>
    json.encode(data.toJson());

class TypePostDetailsCommentResponse {
  TypePostDetailsCommentResponse({
    this.code,
    this.data,
    this.kbsCode,
    this.message,
  });

  int code;
  Data data;
  int kbsCode;
  String message;

  factory TypePostDetailsCommentResponse.fromJson(Map<String, dynamic> json) =>
      TypePostDetailsCommentResponse(
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
    this.likes,
    this.status,
  });

  Subject subject;
  Id groupId;
  int editTime;
  String body;
  String accountId;
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
  List<Like> likes;
  int status;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        subject:
            json["subject"] == null ? null : subjectValues.map[json["subject"]],
        groupId: json["groupId"] == null ? null : idValues.map[json["groupId"]],
        editTime: json["editTime"] == null ? null : json["editTime"],
        body: json["body"] == null ? null : json["body"],
        accountId: json["accountId"] == null ? null : json["accountId"],
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
        likes: json["likes"] == null
            ? null
            : List<Like>.from(json["likes"].map((x) => Like.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "subject": subject == null ? null : subjectValues.reverse[subject],
        "groupId": groupId == null ? null : idValues.reverse[groupId],
        "editTime": editTime == null ? null : editTime,
        "body": body == null ? null : body,
        "accountId": accountId == null ? null : accountId,
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
        "likes": likes == null
            ? null
            : List<dynamic>.from(likes.map((x) => x.toJson())),
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

enum BoardIdEnum { THE_447_BFFD6152246_C2092283_A0_A4_D49_BD8 }

final boardIdEnumValues = EnumValues({
  "447bffd6152246c2092283a0a4d49bd8":
      BoardIdEnum.THE_447_BFFD6152246_C2092283_A0_A4_D49_BD8
});

enum Id {
  THE_486881_BA7_E253_CE615482722150_A14_DD,
  DC47084_FF849_AED7_F156276_E50_BDEEE3
}

final idValues = EnumValues({
  "dc47084ff849aed7f156276e50bdeee3": Id.DC47084_FF849_AED7_F156276_E50_BDEEE3,
  "486881ba7e253ce615482722150a14dd":
      Id.THE_486881_BA7_E253_CE615482722150_A14_DD
});

class Like {
  Like({
    this.accountId,
    this.score,
    this.accountName,
    this.serial,
    this.articleId,
    this.id,
    this.tag,
    this.time,
    this.body,
    this.account,
    this.status,
  });

  String accountId;
  int score;
  String accountName;
  int serial;
  Id articleId;
  String id;
  String tag;
  int time;
  String body;
  Account account;
  int status;

  factory Like.fromJson(Map<String, dynamic> json) => Like(
        accountId: json["accountId"] == null ? null : json["accountId"],
        score: json["score"] == null ? null : json["score"],
        accountName: json["accountName"] == null ? null : json["accountName"],
        serial: json["serial"] == null ? null : json["serial"],
        articleId:
            json["articleId"] == null ? null : idValues.map[json["articleId"]],
        id: json["id"] == null ? null : json["id"],
        tag: json["tag"] == null ? null : json["tag"],
        time: json["time"] == null ? null : json["time"],
        body: json["body"] == null ? null : json["body"],
        account:
            json["account"] == null ? null : Account.fromJson(json["account"]),
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "accountId": accountId == null ? null : accountId,
        "score": score == null ? null : score,
        "accountName": accountName == null ? null : accountName,
        "serial": serial == null ? null : serial,
        "articleId": articleId == null ? null : idValues.reverse[articleId],
        "id": id == null ? null : id,
        "tag": tag == null ? null : tag,
        "time": time == null ? null : time,
        "body": body == null ? null : body,
        "account": account == null ? null : account.toJson(),
        "status": status == null ? null : status,
      };
}

enum Subject { THE_1080, RE_1080, SUBJECT_RE_1080, RE_RE_1080 }

final subjectValues = EnumValues({
  "Re: 雷军谈造车：我们有1080亿现金储备，我们不怕赔": Subject.RE_1080,
  "Re: Re:雷军谈造车：我们有1080亿现金储备，我们不怕赔": Subject.RE_RE_1080,
  "Re:雷军谈造车：我们有1080亿现金储备，我们不怕赔": Subject.SUBJECT_RE_1080,
  "雷军谈造车：我们有1080亿现金储备，我们不怕赔": Subject.THE_1080
});

enum TopicIdEnum { THE_304_E50_DFB70_BD01_ED72_D297_C02_D64_E36 }

final topicIdEnumValues = EnumValues({
  "304e50dfb70bd01ed72d297c02d64e36":
      TopicIdEnum.THE_304_E50_DFB70_BD01_ED72_D297_C02_D64_E36
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
  Subject subject;
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
        subject:
            json["subject"] == null ? null : subjectValues.map[json["subject"]],
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
        "subject": subject == null ? null : subjectValues.reverse[subject],
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
