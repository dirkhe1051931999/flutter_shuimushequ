// To parse this JSON data, do
//
//     final typePostResponse = typePostResponseFromJson(jsonString);

import 'dart:convert';

TypePostResponse typePostResponseFromJson(String str) =>
    TypePostResponse.fromJson(json.decode(str));

String typePostResponseToJson(TypePostResponse data) =>
    json.encode(data.toJson());

class TypePostResponse {
  TypePostResponse({
    this.code,
    this.data,
    this.kbsCode,
    this.message,
  });

  int code;
  Data data;
  int kbsCode;
  String message;

  factory TypePostResponse.fromJson(Map<String, dynamic> json) =>
      TypePostResponse(
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
    this.topics,
    this.adList,
    this.carouselList,
  });

  Pager pager;
  List<Topic> topics;
  List<AdList> adList;
  List<dynamic> carouselList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pager: json["pager"] == null ? null : Pager.fromJson(json["pager"]),
        topics: json["topics"] == null
            ? null
            : List<Topic>.from(json["topics"].map((x) => Topic.fromJson(x))),
        adList: json["adList"] == null
            ? null
            : List<AdList>.from(json["adList"].map((x) => AdList.fromJson(x))),
        carouselList: json["carouselList"] == null
            ? null
            : List<dynamic>.from(json["carouselList"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "pager": pager == null ? null : pager.toJson(),
        "topics": topics == null
            ? null
            : List<dynamic>.from(topics.map((x) => x.toJson())),
        "adList": adList == null
            ? null
            : List<dynamic>.from(adList.map((x) => x.toJson())),
        "carouselList": carouselList == null
            ? null
            : List<dynamic>.from(carouselList.map((x) => x)),
      };
}

class AdList {
  AdList({
    this.mode,
    this.material,
    this.feedId,
    this.requestId,
    this.weight,
    this.place,
    this.position,
    this.isBackground,
    this.boardName,
    this.tags,
  });

  String mode;
  Material material;
  String feedId;
  String requestId;
  int weight;
  String place;
  int position;
  String isBackground;
  String boardName;
  String tags;

  factory AdList.fromJson(Map<String, dynamic> json) => AdList(
        mode: json["mode"] == null ? null : json["mode"],
        material: json["material"] == null
            ? null
            : Material.fromJson(json["material"]),
        feedId: json["feedId"] == null ? null : json["feedId"],
        requestId: json["requestId"] == null ? null : json["requestId"],
        weight: json["weight"] == null ? null : json["weight"],
        place: json["place"] == null ? null : json["place"],
        position: json["position"] == null ? null : json["position"],
        isBackground:
            json["isBackground"] == null ? null : json["isBackground"],
        boardName: json["boardName"] == null ? null : json["boardName"],
        tags: json["tags"] == null ? null : json["tags"],
      );

  Map<String, dynamic> toJson() => {
        "mode": mode == null ? null : mode,
        "material": material == null ? null : material.toJson(),
        "feedId": feedId == null ? null : feedId,
        "requestId": requestId == null ? null : requestId,
        "weight": weight == null ? null : weight,
        "place": place == null ? null : place,
        "position": position == null ? null : position,
        "isBackground": isBackground == null ? null : isBackground,
        "boardName": boardName == null ? null : boardName,
        "tags": tags == null ? null : tags,
      };
}

class Material {
  Material({
    this.topicId,
    this.attachments,
    this.openMode,
    this.style,
    this.type,
    this.title,
    this.url,
  });

  String topicId;
  List<Attachment> attachments;
  String openMode;
  String style;
  String type;
  String title;
  String url;

