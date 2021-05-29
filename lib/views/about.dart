import 'package:db_vendor/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('About Us'),
      //   centerTitle: true,
      // ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GoogleFonts.openSans(
                        color: kTextColor,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: kPrimaryColor,
                          ),
                          text: 'Discount Bazaar ',
                        ),
                        TextSpan(
                          text:
                              'is an e-commerce mobile application selling channel of',
                        ),
                        TextSpan(
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: kPrimaryColor,
                          ),
                          text: ' Cool Cart',
                        ),
                        TextSpan(
                          text: ', having its registered office at:',
                        ),
                        TextSpan(
                          style: GoogleFonts.openSans(
                            fontStyle: FontStyle.italic,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                          text:
                              '\nSkyline Oasis\nVidyavihar (West)\nMumbai - 400086',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: GoogleFonts.openSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kTextColor,
                        ),
                        text: 'GSTIN: ',
                        children: [
                          TextSpan(
                            style: GoogleFonts.openSans(
                              fontStyle: FontStyle.italic,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.7,
                            ),
                            text: '   27DCWPG5751D1ZA',
                          )
                        ]),
                    // text:'GSTIN:  27DCWPG5751D1ZA',
                    // style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Powered by '),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/cc_logo.jpeg'),
                    )
                  ],
                ),
                Text('© All rights reserved.')
              ],
            )
          ],
        ),
      ),
    );
  }
}
