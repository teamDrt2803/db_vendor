import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      padding: const EdgeInsets.all(4.0),
      child: new Container(
        width: 180,
        height: 200,
        color: Colors.white,
        child: Card(
          color: Colors.blueAccent.withOpacity(0.7),
          shadowColor: Colors.blueAccent.withOpacity(0.7),
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title.replaceAll('&amp;', '&'),
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
                textAlign: TextAlign.start,
              ),
              Center(
                child: CachedNetworkImage(
                  imageUrl: imageLink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List carouselItems = [
  "https://discount-bazaar.com/wp-content/uploads/2020/12/welcome-to-discount-bazaar7.jpg",
  "https://discount-bazaar.com/wp-content/uploads/2020/12/banner-end-of-season-01.jpg",
  "https://discount-bazaar.com/wp-content/uploads/2020/12/welcome-to-discount-bazaar41.jpg",
  "https://discount-bazaar.com/wp-content/uploads/2020/12/We-Deliver-Healthy-Co.2.jpg",
];

class TopProductsWidget extends StatelessWidget {
  const TopProductsWidget({
    Key key,
    this.title,
    this.imageLink,
    this.price,
    this.weight,
  }) : super(key: key);
  final String title, imageLink, price, weight;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 5,
        shadowColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.blueAccent, width: 2),
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: CachedNetworkImage(
                        imageUrl: imageLink,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        weight,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        "₹$price",
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
                margin: EdgeInsets.only(right: 5, bottom: 5),
                height: 50,
                width: 50,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
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
          ],
        ),
      ),
    );
  }
}
