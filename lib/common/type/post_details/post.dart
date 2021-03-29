// To parse this JSON data, do
//
//     final typePostDetailsResponse = typePostDetailsResponseFromJson(jsonString);

import 'dart:convert';

TypePostDetailsResponse typePostDetailsResponseFromJson(String str) =>
    TypePostDetailsResponse.fromJson(json.decode(str));

String typePostDetailsResponseToJson(TypePostDetailsResponse data) =>
    json.encode(data.toJson());

class TypePostDetailsResponse {
  TypePostDetailsResponse({
    this.code,
    this.data,
    this.kbsCode,
    this.message,
  });

  int code;
  Data data;
  int kbsCode;
  String message;

  factory TypePostDetailsResponse.fromJson(Map<String, dynamic> json) =>
      TypePostDetailsResponse(
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
    this.topic,
  });

  Topic topic;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        topic: json["topic"] == null ? null : Topic.fromJson(json["topic"]),
      );

  Map<String, dynamic> toJson() => {
        "topic": topic == null ? null : topic.toJson(),
      };
}

class Topic {
  Topic({
    this.article,
    this.availables,
    this.board,
    this.boardId,
    this.fav,
    this.firstArticleId,
    this.flushTime,
    this.id,
    this.lastArticleId,
    this.lastArticleOrder,
    this.lastPostTime,
    this.likeAvailables,
    this.status,
    this.subject,
  });

  Article article;
  int availables;
  Board board;
  String boardId;
  bool fav;
  String firstArticleId;
  int flushTime;
  String id;
  String lastArticleId;
  int lastArticleOrder;
  int lastPostTime;
  int likeAvailables;
  int status;
  String subject;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        article:
            json["article"] == null ? null : Article.fromJson(json["article"]),
        availables: json["availables"] == null ? null : json["availables"],
        board: json["board"] == null ? null : Board.fromJson(json["board"]),
        boardId: json["boardId"] == null ? null : json["boardId"],
        fav: json["fav"] == null ? null : json["fav"],
        firstArticleId:
            json["firstArticleId"] == null ? null : json["firstArticleId"],
        flushTime: json["flushTime"] == null ? null : json["flushTime"],
        id: json["id"] == null ? null : json["id"],
        lastArticleId:
            json["lastArticleId"] == null ? null : json["lastArticleId"],
        lastArticleOrder:
            json["lastArticleOrder"] == null ? null : json["lastArticleOrder"],
        lastPostTime:
            json["lastPostTime"] == null ? null : json["lastPostTime"],
        likeAvailables:
            json["likeAvailables"] == null ? null : json["likeAvailables"],
        status: json["status"] == null ? null : json["status"],
        subject: json["subject"] == null ? null : json["subject"],
      );

  Map<String, dynamic> toJson() => {
        "article": article == null ? null : article.toJson(),
        "availables": availables == null ? null : availables,
        "board": board == null ? null : board.toJson(),
        "boardId": boardId == null ? null : boardId,
        "fav": fav == null ? null : fav,
        "firstArticleId": firstArticleId == null ? null : firstArticleId,
        "flushTime": flushTime == null ? null : flushTime,
        "id": id == null ? null : id,
        "lastArticleId": lastArticleId == null ? null : lastArticleId,
        "lastArticleOrder": lastArticleOrder == null ? null : lastArticleOrder,
        "lastPostTime": lastPostTime == null ? null : lastPostTime,
        "likeAvailables": likeAvailables == null ? null : likeAvailables,
        "status": status == null ? null : status,
        "subject": subject == null ? null : subject,
      };
}

class Article {
  Article({
    this.account,
    this.accountId,
    this.attachments,
    this.boardId,
    this.body,
    this.editTime,
    this.fav,
    this.forbiddenReply,
    this.groupId,
    this.id,
    this.likes,
    this.postTime,
    this.public,
    this.renderType,
    this.replyId,
    this.score,
    this.size,
    this.status,
    this.subject,
    this.topicId,
    this.topicOrder,
  });

