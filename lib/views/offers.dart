import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/helpers/custappbar.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home/components/drawer.dart';

class OffersScreen extends StatefulWidget {
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: Custdrawer(),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.message),
      appBar: CustAppBar(
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
            icon: Icon(Icons.menu)),
        title: Text('Offers'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: ListView(
            clipBehavior: Clip.none,
            physics: BouncingScrollPhysics(),
            children: [
              OffersWidget(
                title: 'OFFERS\nCORNER',
              ),
              SizedBox(
                height: (15.0),
              ),
              OffersWidget(
                title: 'BRAND\nOFFERS',
              ),
              SizedBox(
                height: (15.0),
              ),
              OffersWidget(
                title: 'BRAND\nOFFERS',
              ),
              SizedBox(
                height: (15.0),
              ),
              OffersWidget(
                title: 'BRAND\nOFFERS',
              ),
              SizedBox(
                height: (15.0),
              ),
              OffersWidget(
                title: 'BRAND\nOFFERS',
              ),
              SizedBox(
                height: (15.0),
              ),
              OffersWidget(
                title: 'BRAND\nOFFERS',
              ),
              SizedBox(
                height: (15.0),
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
      height: (170),
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
                height: (110),
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
                        fontSize: (20),
                      ),
                    ),
                    SizedBox(
                      height: (10),
                    ),
                    SizedBox(
                      height: (48),
                      width: (48),
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
                      height: (5),
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