  factory Material.fromJson(Map<String, dynamic> json) => Material(
        topicId: json["topicId"] == null ? null : json["topicId"],
        attachments: json["attachments"] == null
            ? null
            : List<Attachment>.from(
                json["attachments"].map((x) => Attachment.fromJson(x))),
        openMode: json["openMode"] == null ? null : json["openMode"],
        style: json["style"] == null ? null : json["style"],
        type: json["type"] == null ? null : json["type"],
        title: json["title"] == null ? null : json["title"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "topicId": topicId == null ? null : topicId,
        "attachments": attachments == null
            ? null
            : List<dynamic>.from(attachments.map((x) => x.toJson())),
        "openMode": openMode == null ? null : openMode,
        "style": style == null ? null : style,
        "type": type == null ? null : type,
        "title": title == null ? null : title,
        "url": url == null ? null : url,
      };
}

class Attachment {
  Attachment({
    this.size,
    this.name,
    this.id,
    this.type,
    this.url,
  });

  int size;
  String name;
  String id;
  String type;
  String url;

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        size: json["size"] == null ? null : json["size"],
        name: json["name"] == null ? null : json["name"],
        id: json["id"] == null ? null : json["id"],
        type: json["type"] == null ? null : json["type"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "size": size == null ? null : size,
        "name": name == null ? null : name,
        "id": id == null ? null : id,
        "type": type == null ? null : type,
        "url": url == null ? null : url,
      };
}

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

class Topic {
  Topic({
    this.availables,
    this.subject,
    this.firstArticleId,
    this.likeAvailables,
    this.flushTime,
    this.article,
    this.lastPostTime,
    this.lastArticleOrder,
    this.boardId,
    this.fav,
    this.id,
    this.board,
    this.lastArticleId,
    this.status,
  });

  int availables;
  String subject;
  String firstArticleId;
  int likeAvailables;
  int flushTime;
  Article article;
  int lastPostTime;
  int lastArticleOrder;
  BoardId boardId;
  bool fav;
  String id;
  Board board;
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
        article:
            json["article"] == null ? null : Article.fromJson(json["article"]),
        lastPostTime:
            json["lastPostTime"] == null ? null : json["lastPostTime"],
        lastArticleOrder:
            json["lastArticleOrder"] == null ? null : json["lastArticleOrder"],
        boardId:
            json["boardId"] == null ? null : boardIdValues.map[json["boardId"]],
        fav: json["fav"] == null ? null : json["fav"],
        id: json["id"] == null ? null : json["id"],
        board: json["board"] == null ? null : Board.fromJson(json["board"]),
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
        "article": article == null ? null : article.toJson(),
        "lastPostTime": lastPostTime == null ? null : lastPostTime,
        "lastArticleOrder": lastArticleOrder == null ? null : lastArticleOrder,
        "boardId": boardId == null ? null : boardIdValues.reverse[boardId],
        "fav": fav == null ? null : fav,
        "id": id == null ? null : id,
        "board": board == null ? null : board.toJson(),
        "lastArticleId": lastArticleId == null ? null : lastArticleId,
        "status": status == null ? null : status,
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
    this.status,
  });

  List<dynamic> attachments;
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
  BoardId boardId;
  bool fav;
  String id;
  int renderType;
  int topicOrder;
  Account account;
  int status;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        attachments: json["attachments"] == null
            ? null
            : List<dynamic>.from(json["attachments"].map((x) => x)),
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
        boardId:
            json["boardId"] == null ? null : boardIdValues.map[json["boardId"]],
        fav: json["fav"] == null ? null : json["fav"],
        id: json["id"] == null ? null : json["id"],
        renderType: json["renderType"] == null ? null : json["renderType"],
        topicOrder: json["topicOrder"] == null ? null : json["topicOrder"],
        account:
            json["account"] == null ? null : Account.fromJson(json["account"]),
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "attachments": attachments == null
            ? null
            : List<dynamic>.from(attachments.map((x) => x)),
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
        "boardId": boardId == null ? null : boardIdValues.reverse[boardId],
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

enum BoardId {
  THE_6_A1_C244119558802_AD9_E1_DA41_A348_C4_F,
  THE_7_FBA65_E45_F678_EB8_C605_D4107_DE04185,
  THE_9_A6_BADFCF52_B2_EF7352490144_AFFD8_C0
}

