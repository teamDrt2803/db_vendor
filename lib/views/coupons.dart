import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/helpers/custappbar.dart';
import 'package:db_vendor/helpers/default_button.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CouponsScreen extends StatefulWidget {
  static String routesName = '/coupons';
  @override
  _CouponsScreenState createState() => _CouponsScreenState();
}

class _CouponsScreenState extends State<CouponsScreen> {
  final AuthController _authController = Get.find();
  final CartController _cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     var list = <Coupons>[
        //       Coupons(
        //         newCustomersOnly: true,
        //         imageURL:
        //             'https://cdn.pixabay.com/photo/2015/10/31/12/21/discount-1015443_960_720.jpg',
        //         code: 'DB10NEW',
        //         title:
        //             'Get 10% discount on your first ever order on Discount Bazaar Mobile App',
        //         description:
        //             'Get 10% discount upto Rs. 100 on your first ever order on Discount Bazaar. T&c\'s apply',
        //         maxDiscount: 100,
        //         type: '%',
        //         productSpecific: false,
        //         minCartValue: 0,
        //         productIds: [],
        //       ),
        //       Coupons(
        //         newCustomersOnly: true,
        //         imageURL:
        //             'https://w7.pngwing.com/pngs/992/181/png-transparent-graphy-welcome-text-photography-logo-thumbnail.png',
        //         code: 'WELCOME',
        //         title: 'Get FLAT 20 off for orders above 300',
        //         description:
        //             'Get FLAT 20 off for orders minimum cart value of 300. T&c\'s apply',
        //         maxDiscount: 20,
        //         type: 'Rs',
        //         productSpecific: false,
        //         minCartValue: 300,
        //         productIds: [],
        //       ),
        //     ];
        //     list.forEach((element) async {
        //       await _authController.firestore
        //           .collection('coupons')
        //           .add(element.toMap());
        //     });
        //     ;
        //   },
        // ),
        appBar: CustAppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text('Select Coupon'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              width: Get.width,
              // height: (96),
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.verified_outlined,
                      color: Colors.black,
                      size: 36,
                    ),
                    title: Text('Apply Coupon',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontWeight: FontWeight.bold)),
                    subtitle: Text('Enter promo code below'),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(
                    height: (16),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Promo Code',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: (16),
                  ),
                  DefaultButton(
                    press: () {},
                    text: 'Apply',
                    height: (36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              width: Get.width,
              // height: (96),
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: SvgPicture.asset(
                      'assets/icons/tag.svg',
                      height: 36,
                      width: 36,
                      color: kPrimaryColor,
                    ),
                    title: Text('Discount Deals',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontWeight: FontWeight.bold)),
                    subtitle: Text('See promo code below'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: _cartController.couponItems.length,
                  itemBuilder: (context, index) => Container(
                    height: Get.height * 0.2,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Image.network(
                            _cartController.couponItems[index].imageURL,
                            width: Get.width * 0.3,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Obx(
                              () => Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _cartController.couponItems[index].code +
                                        ': ' +
                                        _cartController
                                            .couponItems[index].title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                  ),
                                  Text(
                                    _cartController
                                        .couponItems[index].description,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              kPrimaryColor),
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(199),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      _cartController.selectedCoupon.value =
                                          _cartController.couponItems[index];

                                      Get.back();
                                    },
                                    child: Text('Apply'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
