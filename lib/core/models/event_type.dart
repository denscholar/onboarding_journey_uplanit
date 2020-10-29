import 'dart:convert';

List<EventType> eventTypeFromJson(String str) => List<EventType>.from(json.decode(str).map((x) => EventType.fromJson(x)));

String eventTypeToJson(List<EventType> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventType {
    EventType({
        this.updatedAt,
        this.name,
        this.createdAt,
        this.eventTypeId,
        this.id,
    });

    AtedAt updatedAt;
    String name;
    AtedAt createdAt;
    String eventTypeId;
    String id;

    factory EventType.fromJson(Map<String, dynamic> json) => EventType(
        updatedAt: AtedAt.fromJson(json["updated_at"]),
        name: json["name"],
        createdAt: AtedAt.fromJson(json["created_at"]),
        eventTypeId: json["id"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "updated_at": updatedAt.toJson(),
        "name": name,
        "created_at": createdAt.toJson(),
        "id": eventTypeId,
        "_id": id,
    };
}

class AtedAt {
    AtedAt({
        this.year,
        this.month,
        this.day,
        this.hour,
        this.minute,
        this.second,
        this.nanosecond,
        this.timeZoneOffsetSeconds,
        this.timeZoneId,
    });

    Day year;
    Day month;
    Day day;
    Day hour;
    Day minute;
    Day second;
    Day nanosecond;
    Day timeZoneOffsetSeconds;
    dynamic timeZoneId;

    factory AtedAt.fromJson(Map<String, dynamic> json) => AtedAt(
        year: Day.fromJson(json["year"]),
        month: Day.fromJson(json["month"]),
        day: Day.fromJson(json["day"]),
        hour: Day.fromJson(json["hour"]),
        minute: Day.fromJson(json["minute"]),
        second: Day.fromJson(json["second"]),
        nanosecond: Day.fromJson(json["nanosecond"]),
        timeZoneOffsetSeconds: Day.fromJson(json["timeZoneOffsetSeconds"]),
        timeZoneId: json["timeZoneId"],
    );

    Map<String, dynamic> toJson() => {
        "year": year.toJson(),
        "month": month.toJson(),
        "day": day.toJson(),
        "hour": hour.toJson(),
        "minute": minute.toJson(),
        "second": second.toJson(),
        "nanosecond": nanosecond.toJson(),
        "timeZoneOffsetSeconds": timeZoneOffsetSeconds.toJson(),
        "timeZoneId": timeZoneId,
    };
}

class Day {
    Day({
        this.low,
        this.high,
    });

    int low;
    int high;

    factory Day.fromJson(Map<String, dynamic> json) => Day(
        low: json["low"],
        high: json["high"],
    );

    Map<String, dynamic> toJson() => {
        "low": low,
        "high": high,
    };
}

class Image {
    Image({
        this.path,
        this.name,
        this.path1M,
        this.imageId,
        this.id,
        this.key,
        this.tags,
    });

    String path;
    String name;
    String path1M;
    String imageId;
    String id;
    String key;
    List<Tag> tags;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        path: json["path"],
        name: json["name"],
        path1M: json["path1m"],
        imageId: json["id"],
        id: json["_id"],
        key: json["key"],
        tags: List<Tag>.from(json["tags"].map((x) => tagValues.map[x])),
    );

    Map<String, dynamic> toJson() => {
        "path": path,
        "name": name,
        "path1m": path1M,
        "id": imageId,
        "_id": id,
        "key": key,
        "tags": List<dynamic>.from(tags.map((x) => tagValues.reverse[x])),
    };
}

enum Tag { EVENT_TYPES, ADMIN }

final tagValues = EnumValues({
    "admin": Tag.ADMIN,
    "event types": Tag.EVENT_TYPES
});

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
