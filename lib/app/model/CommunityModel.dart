import 'dart:convert';

class CommunityModel {
  CommunityModel({
    this.name,
    this.description,
    this.bornDate,
    this.id,
  });

  String? name;
  String? description;
  DateTime? bornDate;
  int? id;

  factory CommunityModel.fromRawJson(String str) =>
      CommunityModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CommunityModel.fromJson(Map<String, dynamic> json) => CommunityModel(
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        bornDate: json["born_date"] == null
            ? null
            : DateTime.parse(json["born_date"]),
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "born_date": bornDate == null
            ? null
            : "${bornDate?.year.toString().padLeft(4, '0')}-${bornDate?.month.toString().padLeft(2, '0')}-${bornDate?.day.toString().padLeft(2, '0')}",
        "id": id == null ? null : id,
      };
}
