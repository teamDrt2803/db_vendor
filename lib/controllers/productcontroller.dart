import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:db_vendor/modals/categorymodal.dart';
import 'package:db_vendor/modals/modals.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  RxList<Products> products = <Products>[].obs;
  RxList<Products> allProducts = <Products>[].obs;
  RxList<Products> allProductsByCat = <Products>[].obs;
  RxList<CategoryModal> categories = <CategoryModal>[].obs;
  List<List<QueryDocumentSnapshot>> documentList = [];
  QueryDocumentSnapshot lastDoc;
  final scrollController = ScrollController();
  final hasNext = true.obs;
  final limit = 20;
  final fetching = false.obs;
  final currentProductPage = 0.obs;
  @override
  void onInit() {
    getTopProducts();
    getCategories();
    //getAllProducts();
    super.onInit();
  }

  void getTopProducts() async {
    firestore.collection('products').limit(20).snapshots().listen((event) {
      products.clear();
      for (var product in event.docChanges) {
        var newProduct = Products.fromJson(product.doc.data());
        if (!products.any((element) => element.id == newProduct.id)) {
          products.add(newProduct);
        }
      }
    });
  }

  void getCategories() async {
    firestore.collection('categories').snapshots().listen((event) {
      for (var product in event.docChanges) {
        categories.add(CategoryModal.fromJson(product.doc.data()));
      }
    });
  }

  void getProductBYCategory(String catId) {
    firestore
        .collection('products')
        .where('catId', isEqualTo: catId)
        .snapshots()
        .listen((event) {
      allProducts.clear();
      for (var product in event.docChanges) {
        var newProduct = Products.fromJson(product.doc.data());
        if (!allProducts.any((element) => element.id == newProduct.id)) {
          allProducts.add(newProduct);
        }
      }
    });
  }

  void getAllProducts() async {
    fetching.value = true;
    var localDocumentList = await firestore
        .collection('products')
        .limit(limit)
        .orderBy('id')
        .get()
        .then((value) => value.docs);
    if (localDocumentList.isNotEmpty) {
      documentList.add(localDocumentList);
      allProducts.clear();
      for (var product in localDocumentList) {
        var newProduct = Products.fromJson(product.data());
        allProducts.add(newProduct);
      }
      if (localDocumentList.length < limit) {
        hasNext.value = false;
      } else {
        hasNext.value = true;
      }
      lastDoc = localDocumentList.last;
    }
    fetching.value = false;
  }

  Future<void> getNextProducts() async {
    if (!hasNext.value) return;
    if (fetching.value) return;
    try {
      fetching.value = true;
      print('First');
      print(currentProductPage.value);
      var newDocumentList = await firestore
          .collection('products')
          .orderBy('id')
          .startAfterDocument(lastDoc)
          .limit(limit)
          .get()
          .then(
            (value) => value.docs,
          );
      if (newDocumentList.length < limit) {
        print('right');
        hasNext.value = false;
      } else {
        hasNext.value = true;
      }
      lastDoc = newDocumentList.last;
      if (newDocumentList.isNotEmpty) {
        documentList.add(newDocumentList);
        allProducts.clear();
        for (var product in newDocumentList) {
          var newProduct = Products.fromJson(product.data());
          allProducts.add(newProduct);
        }
        currentProductPage.value++;

        lastDoc = newDocumentList.last;
      }
    } catch (e) {
      print(e.toString());
    } finally {
      fetching.value = false;
    }
  }

  void getPreviousProducts() async {
    fetching.value = true;
    if (!(currentProductPage.value <= 0)) {
      var dlist = documentList[currentProductPage.value - 1];
      allProducts.clear();
      if (dlist.isNotEmpty) {
        for (var product in dlist) {
          var newProduct = Products.fromJson(product.data());
          allProducts.add(newProduct);
        }
        currentProductPage.value--;
        hasNext.value = true;
        lastDoc = dlist.last;
      }
    }
    fetching.value = false;
  }

  // getALlCategories() async {}
}
