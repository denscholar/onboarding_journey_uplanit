import 'dart:convert';

import 'ated_at.dart';

List<Category> categoryFromJson(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category({
    this.image,
    this.plural,
    this.updatedAt,
    this.name,
    this.createdAt,
    this.active,
    this.description,
    this.categoryId,
    this.id,
    this.picture,
    this.selected,
  });

  String image;
  String plural;
  AtedAt updatedAt;
  String name;
  AtedAt createdAt;
  bool active;
  String description;
  String categoryId;
  String id;
  String picture;

  bool selected;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        image: json["image"],
        plural: json["plural"],
        updatedAt: AtedAt.fromJson(json["updated_at"]),
        name: json["name"],
        createdAt: AtedAt.fromJson(json["created_at"]),
        active: json["active"],
        description: json["description"],
        categoryId: json["id"],
        id: json["_id"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "plural": plural,
        "updated_at": updatedAt.toJson(),
        "name": name,
        "created_at": createdAt.toJson(),
        "active": active,
        "description": description,
        "id": categoryId,
        "_id": id,
        "picture": picture,
      };
}
