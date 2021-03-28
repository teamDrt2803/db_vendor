class Storedetails {
  String storeName, state, city, postalcode, location, userName;
  bool setupComplete;

  Storedetails({
    this.city,
    this.location,
    this.postalcode,
    this.state,
    this.storeName,
    this.userName,
    this.setupComplete,
  });

  Storedetails.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    storeName = json['storeName'];
    state = json['state'];
    city = json['city'];
    postalcode = json['postalcode'];
    location = json['location'];
    setupComplete = json['setupComplete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = userName;
    data['storeName'] = storeName;
    data['state'] = state;
    data['city'] = city;
    data['postalcode'] = postalcode;
    data['location'] = location;
    data['setupComplete'] = setupComplete;
    return data;
  }
}
