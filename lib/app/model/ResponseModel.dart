import 'dart:convert';

class ResponseModel {
  ResponseModel({
    this.success,
    this.message,
    this.result,
  });

  bool? success;
  String? message;
  dynamic result;

  factory ResponseModel.fromRawJson(String str) => ResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
    success: json["success"],
    message: json["message"],
    result: json["result"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "result": result.toJson(),
  };
}