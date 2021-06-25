import 'package:another_flushbar/flushbar_helper.dart';
import 'package:db_vendor/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:location/location.dart' as loc;

class GoogleMaps extends StatefulWidget {
  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  GooglePlace googlePlace;
  final AuthController _authController = Get.find();
  void getLocation() async {
    if (await loc.Location().hasPermission() == loc.PermissionStatus.granted) {
      // await FlushbarHelper.createError(
      //         message: 'Please grant location permission to proceed further')
      //     .show(context);
    } else {
      if ((await loc.Location().requestPermission() ==
          loc.PermissionStatus.granted)) {
      } else {
        await FlushbarHelper.createError(
                message: 'Please grant location permission to proceed further')
            .show(context);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    googlePlace = GooglePlace('AIzaSyDOoW-XOG22xHjOa9jM3jN7iHN4UxhsH2A');
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Get.back();
            }),
        brightness: Brightness.dark,
        backgroundColor: Color(0xff212223),
        title: Text('Select Your Location',
            style: TextStyle(
              color: Colors.white,
            )),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: GoogleMap(
        compassEnabled: true,
        onTap: (argument) async {
          await googlePlace.search
              .getNearBySearch(
                  Location(
                    lat: argument.latitude,
                    lng: argument.longitude,
                  ),
                  1500)
              .then((value) {
            if (value != null) {
              var results = value.results;
              Get.bottomSheet(
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: results.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              _authController.address.text =
                                  results[index].name;
                              Get.back(
                                closeOverlays: true,
                              );
                            },
                            title: Text(results[index].name),
                            leading: Image.network(
                              results[index].icon,
                              height: 24,
                              width: 24,
                            ),
                          );
                        }),
                  ),
                ),
              );
            }
          }).onError((error, stackTrace) {
            debugPrint(stackTrace.toString());
          });
        },
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(
          zoom: 19,
          target: LatLng(
            22.0574,
            78.9382,
          ),
        ),
      ),
    );
  }
}
