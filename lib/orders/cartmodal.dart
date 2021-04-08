import 'package:db_vendor/productsmodal.dart';
import 'package:hive/hive.dart';
part 'cartmodal.g.dart';

@HiveType(typeId: 4)
class CartModal {
  @HiveField(0)
  int totalQuantity = 0;
  @HiveField(1)
  WooProducts wooProducts;

  CartModal({this.totalQuantity, this.wooProducts});
}
