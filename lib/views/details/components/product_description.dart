import 'package:db_vendor/controllers/favouritescontroller.dart';
import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/main.dart';
import 'package:db_vendor/modals/favorites.dart';
import 'package:db_vendor/modals/modals.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductDescription extends StatelessWidget {
  ProductDescription({
    Key key,
    @required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Products product;
  final GestureTapCallback pressOnSeeMore;
  final FavouritesController _favouriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text('Minimum Quantity: ' + product.setOf),
                  ],
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(15),
              ),
              product.salesPrice.toString().isEmpty ||
                      product.salesPrice == null
                  ? Text(
                      '₹' + product.regularPrice.toString(),
                      style: Theme.of(context).textTheme.headline6,
                    )
                  : Text(
                      '₹' + product.salesPrice.toString(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              _favouriteController.updateFavourites(product.id, context);
            },
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              width: getProportionateScreenWidth(64),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: ValueListenableBuilder<Box<FavouriteProduct>>(
                  valueListenable: favouritesBox.listenable(),
                  builder: (context, snapshot, _) {
                    return SvgPicture.asset(
                      'assets/icons/Heart Icon_2.svg',
                      color: snapshot.values
                              .toList()
                              .any((element) => element.id == product.id)
                          ? Color(0xffff4848)
                          : Colors.white,
                      height: getProportionateScreenWidth(16),
                    );
                  }),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            product.longDescription,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  'See More Detail',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
