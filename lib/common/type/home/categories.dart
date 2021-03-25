// To parse this JSON data, do
//
//     final typeCategoriesResponse = typeCategoriesResponseFromJson(jsonString);

import 'dart:convert';

TypeCategoriesResponse typeCategoriesResponseFromJson(String str) =>
    TypeCategoriesResponse.fromJson(json.decode(str));

String typeCategoriesResponseToJson(TypeCategoriesResponse data) =>
    json.encode(data.toJson());

class TypeCategoriesResponse {
  TypeCategoriesResponse({
    this.code,
    this.data,
    this.kbsCode,
    this.message,
  });

  int code;
  Data data;
  int kbsCode;
  String message;

  factory TypeCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      TypeCategoriesResponse(
        code: json["code"],
        data: Data.fromJson(json["data"]),
        kbsCode: json["kbsCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data.toJson(),
        "kbsCode": kbsCode,
        "message": message,
      };
}

class Data {
  Data({
    this.code,
    this.data,
  });

  int code;
  List<Datum> data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.name,
    this.id,
    this.type,
    this.value,
  });

  String name;
  String id;
  String type;
  String value;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        id: json["id"],
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "type": type,
        "value": value,
      };
}