final boardIdValues = EnumValues({
  "6a1c244119558802ad9e1da41a348c4f":
      BoardId.THE_6_A1_C244119558802_AD9_E1_DA41_A348_C4_F,
  "7fba65e45f678eb8c605d4107de04185":
      BoardId.THE_7_FBA65_E45_F678_EB8_C605_D4107_DE04185,
  "9a6badfcf52b2ef7352490144affd8c0":
      BoardId.THE_9_A6_BADFCF52_B2_EF7352490144_AFFD8_C0
});

enum Id { THE_486881_BA7_E253_CE615482722150_A14_DD }

final idValues = EnumValues({
  "486881ba7e253ce615482722150a14dd":
      Id.THE_486881_BA7_E253_CE615482722150_A14_DD
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
  Title title;
  int type;
  int todayPostCount;
  bool forbiddenReply;
  Name name;
  BoardId id;
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
        title: json["title"] == null ? null : titleValues.map[json["title"]],
        type: json["type"] == null ? null : json["type"],
        todayPostCount:
            json["todayPostCount"] == null ? null : json["todayPostCount"],
        forbiddenReply:
            json["forbiddenReply"] == null ? null : json["forbiddenReply"],
        name: json["name"] == null ? null : nameValues.map[json["name"]],
        id: json["id"] == null ? null : boardIdValues.map[json["id"]],
        isFavorite: json["isFavorite"] == null ? null : json["isFavorite"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "groupId": groupId == null ? null : groupIdValues.reverse[groupId],
        "accessScore": accessScore == null ? null : accessScore,
        "readOnly": readOnly == null ? null : readOnly,
        "sectionId":
            sectionId == null ? null : sectionIdValues.reverse[sectionId],
        "title": title == null ? null : titleValues.reverse[title],
        "type": type == null ? null : type,
        "todayPostCount": todayPostCount == null ? null : todayPostCount,
        "forbiddenReply": forbiddenReply == null ? null : forbiddenReply,
        "name": name == null ? null : nameValues.reverse[name],
        "id": id == null ? null : boardIdValues.reverse[id],
        "isFavorite": isFavorite == null ? null : isFavorite,
        "status": status == null ? null : status,
      };
}

enum GroupId { EMPTY, THE_7351_B5711_DB458_CB353_F1177_C79_A036_B }

final groupIdValues = EnumValues({
  "": GroupId.EMPTY,
  "7351b5711db458cb353f1177c79a036b":
      GroupId.THE_7351_B5711_DB458_CB353_F1177_C79_A036_B
});

enum Name { CHILD_EDUCATION, CHILDREN, CHILD_EDUCATION_INFO }

final nameValues = EnumValues({
  "Children": Name.CHILDREN,
  "ChildEducation": Name.CHILD_EDUCATION,
  "ChildEducation.Info": Name.CHILD_EDUCATION_INFO
});

enum SectionId {
  THE_4_ED7_F0_D8_B621_C8_CCF9_E11_ECA9991_D6_DC,
  THE_1_C455_A5_DCCF4242008_D188_F9676_E3_F4_E,
  THE_5_B634_FDC9_ECDDF6042561_C959176_C077
}

final sectionIdValues = EnumValues({
  "1c455a5dccf4242008d188f9676e3f4e":
      SectionId.THE_1_C455_A5_DCCF4242008_D188_F9676_E3_F4_E,
  "4ed7f0d8b621c8ccf9e11eca9991d6dc":
      SectionId.THE_4_ED7_F0_D8_B621_C8_CCF9_E11_ECA9991_D6_DC,
  "5b634fdc9ecddf6042561c959176c077":
      SectionId.THE_5_B634_FDC9_ECDDF6042561_C959176_C077
});

enum Title { EMPTY, TITLE, PURPLE }

final titleValues = EnumValues(
    {"儿童教育": Title.EMPTY, "儿童教育信息": Title.PURPLE, "孩子": Title.TITLE});

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
