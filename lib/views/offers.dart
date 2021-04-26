import 'package:db_vendor/helpers/coustom_bottom_nav_bar.dart';
import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/helpers/enums.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OffersScreen extends StatefulWidget {
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f7f9),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.message),
      // appBar: AppBar(
      //   //title: Text('Offers'),
      //   backgroundColor: Color(0xfff6f7f9),
      //   leading: SizedBox.shrink(),
      // ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              OffersWidget(
                title: 'OFFERS\nCORNER',
              ),
              SizedBox(
                height: getProportionateScreenHeight(15.0),
              ),
              OffersWidget(

                
                title: 'BRAND\nOFFERS',
              ),
              SizedBox(
                height: getProportionateScreenHeight(15.0),
              ),
              OffersWidget(
                title: 'BRAND\nOFFERS',
              ),
              SizedBox(
                height: getProportionateScreenHeight(15.0),
              ),
              OffersWidget(
                title: 'BRAND\nOFFERS',
              ),
              SizedBox(
                height: getProportionateScreenHeight(15.0),
              ),
              OffersWidget(
                title: 'BRAND\nOFFERS',
              ),
              SizedBox(
                height: getProportionateScreenHeight(15.0),
              ),
              OffersWidget(
                title: 'BRAND\nOFFERS',
              ),
              SizedBox(
                height: getProportionateScreenHeight(15.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OffersWidget extends StatelessWidget {
  const OffersWidget({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(170),
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white70,
        shadowColor: Color(0xfff6f7f9),
        elevation: 8.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(110),
                child:
                    Image.asset('assets/speacialOffer.png', fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(20),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(48),
                      width: getProportionateScreenWidth(48),
                      child: FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: kPrimaryLightColor,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: kPrimaryColor,
                          size: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    Text(
                      'Click for More info',
                      style: GoogleFonts.openSans(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
