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

  CategoryModal({images, name, description, id});

  CategoryModal.fromJson(Map<String, dynamic> json) {
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images.add(CatImages.fromJson(v));
      });
    }
    name = json['name'];
    description = json['description'];
    id = int.parse(json['id']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (images != null) {
      data['images'] = images.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['description'] = description;
    data['id'] = id;
    return data;
  }
}

@HiveType(typeId: 10)
class CatImages {
  @HiveField(0)
  int number;
  @HiveField(1)
  String src;

  CatImages({number, src});

  CatImages.fromJson(Map<String, dynamic> json) {
    number = int.parse(json['number']);
    src = json['src'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['number'] = number;
    data['src'] = src;
    return data;
  }
}
