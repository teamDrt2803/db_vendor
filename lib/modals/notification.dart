import 'dart:convert';

import 'package:hive/hive.dart';
part 'notification.g.dart';

@HiveType(typeId: 20)
class NotificationData {
  @HiveField(0)
  final String total;
  @HiveField(1)
  final String route;
  @HiveField(2)
  final String orderId;
  @HiveField(3)
  final String imageUrl;
  @HiveField(4)
  final String purchase_date;
  @HiveField(5)
  final String body;
  @HiveField(6)
  final String type;
  @HiveField(7)
  final String title;
  NotificationData({
    this.total,
    this.route,
    this.orderId,
    this.imageUrl,
    this.purchase_date,
    this.body,
    this.type,
    this.title,
  });

  NotificationData copyWith({
    String total,
    String route,
    String orderId,
    String imageUrl,
    String purchase_date,
    String body,
    String type,
    String title,
  }) {
    return NotificationData(
      total: total ?? this.total,
      route: route ?? this.route,
      orderId: orderId ?? this.orderId,
      imageUrl: imageUrl ?? this.imageUrl,
      purchase_date: purchase_date ?? this.purchase_date,
      body: body ?? this.body,
      type: type ?? this.type,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'route': route,
      'orderId': orderId,
      'imageUrl': imageUrl,
      'purchase_date': purchase_date,
      'body': body,
      'type': type,
      'title': title,
    };
  }

  factory NotificationData.fromMap(Map<String, dynamic> map) {
    return NotificationData(
      total: map['total'],
      route: map['route'],
      orderId: map['orderId'],
      imageUrl: map['imageUrl'],
      purchase_date: map['purchase_date'],
      body: map['body'],
      type: map['type'],
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationData.fromJson(String source) =>
      NotificationData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NotificationData(total: $total, route: $route, orderId: $orderId, imageUrl: $imageUrl, purchase_date: $purchase_date, body: $body, type: $type, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NotificationData &&
        other.total == total &&
        other.route == route &&
        other.orderId == orderId &&
        other.imageUrl == imageUrl &&
        other.purchase_date == purchase_date &&
        other.body == body &&
        other.type == type &&
        other.title == title;
  }

  @override
  int get hashCode {
    return total.hashCode ^
        route.hashCode ^
        orderId.hashCode ^
        imageUrl.hashCode ^
        purchase_date.hashCode ^
        body.hashCode ^
        type.hashCode ^
        title.hashCode;
  }
}
