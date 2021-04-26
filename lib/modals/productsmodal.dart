import 'package:hive/hive.dart';
part 'productsmodal.g.dart';

@HiveType(typeId: 10)
class Products {
  @HiveField(0)
  String longDescription;
  @HiveField(1)
  List<Images> images;
  @HiveField(2)
  dynamic quantity;
  @HiveField(3)
  dynamic salesPrice;
  @HiveField(4)
  dynamic regularPrice;
  @HiveField(5)
  dynamic weightG;
  @HiveField(6)
  String stockStatus;
  @HiveField(7)
  String length;
  @HiveField(8)
  dynamic rating;
  @HiveField(9)
  String shortDescription;
  @HiveField(10)
  String subCategory;
  @HiveField(11)
  String subbrand;
  @HiveField(12)
  String name;
  @HiveField(13)
  String width;
  @HiveField(14)
  dynamic onSale;
  @HiveField(15)
  dynamic id;
  @HiveField(16)
  String category;
  @HiveField(17)
  String brand;
  @HiveField(18)
  dynamic setOf;
  @HiveField(19)
  String height;

  Products(
      {this.longDescription,
      this.images,
      this.quantity,
      this.salesPrice,
      this.regularPrice,
      this.weightG,
      this.stockStatus,
      this.length,
      this.rating,
      this.shortDescription,
      this.subCategory,
      this.subbrand,
      this.name,
      this.width,
      this.onSale,
      this.id,
      this.category,
      this.brand,
      this.setOf,
      this.height});

  Products.fromJson(Map<String, dynamic> json) {
    longDescription = json['longDescription'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    quantity = json['quantity'];
    salesPrice = json['salesPrice'];
    regularPrice = json['regularPrice'];
    weightG = json['weight (g)'];
    stockStatus = json['stock-status'];
    length = json['length'];
    rating = json['rating'];
    shortDescription = json['short-description'];
    subCategory = json['sub-category'];
    subbrand = json['subbrand'];
    name = json['name'];
    width = json['width'];
    onSale = json['onSale'];
    id = json['id'];
    category = json['category'];
    brand = json['brand'];
    setOf = json['setOf'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['longDescription'] = this.longDescription;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    data['quantity'] = this.quantity;
    data['salesPrice'] = this.salesPrice;
    data['regularPrice'] = this.regularPrice;
    data['weight (g)'] = this.weightG;
    data['stock-status'] = this.stockStatus;
    data['length'] = this.length;
    data['rating'] = this.rating;
    data['short-description'] = this.shortDescription;
    data['sub-category'] = this.subCategory;
    data['subbrand'] = this.subbrand;
    data['name'] = this.name;
    data['width'] = this.width;
    data['onSale'] = this.onSale;
    data['id'] = this.id;
    data['category'] = this.category;
    data['brand'] = this.brand;
    data['setOf'] = this.setOf;
    data['height'] = this.height;
    return data;
  }
}

@HiveType(typeId: 11)
class Images {
  @HiveField(0)
  String number;
  @HiveField(1)
  String src;

  Images({this.number, this.src});

  Images.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    src = json['src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['src'] = this.src;
    return data;
  }
}
