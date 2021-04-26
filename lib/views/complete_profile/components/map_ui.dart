import 'package:db_vendor/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:location/location.dart' as loc;

import 'package:db_vendor/helpers/page.dart';

loc.LocationData _location;
List<SearchResult> addresses;

class MapUiPage extends GoogleMapExampleAppPage {
  MapUiPage() : super(const Icon(Icons.map), 'Select Location');

  @override
  Widget build(BuildContext context) {
    return const MapUiBody();
  }
}

class MapUiBody extends StatefulWidget {
  const MapUiBody();

  @override
  State<StatefulWidget> createState() => MapUiBodyState();
}

class MapUiBodyState extends State<MapUiBody> {
  GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  var actionIcon = Icon(Icons.search_outlined);
  Widget appBarTitle = new Text("Select Location");
  bool automaticallyImplyLeading = true;
  TextEditingController _searchQuery = TextEditingController();
  var appBarColor = Color(0xff212223);
  bool _isSearching = false;
  static SearchResult currentaAddress;
  static DetailsResult detailsResult;
  _showListofAddress() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            child: addresses == null || addresses.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Text(
                        "Select a corresponding address from the list.",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff212223),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: addresses.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    onTap: () async {
                                      getDetils(addresses[index].placeId);
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    leading: Icon(
                                      Icons.location_on,
                                      color: Colors.blueAccent,
                                    ),
                                    title: Text(
                                      addresses[index].name,
                                      style: TextStyle(
                                          color: Color(0xff212223),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }

  static LatLng selectedLocation;
  getLOcation() async {
    if (await loc.Location().hasPermission() == loc.PermissionStatus.granted) {
      _location = await loc.Location().getLocation();
      selectedLocation = LatLng(
        _location.latitude,
        _location.longitude,
      );
    } else {
      if (await loc.Location().requestPermission() ==
          loc.PermissionStatus.granted) {
        _location = await loc.Location().getLocation();
        selectedLocation = LatLng(
          _location.latitude,
          _location.longitude,
        );
      }
    }
  }

  MapUiBodyState();

  @override
  void initState() {
    String apiKey = "AIzaSyDOoW-XOG22xHjOa9jM3jN7iHN4UxhsH2A";
    googlePlace = GooglePlace(apiKey);
    addresses = [];
    getLOcation();
    super.initState();
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      setState(() {
        predictions = result.predictions;
      });
    }
  }

  Future<void> getDetils(String placeId) async {
    var result = await this.googlePlace.details.get(placeId);
    if (result != null && result.result != null && mounted) {
      setState(() {
        detailsResult = result.result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: appBarTitle,
        actions: [
          IconButton(
            icon: actionIcon,
            onPressed: () {
              if (this.actionIcon.icon == Icons.search_outlined) {
                setState(() {
                  this._isSearching = true;
                  this.appBarColor = Colors.white;
                  this.automaticallyImplyLeading = false;
                  this.actionIcon = new Icon(
                    Icons.cancel_sharp,
                    color: Color(0xff212223),
                  );
                  this.appBarTitle = new TextField(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        autoCompleteSearch(value);
                      } else {
                        if (predictions.length > 0 && mounted) {
                          setState(
                            () {
                              predictions = [];
                            },
                          );
                        }
                      }
                    },
                    controller: _searchQuery,
                    style: TextStyle(
                      color: Color(0xff212223),
                    ),
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: Color(0xff212223),
                      ),
                      hintText: "Search..",
                      hintStyle: TextStyle(color: Color(0xff212223)),
                    ),
                  );
                });
              } else {
                setState(
                  () {
                    this._isSearching = false;
                    this.appBarColor = Color(0xff212223);
                    automaticallyImplyLeading = true;
                    this.actionIcon = new Icon(Icons.search_outlined);
                    this.appBarTitle = new Text("Select Location");
                  },
                );
              }
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: getLOcation(),
        builder: (context, snapshot) {
          //addresses.clear();
          return _location != null
              ? _isSearching
                  ? new Container(
                      child: ListView.builder(
                        itemCount: predictions.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () async {
                                    await getDetils(predictions[index].placeId);
                                    Navigator.pop(context);
                                  },
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.location_on,
                                      color: Color(0xff212223),
                                    ),
                                    title: Text(
                                      predictions[index].description,
                                      style: TextStyle(
                                          color: Color(0xff212223),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  : GoogleMap(
                      compassEnabled: true,
                      onTap: (argument) async {
                        selectedLocation = argument;

                        var addresses1 =
                            await googlePlace.search.getNearBySearch(
                          Location(
                            lat: MapUiBodyState.selectedLocation.latitude,
                            lng: MapUiBodyState.selectedLocation.longitude,
                          ),
                          1500,
                        );
                        addresses = addresses1.results;

                        _showListofAddress();
                      },
                      mapType: MapType.normal,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      initialCameraPosition: CameraPosition(
                        zoom: 22,
                        target: LatLng(22.0574, 78.9382),
                      ),
                    )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class GoogleMaps extends StatefulWidget {
  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  AuthController _authController = Get.find();

  GooglePlace googlePlace;

  Future<bool> getLocation() async {
    if (await loc.Location().hasPermission() == loc.PermissionStatus.granted) {
      return true;
    } else {
      if (await loc.Location().requestPermission() ==
          loc.PermissionStatus.granted) {
        return true;
      }
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    googlePlace = GooglePlace("AIzaSyDOoW-XOG22xHjOa9jM3jN7iHN4UxhsH2A");
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
      body: FutureBuilder(
          future: getLocation(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data) {
                return GoogleMap(
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
                        List<SearchResult> results = value.results;
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
                                        _authController.updateSearchResult(
                                          results[index],
                                        );
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
                      print(stackTrace);
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
                );
              } else {
                return Container(
                  child: Center(
                    child: Card(
                      child: Center(
                        child: Text(
                          'Please Give Permission to acccess location in order to proceed further',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            color: Color(0xff212223),
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
            } else {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }),
    );
  }
}
