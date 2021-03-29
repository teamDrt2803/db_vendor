import 'dart:ui';

import 'package:db_vendor/Global/Constants.dart';
import 'package:flappy_search_bar_fork/flappy_search_bar.dart';
import 'package:flappy_search_bar_fork/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

//HomeScreen
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 15),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(
                    "Hello User,",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  subtitle: Text(
                    "Welcome to Discount Bazaar",
                    style: TextStyle(
                      fontSize: 18,
                      color: primary,
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
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: SearchBar(
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        hintText: "Search Here",
                        searchBarStyle: SearchBarStyle(
                            backgroundColor: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        onSearch: (s) {},
                        onItemFound: (item, int index) {},
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: MediaQuery.of(context).size.height * 0.22,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 2,
                    child: Image.network(
                        "https://discount-bazaar.com/wp-content/uploads/2021/03/Savings.png"),
                  ),
                ),
                Flexible(
                    child: SizedBox(
                  height: 15,
                )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Categories",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(color: secondary),
                      ),
                    ],
                  ),
                ),
                Flexible(
                    child: SizedBox(
                  height: 15,
                )),
                Container(
                  height: 200,
                  width: double.infinity,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (ctxt, index) {
                      return CategoryCard(
                        title: categories[index]['name'],
                        imageLink: categories[index]['Image'],
                      );
                    },
                  ),
                ),
                Flexible(
                    child: SizedBox(
                  height: 15,
                )),
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "Top of the Week",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: 15,
                  ),
                ),
                Container(
                  height: 150,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: MediaQuery.of(context).size.width,
                  child: InkWell(
                    highlightColor: Colors.amberAccent,
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.blueAccent, width: 3),
                      ),
                      child: Stack(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(
                                    "https://discount-bazaar.com/wp-content/uploads/2020/12/71XL4HadjvL._SL1500_.jpg",
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Wagh Bakri\nPremium Tea",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "250 gm\t- 1 kg",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "₹117\t - ₹475",
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              color: Colors.blueAccent,
                              child: IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    this.title,
    this.imageLink,
  }) : super(key: key);
  final String title, imageLink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: new Container(
        width: 150,
        height: 150,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(color: secondary, width: 2)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              Center(
                child: Image.network(
                  imageLink,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//AlertsScreen
class Alert extends StatefulWidget {
  @override
  _AlertState createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//AllBrands
class AllBrands extends StatefulWidget {
  @override
  _AllBrandsState createState() => _AllBrandsState();
}

class _AllBrandsState extends State<AllBrands> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

List carouselItems = [
  "https://discount-bazaar.com/wp-content/uploads/2020/12/welcome-to-discount-bazaar7.jpg",
  "https://discount-bazaar.com/wp-content/uploads/2020/12/banner-end-of-season-01.jpg",
  "https://discount-bazaar.com/wp-content/uploads/2020/12/welcome-to-discount-bazaar41.jpg",
  "https://discount-bazaar.com/wp-content/uploads/2020/12/We-Deliver-Healthy-Co.2.jpg",
];

List categories = [
  {
    'name': 'Soft Drinks',
    'Image': 'https://discount-bazaar.com/wp-content/uploads/2020/12/6.png'
  },
  {
    'name': 'Dairy & Bakery',
    'Image': 'https://discount-bazaar.com/wp-content/uploads/2020/12/4.png'
  },
  {
    'name': 'Grocery',
    'Image': 'https://discount-bazaar.com/wp-content/uploads/2020/12/4.png'
  },
  {
    'name': 'Baby Care',
    'Image': 'https://discount-bazaar.com/wp-content/uploads/2020/12/1.png'
  },
  {
    'name': 'Detergents',
    'Image': 'https://discount-bazaar.com/wp-content/uploads/2020/12/5.png'
  },
];
