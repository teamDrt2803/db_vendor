import 'package:carousel_slider/carousel_slider.dart';
import 'package:db_vendor/Authorization/controllers/authcontroller.dart';
import 'package:db_vendor/Authorization/controllers/woocontroller.dart'
    as wooctrlr;
import 'package:db_vendor/Authorization/views/categoriesscreen.dart';
import 'package:db_vendor/Authorization/views/otp.dart';
import 'package:db_vendor/Authorization/views/signIn.dart';
import 'package:db_vendor/categoriesmodal.dart' as modal;
import 'package:db_vendor/customwidget.dart';
import 'package:db_vendor/productsmodal.dart';
import 'package:db_vendor/singleproduct.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flappy_search_bar_fork/flappy_search_bar.dart';
import 'package:flappy_search_bar_fork/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  final AuthController controller;

  const Home({Key key, this.controller}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User user = FirebaseAuth.instance.currentUser;
  wooctrlr.WooController _wooController = Get.find();
  AuthController controller;
  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? Get.find();
    controller.user.listen((event) {
      if (mounted) {
        setState(() {
          user = event;
        });
      }
    });
    _wooController.getCategories(
      pageCount: 100,
    );
    _wooController.getTopProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipOval(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          user == null ? 'Unknown' : controller.userName.value,
                          textScaleFactor: 2.0,
                          style: GoogleFonts.openSans(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.4,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                onTap: () {
                  Get.to(() => OtpScreen(
                        authController: widget.controller,
                      ));
                },
                leading: Icon(
                  Icons.shopping_bag,
                ),
                title: Text(
                  'Your Orders',
                ),
                subtitle: Text(
                  'Navigate to your orders section',
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Divider(
                  thickness: 1.2,
                ),
              ),
              ListTile(
                onTap: user == null
                    ? () {
                        Get.to(
                          () => Authorize(
                            authController: widget.controller,
                          ),
                        );
                      }
                    : () {
                        widget.controller.signOut(context);
                      },
                leading: Icon(
                  user == null ? Icons.login : Icons.logout,
                ),
                title: Text(
                  user == null ? 'Log In' : 'Log Out',
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    "Hello ${controller.userName.value ?? 'User'}",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(
                        0xff212223,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    "Welcome to Discount Bazaar",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Flexible(
                    child: SizedBox(
                  height: 15,
                )),
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: SearchBar(
                        hintText: "Search",
                        searchBarStyle: SearchBarStyle(
                            borderRadius: BorderRadius.circular(20)),
                        // ignore: missing_return
                        onSearch: (s) {},
                        // ignore: missing_return
                        onItemFound: (item, int index) {},
                      ),
                    ),
                  ],
                ),
                Flexible(
                    child: SizedBox(
                  height: 15,
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Top Categories',
                        textAlign: TextAlign.start,
                        textScaleFactor: 1.5,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.7,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(
                            () => CategoriesScreen(
                              wooController: _wooController,
                            ),
                          );
                        },
                        child: Text('See All'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => SizedBox(
                      height: MediaQuery.of(context).size.height * 0.28,
                      child: _wooController.categories.length >= 10
                          ? ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              clipBehavior: Clip.none,
                              itemBuilder: (context, index) {
                                modal.WooCategories categories =
                                    _wooController.categories[index];
                                return categories.image != null
                                    ? CategoryCard(
                                        title: categories.name,
                                        imageLink: categories.image.src,
                                      )
                                    : SizedBox.shrink();
                              },
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                    ),
                  ),
                ),
                CarouselSlider(
                  items: carouselItems
                      .map(
                        (item) => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Image.network(
                              item,
                              //fit: BoxFit.fill,
                              width: 330,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                      autoPlay: true,
                      height: 200,
                      aspectRatio: 16 / 9,
                      initialPage: 0,
                      enlargeCenterPage: true),
                ),
                Flexible(
                  child: SizedBox(
                    height: 15,
                  ),
                ),
                Obx(
                  () => SizedBox(
                    height: MediaQuery.of(context).size.height * 0.20,
                    child: _wooController.topProducts.length >= 10
                        ? ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            clipBehavior: Clip.none,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              WooProducts products =
                                  _wooController.topProducts[index];
                              return products.images != null
                                  ? InkWell(
                                      onTap: () {
                                        Get.to(() =>
                                            SingleProduct(products: products));
                                      },
                                      child: TopProductsWidget(
                                        title: products.name,
                                        imageLink: products.images.first.src,
                                        price: products.price,
                                        weight: products.attributes.length > 0
                                            ? products
                                                .attributes.first.options.first
                                            : '',
                                      ),
                                    )
                                  : SizedBox.shrink();
                            },
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
