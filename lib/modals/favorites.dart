import 'package:hive/hive.dart';
part 'favorites.g.dart';

@HiveType(typeId: 8)
class FavouriteProduct {
  @HiveField(0)
  dynamic id;
  FavouriteProduct({this.id});
  FavouriteProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }
  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}
