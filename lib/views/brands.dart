import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/helpers/custappbar.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home/components/drawer.dart';

class BrandList extends StatefulWidget {
  @override
  _BrandListState createState() => _BrandListState();
}

class _BrandListState extends State<BrandList> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    brandsData.sort((a, b) => a['brandName'].compareTo(b['brandName']));
    return Scaffold(
      key: _scaffoldKey,
      drawer: Custdrawer(),
      appBar: CustAppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
        title: Text(
          'All Brands',
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Scrollbar(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: List.generate(26, (index) {
              var list = [];
              for (var item in brandsData) {
                if (item['brandName']
                    .toLowerCase()
                    .startsWith(alphabet[index])) {
                  list.add(item);
                }
              }
              list = list.toList();
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: list.isNotEmpty,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          alphabet[index].toUpperCase(),
                          style: GoogleFonts.openSans(
                            fontSize: getProportionateScreenWidth(
                              25,
                            ),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: list.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index1) {
                          var details = BrandDetails.fromJson(
                            list[index1],
                          );
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 4.0,
                            ),
                            child: SizedBox(
                              height: getProportionateScreenHeight(90),
                              width: getProportionateScreenWidth(90),
                              child: Card(
                                shadowColor: Colors.grey.shade200,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                ),
                                elevation: 8.0,
                                child: Center(
                                  child: ListTile(
                                    title: Text(
                                      details.brandName,
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    leading: SizedBox(
                                      height: getProportionateScreenHeight(70),
                                      width: getProportionateScreenWidth(70),
                                      child: CachedNetworkImage(
                                          imageUrl: details.imageUrl),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

var alphabet = [
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'y',
  'z',
];
