import 'package:hive/hive.dart';
part 'categorymodal.g.dart';

@HiveType(typeId: 9)
class CategoryModal {
  @HiveField(0)
  List<CatImages> images;
  @HiveField(1)
  String name;
  @HiveField(2)
  String description;
  @HiveField(3)
  int id;

  CategoryModal({this.images, this.name, this.description, this.id});

  CategoryModal.fromJson(Map<String, dynamic> json) {
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images.add(new CatImages.fromJson(v));
      });
    }
    name = json['name'];
    description = json['description'];
    id = int.parse(json['id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['description'] = this.description;
    data['id'] = this.id;
    return data;
  }
}

@HiveType(typeId: 10)
class CatImages {
  @HiveField(0)
  int number;
  @HiveField(1)
  String src;

  CatImages({this.number, this.src});

  CatImages.fromJson(Map<String, dynamic> json) {
    number = int.parse(json['number']);
    src = json['src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['src'] = this.src;
    return data;
  }
}