  Account account;
  String accountId;
  List<dynamic> attachments;
  String boardId;
  String body;
  int editTime;
  bool fav;
  bool forbiddenReply;
  String groupId;
  String id;
  List<dynamic> likes;
  int postTime;
  bool public;
  int renderType;
  String replyId;
  int score;
  int size;
  int status;
  String subject;
  String topicId;
  int topicOrder;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        account:
            json["account"] == null ? null : Account.fromJson(json["account"]),
        accountId: json["accountId"] == null ? null : json["accountId"],
        attachments: json["attachments"] == null
            ? null
            : List<dynamic>.from(json["attachments"].map((x) => x)),
        boardId: json["boardId"] == null ? null : json["boardId"],
        body: json["body"] == null ? null : json["body"],
        editTime: json["editTime"] == null ? null : json["editTime"],
        fav: json["fav"] == null ? null : json["fav"],
        forbiddenReply:
            json["forbiddenReply"] == null ? null : json["forbiddenReply"],
        groupId: json["groupId"] == null ? null : json["groupId"],
        id: json["id"] == null ? null : json["id"],
        likes: json["likes"] == null
            ? null
            : List<dynamic>.from(json["likes"].map((x) => x)),
        postTime: json["postTime"] == null ? null : json["postTime"],
        public: json["public"] == null ? null : json["public"],
        renderType: json["renderType"] == null ? null : json["renderType"],
        replyId: json["replyId"] == null ? null : json["replyId"],
        score: json["score"] == null ? null : json["score"],
        size: json["size"] == null ? null : json["size"],
        status: json["status"] == null ? null : json["status"],
        subject: json["subject"] == null ? null : json["subject"],
        topicId: json["topicId"] == null ? null : json["topicId"],
        topicOrder: json["topicOrder"] == null ? null : json["topicOrder"],
      );

  Map<String, dynamic> toJson() => {
        "account": account == null ? null : account.toJson(),
        "accountId": accountId == null ? null : accountId,
        "attachments": attachments == null
            ? null
            : List<dynamic>.from(attachments.map((x) => x)),
        "boardId": boardId == null ? null : boardId,
        "body": body == null ? null : body,
        "editTime": editTime == null ? null : editTime,
        "fav": fav == null ? null : fav,
        "forbiddenReply": forbiddenReply == null ? null : forbiddenReply,
        "groupId": groupId == null ? null : groupId,
        "id": id == null ? null : id,
        "likes": likes == null ? null : List<dynamic>.from(likes.map((x) => x)),
        "postTime": postTime == null ? null : postTime,
        "public": public == null ? null : public,
        "renderType": renderType == null ? null : renderType,
        "replyId": replyId == null ? null : replyId,
        "score": score == null ? null : score,
        "size": size == null ? null : size,
        "status": status == null ? null : status,
        "subject": subject == null ? null : subject,
        "topicId": topicId == null ? null : topicId,
        "topicOrder": topicOrder == null ? null : topicOrder,
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

class Board {
  Board({
    this.accessScore,
    this.forbiddenReply,
    this.groupId,
    this.id,
    this.isFavorite,
    this.name,
    this.readOnly,
    this.sectionId,
    this.status,
    this.title,
    this.todayPostCount,
    this.type,
  });

  int accessScore;
  bool forbiddenReply;
  String groupId;
  String id;
  int isFavorite;
  String name;
  bool readOnly;
  String sectionId;
  int status;
  String title;
  int todayPostCount;
  int type;

  factory Board.fromJson(Map<String, dynamic> json) => Board(
        accessScore: json["accessScore"] == null ? null : json["accessScore"],
        forbiddenReply:
            json["forbiddenReply"] == null ? null : json["forbiddenReply"],
        groupId: json["groupId"] == null ? null : json["groupId"],
        id: json["id"] == null ? null : json["id"],
        isFavorite: json["isFavorite"] == null ? null : json["isFavorite"],
        name: json["name"] == null ? null : json["name"],
        readOnly: json["readOnly"] == null ? null : json["readOnly"],
        sectionId: json["sectionId"] == null ? null : json["sectionId"],
        status: json["status"] == null ? null : json["status"],
        title: json["title"] == null ? null : json["title"],
        todayPostCount:
            json["todayPostCount"] == null ? null : json["todayPostCount"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "accessScore": accessScore == null ? null : accessScore,
        "forbiddenReply": forbiddenReply == null ? null : forbiddenReply,
        "groupId": groupId == null ? null : groupId,
        "id": id == null ? null : id,
        "isFavorite": isFavorite == null ? null : isFavorite,
        "name": name == null ? null : name,
        "readOnly": readOnly == null ? null : readOnly,
        "sectionId": sectionId == null ? null : sectionId,
        "status": status == null ? null : status,
        "title": title == null ? null : title,
        "todayPostCount": todayPostCount == null ? null : todayPostCount,
        "type": type == null ? null : type,
      };
}
