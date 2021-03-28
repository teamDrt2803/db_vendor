import 'package:db_vendor/custom/customimageprovider.dart';
import 'package:db_vendor/productsmodal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleProduct extends StatefulWidget {
  final WooProducts products;

  const SingleProduct({Key key, @required this.products}) : super(key: key);
  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6b114),
      //appBar: AppBar(),
      body: SafeArea(
        child: Container(
            child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: SizedBox(
                          height: 55,
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                999,
                              ),
                            ),
                            elevation: 6,
                            child: Center(
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: IconButton(
                                      iconSize: 16,
                                      tooltip: 'Back',
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.amber,
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.search_outlined,
                                        color: Colors.amber,
                                      ),
                                      onPressed: () {},
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.products.name,
                        textScaleFactor: 1.7,
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Price',
                          textScaleFactor: 1.7,
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '₹' + widget.products.price,
                          textScaleFactor: 1.7,
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      50,
                    ),
                    topRight: Radius.circular(
                      50,
                    ),
                  ),
                ),
                height: MediaQuery.of(
                      context,
                    ).size.height *
                    0.67,
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.55,
              top: MediaQuery.of(context).size.height * 0.2,
              child: SizedBox(
                height: 150,
                width: 150,
                child: Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(10, 5),
                      child: Transform.scale(
                        scale: 1,
                        child: Opacity(
                          opacity: 0.2,
                          child: Image.network(
                            widget.products.images.first.src,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Image(
                      image: CustImageProvider(
                        NetworkImage(
                          widget.products.images.first.src,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
