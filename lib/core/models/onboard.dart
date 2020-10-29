import 'dart:convert';

import 'category.dart';
import 'event_type.dart';
import 'profile.dart';

Onboard onboardFromJson(String str) => Onboard.fromJson(json.decode(str));

String onboardToJson(Onboard data) => json.encode(data.toJson());

class Onboard {
    Onboard({
        this.profile,
        this.categories,
        this.eventTypes,
    });

    Profile profile;
    List<Category> categories;
    List<EventType> eventTypes;

    factory Onboard.fromJson(Map<String, dynamic> json) => Onboard(
        profile: Profile.fromJson(json["profile"]),
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        eventTypes: List<EventType>.from(json["event_types"].map((x) => EventType.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "profile": profile.toJson(),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "event_types": List<dynamic>.from(eventTypes.map((x) => x.toJson())),
    };
}