import 'ated_at.dart';

class Profile {
    Profile({
        this.name,
        this.permalink,
        this.vendorId,
        this.description,
        this.category,
        this.createdAt,
        this.updatedAt,
        this.verified,
    });

    String name;
    String permalink;
    String vendorId;
    String description;
    String category;
    AtedAt createdAt;
    AtedAt updatedAt;
    bool verified;

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        name: json["name"],
        permalink: json["permalink"],
        vendorId: json["vendor_id"],
        description: json["description"],
        category: json["category"],
        createdAt: AtedAt.fromJson(json["created_at"]),
        updatedAt: AtedAt.fromJson(json["updated_at"]),
        verified: json["verified"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "permalink": permalink,
        "vendor_id": vendorId,
        "description": description,
        "category": category,
        "created_at": createdAt.toJson(),
        "updated_at": updatedAt.toJson(),
        "verified": verified,
    };
}
