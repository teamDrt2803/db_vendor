import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_vendor/Authorization/controllers/woocontroller.dart';
import 'package:db_vendor/categoriesmodal.dart' as modal;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  final WooController wooController;

  const CategoriesScreen({Key key, this.wooController}) : super(key: key);
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    widget.wooController.getCategories(pageCount: 100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: Obx(
          () => ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: widget.wooController.categories.length,
            itemBuilder: (context, index) {
              modal.WooCategories categories =
                  widget.wooController.categories[index];
              var sub = widget.wooController.cat.firstWhere(
                          (element) =>
                              element['id'] == categories.id.toString(),
                          orElse: () => null) !=
                      null
                  ? widget.wooController.cat.firstWhere((element) =>
                      element['id'] == categories.id.toString())['total']
                  : 0;

              return categories.parent == 0 && categories.image != null
                  ? Card(
                      elevation: 5,
                      child: ExpansionTile(
                        children: List.generate(sub, (index) {
                          List<modal.WooCategories> categy = [];
                          for (modal.WooCategories a
                              in widget.wooController.categories) {
                            if (a.parent == categories.id) {
                              categy.add(a);
                            }
                          }
                          return categy.length < sub
                              ? SizedBox.shrink()
                              : ListTile(
                                  title: Text(categy[index].name),
                                  leading: CircleAvatar(
                                    backgroundImage: CachedNetworkImageProvider(
                                      categy[index].image == null
                                          ? categories.image.src
                                          : categy[index].image.src,
                                    ),
                                  ),
                                );
                        }),
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                            categories.image.src,
                          ),
                        ),
                        title: Text(
                          categories.name,
                        ),
                        subtitle: Text(sub.toString() + ' Subcategories'),
                      ),
                    )
                  : SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
