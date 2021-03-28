import 'package:db_vendor/Authorization/bindings/initialbindings.dart';
import 'package:db_vendor/constants.dart';
import 'package:db_vendor/custom/restartwidget.dart';
import 'package:db_vendor/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(
    Phoenix(
      child: GetMaterialApp(
        initialBinding: InitialBindings(),
        debugShowCheckedModeBanner: false,
        title: Consts.app_name,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.blueAccent,
            ),
            actionsIconTheme: IconThemeData(
              color: Colors.blueAccent,
            ),
            centerTitle: true,
            brightness: Brightness.dark,
            titleTextStyle: GoogleFonts.openSans(
              color: Color(0xff212223),
              letterSpacing: 2.0,
            ),
          ),
        ),
        home: Wrapper(),
      ),
    ),
  );
}
