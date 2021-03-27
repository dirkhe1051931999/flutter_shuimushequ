// To parse this JSON data, do
//
//     final typeMyResponse = typeMyResponseFromJson(jsonString);

import 'dart:convert';

TypeMyResponse typeMyResponseFromJson(String str) =>
    TypeMyResponse.fromJson(json.decode(str));

String typeMyResponseToJson(TypeMyResponse data) => json.encode(data.toJson());

class TypeMyResponse {
  TypeMyResponse({
    this.code,
    this.data,
    this.kbsCode,
    this.message,
  });

  int code;
  Data data;
  int kbsCode;
  String message;

  factory TypeMyResponse.fromJson(Map<String, dynamic> json) => TypeMyResponse(
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
    this.fontMode,
    this.homeMode,
    this.readerMode,
  });

  String fontMode;
  String homeMode;
  String readerMode;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        fontMode: json["fontMode"] == null ? null : json["fontMode"],
        homeMode: json["homeMode"] == null ? null : json["homeMode"],
        readerMode: json["readerMode"] == null ? null : json["readerMode"],
      );

  Map<String, dynamic> toJson() => {
        "fontMode": fontMode == null ? null : fontMode,
        "homeMode": homeMode == null ? null : homeMode,
        "readerMode": readerMode == null ? null : readerMode,
      };
}
