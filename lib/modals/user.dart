import 'dart:convert';

class FirestoreUser {
  final String email;
  final String displayName;
  final String city;
  final String state;
  final String postalCode;
  final bool setupComplete;
  final String storeName;
  final String fcmToken;
  FirestoreUser({
    this.email = '',
    this.displayName = 'Unknown',
    this.city = 'Chhindwara',
    this.state = 'Madhya Pradesh',
    this.postalCode = '480001',
    this.setupComplete = false,
    this.storeName = '',
    this.fcmToken = '',
  });

  FirestoreUser copyWith({
    String email,
    String displayName,
    String city,
    String state,
    String postalCode,
    bool setupComplete,
    String storeName,
    String fcmToken,
  }) {
    return FirestoreUser(
        email: email ?? this.email,
        displayName: displayName ?? this.displayName,
        city: city ?? this.city,
        state: state ?? this.state,
        postalCode: postalCode ?? this.postalCode,
        setupComplete: setupComplete ?? this.setupComplete,
        storeName: storeName ?? this.storeName,
        fcmToken: fcmToken ?? this.fcmToken);
  }

  Map<String, dynamic> toMap() => {
        'email': email,
        'displayName': displayName,
        'city': city,
        'state': state,
        'postalCode': postalCode,
        'setupComplete': setupComplete,
        'storeName': storeName,
        'fcmToken': fcmToken,
      };

  factory FirestoreUser.fromMap(Map<String, dynamic> map) {
    if (map == null) return FirestoreUser();
    return FirestoreUser(
      email: map['email'],
      displayName: map['displayName'],
      city: map['city'],
      state: map['state'],
      postalCode: map['postalCode'],
      setupComplete: map['setupComplete'],
      storeName: map['storeName'],
      fcmToken: map['fcmToken'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FirestoreUser.fromJson(String source) =>
      FirestoreUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FirestoreUser(email: $email, displayName: $displayName, city: $city, state: $state, postalCode: $postalCode, setupComplete: $setupComplete, storeName: $storeName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FirestoreUser &&
        other.email == email &&
        other.displayName == displayName &&
        other.city == city &&
        other.state == state &&
        other.postalCode == postalCode &&
        other.setupComplete == setupComplete &&
        other.storeName == storeName &&
        other.fcmToken == fcmToken;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        displayName.hashCode ^
        city.hashCode ^
        state.hashCode ^
        postalCode.hashCode ^
        setupComplete.hashCode ^
        storeName.hashCode ^
        fcmToken.hashCode;
  }
}
