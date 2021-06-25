import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_vendor/views/address/address.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:db_vendor/helpers/extensions.dart';

class Body extends StatefulWidget {
  final double discount;
  final double cartTotal;

  const Body({Key key, this.discount, this.cartTotal}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthController _authController = Get.find();

  final CartController _cartController = Get.find();

  var selectedAddress = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Delivering to'.toUpperCase(),
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Center(
                    child: Obx(
                      () => Text(
                        _authController.firestoreUser.value.displayName,
                        style: GoogleFonts.openSans(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Obx(
                      () => Text(
                        _authController.userStream.value.phoneNumber,
                        style: GoogleFonts.openSans(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
              Divider(
                color: Colors.grey.shade400,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    () => DeliveryInfoItem(
                      showChange: true,
                      iconData: Icons.local_shipping_outlined,
                      title: 'Delivery Address',
                      subtitle: _cartController.addressItems.isEmpty
                          ? 'Please add new Address'
                          : _cartController.addressItems[selectedAddress]
                              .toString(),
                      onPressed: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              return CupertinoActionSheet(
                                title: Text('Select an Address'),
                                message: Text(
                                    'Select an existing address or Add a new one for the product to be delivered'),
                                cancelButton: CupertinoActionSheetAction(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    'Cancel',
                                  ),
                                ),
                                actions: [
                                  ...List.generate(
                                      _cartController.addressItems.length,
                                      (index) {
                                    return CupertinoActionSheetAction(
                                        onPressed: () {
                                          setState(() {
                                            selectedAddress = index;
                                          });
                                          Get.back();
                                        },
                                        child: Text(_cartController
                                            .addressItems[index]
                                            .toString()
                                            .replaceAll('\n', '')));
                                  }),
                                  CupertinoActionSheetAction(
                                      onPressed: () {
                                        Get.back();
                                        Get.to(() => AddressScreen());
                                      },
                                      child: Text('Add new Address'))
                                ],
                              );
                            });
                      },
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade400,
                  ),
                  DeliveryInfoItem(
                    showChange: false,
                    iconData: Icons.timer_sharp,
                    title: 'Delivery Time',
                    subtitle: 'Delivery by tomorrow',
                    onPressed: () {},
                  ),
                  Divider(
                    color: Colors.grey.shade400,
                  ),
                  DeliveryInfoItem(
                    showChange: false,
                    iconData: Icons.credit_card_outlined,
                    title: 'Payment Method',
                    subtitle: 'COD',
                    onPressed: () {},
                  ),
                  Divider(
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.125,
                child: Obx(
                  () => ListView.builder(
                    itemCount: _cartController.cartItems.length,
                    clipBehavior: Clip.none,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var cart = _cartController.cartItems[index];
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        width: SizeConfig.screenWidth * 0.7,
                        height: SizeConfig.screenHeight * 0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              color: Colors.grey.shade200,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Center(
                          child: ListTile(
                            leading: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: cart.wooProducts.images.first.src,
                            ),
                            title: Text(cart.wooProducts.name),
                            subtitle: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Quantity: ${cart.totalQuantity}',
                                ),
                                Text(
                                  cart.wooProducts.salesPrice
                                      .toString()
                                      .rupee(),
                                  style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            isThreeLine: true,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: GoogleFonts.roboto(
                              color: kSecondaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '${widget.cartTotal.toString().rupee()}',
                            style: GoogleFonts.roboto(
                              color: kSecondaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping Fee',
                            style: GoogleFonts.roboto(
                              color: kSecondaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '+ ' + '40'.rupee(),
                            style: GoogleFonts.roboto(
                              color: Colors.green,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tax',
                            style: GoogleFonts.roboto(
                              color: kSecondaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '+ ' + '100'.rupee(),
                            style: GoogleFonts.roboto(
                              color: Colors.green,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Discount',
                            style: GoogleFonts.roboto(
                              color: kSecondaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '- ' + '${widget.discount}'.rupee(),
                            style: GoogleFonts.roboto(
                              color: Colors.red,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: GoogleFonts.roboto(
                              color: kSecondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                          Text(
                            '${widget.cartTotal + 40 + 100}'.rupee(),
                            style: GoogleFonts.roboto(
                              color: kSecondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeliveryInfoItem extends StatelessWidget {
  const DeliveryInfoItem({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.onPressed,
    @required this.iconData,
    @required this.showChange,
  }) : super(key: key);
  final String title, subtitle;
  final void Function() onPressed;
  final IconData iconData;
  final bool showChange;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 24,
      leading: Icon(iconData),
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.openSans(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Visibility(
        visible: showChange,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            'CHANGE'.capitalizeFirst,
            style: GoogleFonts.openSans(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
            ),
          ),
        ),
      ),
    );
  }
}
