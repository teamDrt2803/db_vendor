import 'package:db_vendor/categoriesmodal.dart';
import 'package:db_vendor/productsmodal.dart';
import 'package:db_vendor/singlecategorymodal.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../constants.dart';

class WooController extends GetxController {
  final categories = [].obs;
  final cat = [].obs;
  final topProducts = [].obs;

  @override
  onInit() {
    super.onInit();
    getTopProducts();
  }

  getCategories({int pageCount}) async {
    if (pageCount == null) {
      pageCount = 10;
    }
    final response = await http.get(
      Uri.parse(Consts.url +
          Consts.prroductEp +
          '?consumer_key=${Consts.consumerKey}&consumer_secret=${Consts.consumerSecret}&per_page=$pageCount'),
    );

    final responseJson = json.decode(response.body);
    for (dynamic rsp in responseJson) {
      var cat = WooCategories.fromJson(rsp);
      if (!categories.any((element) {
        if (element.id != cat.id) {
          return false;
        }
        return true;
      })) {
        categories.add(cat);
        getSubCategories(id: cat.id.toString());
      }
    }
  }

  getCategorDetails({String link}) async {
    final response = await http.get(
      Uri.parse(link +
          '?consumer_key=${Consts.consumerKey}&consumer_secret=${Consts.consumerSecret}'),
    );

    final responseJson = json.decode(response.body);
    SingleCategory category = SingleCategory.fromJson(responseJson);
    print(category.id);
  }

  getSubCategories({String id}) async {
    final response = await http.get(
      Uri.parse(
        'https://discount-bazaar.com/wp-json/wc/v3/products/categories/?parent=' +
            id +
            '&consumer_key=${Consts.consumerKey}&consumer_secret=${Consts.consumerSecret}',
      ),
    );
    final responseJson = json.decode(response.body);
    if (!cat.any(
      (element) => element['id'] == id,
    )) {
      cat.add({
        'id': id,
        'total': responseJson.length,
      });
    } else {
      cat.where((element) => element['id'] == id).first['total'] =
          responseJson.length;
    }
  }

  Future<String> getSubCategoriesString({String id}) async {
    final response = await http.get(
      Uri.parse(
        'https://discount-bazaar.com/wp-json/wc/v3/products/categories/?parent=' +
            id +
            '&consumer_key=${Consts.consumerKey}&consumer_secret=${Consts.consumerSecret}',
      ),
    );
    final responseJson = json.decode(response.body);

    return responseJson.length.toString();
  }

  getTopProducts() async {
    final response = await http.get(Uri.parse(
        'https://discount-bazaar.com/wp-json/wc/v3/products?orderby=popularity&order=desc&consumer_key=ck_a8200f8c74b2f73c16a7e178b954c7977891000c&consumer_secret=cs_043642983a3d8799b786429a154264cb400d7fd2'));
    final responseJson = json.decode(response.body);
    for (dynamic rsp in responseJson) {
      WooProducts wooProducts = WooProducts.fromJson(rsp);
      topProducts.add(wooProducts);
    }
  }
}
