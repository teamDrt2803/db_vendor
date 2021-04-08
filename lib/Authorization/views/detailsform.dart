import 'package:animations/animations.dart';
import 'package:db_vendor/Authorization/controllers/authcontroller.dart';
import 'package:db_vendor/Authorization/views/kyc.dart';
import 'package:db_vendor/Authorization/views/map_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_country_state/flutter_country_state.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopDetails extends StatelessWidget {
  final AuthController _authController = Get.find();

  final UniqueKey key1 = UniqueKey();
  final UniqueKey key2 = UniqueKey();
  final UniqueKey key3 = UniqueKey();
  final UniqueKey key4 = UniqueKey();
  final UniqueKey key5 = UniqueKey();
  final UniqueKey key6 = UniqueKey();
  final UniqueKey key7 = UniqueKey();
  final GlobalKey<FormState> storeNameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> userNameFormKey = GlobalKey<FormState>();

  double getProgressText(SHOPDETAIL shopdetail) {
    switch (shopdetail) {
      case SHOPDETAIL.USERNAME:
        return 0;
        break;
      case SHOPDETAIL.STORENAME:
        return 20;
        break;
      case SHOPDETAIL.STATE:
        return 40;
        break;
      case SHOPDETAIL.CITY:
        return 60;
        break;
      case SHOPDETAIL.POSTALCODE:
        return 80;
        break;
      case SHOPDETAIL.LOCATION:
        return 100;
        break;
      default:
        return 100;
    }
  }

  SHOPDETAIL getValueShop(SHOPDETAIL shopdetail) {
    switch (shopdetail) {
      case SHOPDETAIL.USERNAME:
        return SHOPDETAIL.STORENAME;
        break;
      case SHOPDETAIL.STORENAME:
        return SHOPDETAIL.STATE;
        break;
      case SHOPDETAIL.STATE:
        return SHOPDETAIL.CITY;
        break;
      case SHOPDETAIL.CITY:
        return SHOPDETAIL.POSTALCODE;
        break;
      case SHOPDETAIL.POSTALCODE:
        return SHOPDETAIL.LOCATION;
        break;
      case SHOPDETAIL.LOCATION:
        return SHOPDETAIL.CONFIRM;
        break;
      default:
        return SHOPDETAIL.FINISHING;
        break;
    }
  }

  SHOPDETAIL getPreviousValueShop(SHOPDETAIL shopdetail) {
    switch (shopdetail) {
      case SHOPDETAIL.STORENAME:
        return SHOPDETAIL.USERNAME;
        break;
      case SHOPDETAIL.STATE:
        return SHOPDETAIL.STORENAME;
        break;
      case SHOPDETAIL.CITY:
        return SHOPDETAIL.STATE;
        break;
      case SHOPDETAIL.POSTALCODE:
        return SHOPDETAIL.CITY;
        break;
      case SHOPDETAIL.LOCATION:
        return SHOPDETAIL.POSTALCODE;
        break;
      case SHOPDETAIL.CONFIRM:
        return SHOPDETAIL.LOCATION;
        break;
      default:
        return SHOPDETAIL.FINISHING;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Variables.country = 'India';
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Color(0xff5b92ac),
        body: Stack(
          children: [
            Obx(
              () => Container(
                color: Color(0xff5b92ac),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24.0,
                      horizontal: 16.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.075,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  '${getProgressText(_authController.whichPage.value).round().toString()}% Profile Completed',
                                  textScaleFactor: 1.1,
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              FAProgressBar(
                                currentValue: getProgressText(
                                        _authController.whichPage.value)
                                    .toInt(),
                                progressColor: Colors.red,
                                size: 10,
                                backgroundColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.075,
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: _authController.whichPage.value ==
                                          SHOPDETAIL.USERNAME
                                      ? null
                                      : () {
                                          _authController.updatewhichPage(
                                              getPreviousValueShop(
                                                  _authController
                                                      .whichPage.value));
                                        },
                                  child: Card(
                                    color: _authController.whichPage.value ==
                                                SHOPDETAIL.USERNAME ||
                                            _authController.whichPage.value ==
                                                SHOPDETAIL.FINISHING
                                        ? Colors.grey
                                        : Colors.red,
                                    shadowColor: _authController
                                                    .whichPage.value ==
                                                SHOPDETAIL.USERNAME ||
                                            _authController.whichPage.value ==
                                                SHOPDETAIL.FINISHING
                                        ? Colors.grey
                                        : Colors.red,
                                    elevation: _authController
                                                    .whichPage.value ==
                                                SHOPDETAIL.USERNAME ||
                                            _authController.whichPage.value ==
                                                SHOPDETAIL.FINISHING
                                        ? 0.0
                                        : 5.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        10.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0,
                                        ),
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          size: 16.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    switch (_authController.whichPage.value) {
                                      case SHOPDETAIL.USERNAME:
                                        if (userNameFormKey.currentState
                                            .validate()) {
                                          _authController.updatewhichPage(
                                            getValueShop(_authController
                                                .whichPage.value),
                                          );
                                        }
                                        break;
                                      case SHOPDETAIL.STORENAME:
                                        if (storeNameFormKey.currentState
                                            .validate()) {
                                          _authController.updatewhichPage(
                                            getValueShop(_authController
                                                .whichPage.value),
                                          );
                                        }
                                        break;
                                      case SHOPDETAIL.STATE:
                                        if (_authController.state.value == '') {
                                          Get.defaultDialog(
                                            title: 'Selection Required',
                                            middleText:
                                                'Please Select a state from given list ',
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: Text(
                                                  'OKAY',
                                                ),
                                              ),
                                            ],
                                          );
                                        } else {
                                          if (_authController.state.value !=
                                              'Madhya Pradesh') {
                                            Get.defaultDialog(
                                              title: 'State Not Available',
                                              middleText:
                                                  'Currently, We only support\nMadhya Pradhesh',
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: Text(
                                                    'OKAY',
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else {
                                            _authController.updatewhichPage(
                                              getValueShop(_authController
                                                  .whichPage.value),
                                            );
                                          }
                                        }
                                        break;
                                      case SHOPDETAIL.CITY:
                                        if (_authController.city.value == '') {
                                          Get.defaultDialog(
                                            title: 'Selection Required',
                                            middleText:
                                                'Please Select a City from given list ',
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: Text(
                                                  'OKAY',
                                                ),
                                              ),
                                            ],
                                            //cancel: Text('Cancel'),
                                          );
                                        } else {
                                          if (_authController.city.value !=
                                              'Chhindwara') {
                                            Get.defaultDialog(
                                              title: 'City Not Available',
                                              middleText:
                                                  'Currently, We only support\nChhindwara',
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: Text(
                                                    'OKAY',
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else {
                                            _authController.updatewhichPage(
                                              getValueShop(_authController
                                                  .whichPage.value),
                                            );
                                          }
                                        }
                                        break;
                                      case SHOPDETAIL.POSTALCODE:
                                        if (_authController.postalCode.value ==
                                            '') {
                                          Get.defaultDialog(
                                            title: 'Selection Required',
                                            middleText:
                                                'Please Select a Postal Code from given list ',
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: Text(
                                                  'OKAY',
                                                ),
                                              ),
                                            ],
                                            //cancel: Text('Cancel'),
                                          );
                                        } else {
                                          if (_authController
                                                  .postalCode.value !=
                                              '480001') {
                                            Get.defaultDialog(
                                              title:
                                                  'Postal Code Not Available',
                                              middleText:
                                                  'Currently, We only support\nChhindwara City',
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: Text(
                                                    'OKAY',
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else {
                                            _authController.updatewhichPage(
                                              getValueShop(_authController
                                                  .whichPage.value),
                                            );
                                          }
                                        }
                                        break;
                                      case SHOPDETAIL.LOCATION:
                                        if (_authController.searchResult.value
                                            .name.isNotEmpty) {
                                          _authController.updatewhichPage(
                                            getValueShop(_authController
                                                .whichPage.value),
                                          );
                                        }
                                        break;
                                      case SHOPDETAIL.CONFIRM:
                                        _authController.updatewhichPage(
                                          getValueShop(
                                              _authController.whichPage.value),
                                        );
                                        _authController.completeSetup().then(
                                            (value) =>
                                                Get.off(() => KYCForm()));
                                        break;
                                      default:
                                    }
                                  },
                                  child: Card(
                                    color: _authController.whichPage.value ==
                                            SHOPDETAIL.FINISHING
                                        ? Colors.grey
                                        : Colors.red,
                                    shadowColor:
                                        _authController.whichPage.value ==
                                                SHOPDETAIL.FINISHING
                                            ? Colors.grey
                                            : Colors.red,
                                    elevation:
                                        _authController.whichPage.value ==
                                                SHOPDETAIL.FINISHING
                                            ? 0.0
                                            : 5.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        10.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0,
                                        ),
                                        child: Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 16.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => SafeArea(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.80,
                    child: SizedBox.expand(
                      child: PageTransitionSwitcher(
                        duration: Duration(milliseconds: 800),
                        transitionBuilder: (Widget child,
                            Animation<double> primaryAnimation,
                            Animation<double> secondaryAnimation) {
                          return SharedAxisTransition(
                            animation: primaryAnimation,
                            secondaryAnimation: secondaryAnimation,
                            transitionType: SharedAxisTransitionType.horizontal,
                            fillColor: Colors.transparent,
                            child: child,
                          );
                        },
                        child: _authController.whichPage.value ==
                                SHOPDETAIL.USERNAME
                            ? DetailsPageWidget(
                                formKey1: userNameFormKey,
                                key: key7,
                                question: 'What should we\ncall you?',
                                labelText: 'Username',
                                validator: (value) {
                                  if (value.isEmpty)
                                    return 'This Field is Required';
                                  return null;
                                },
                                onChanged: (s) {
                                  _authController.updateUserName(s);
                                },
                                initialValue: _authController.userName.value,
                              )
                            : _authController.whichPage.value ==
                                    SHOPDETAIL.STORENAME
                                ? DetailsPageWidget(
                                    onBackPressed: () {
                                      _authController
                                          .updatewhichPage(SHOPDETAIL.USERNAME);
                                    },
                                    //store name
                                    formKey1: storeNameFormKey,
                                    key: key1,
                                    question:
                                        'What is the Name of\nYour Store?',
                                    labelText: 'Store Name',
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'This Field is Required';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (s) {
                                      _authController.updateStoreName(s);
                                    },
                                    initialValue:
                                        _authController.storeName.value,
                                  )
                                : _authController.whichPage.value ==
                                        SHOPDETAIL.STATE
                                    ? DetailsPageWidget(
                                        //state
                                        onBackPressed: () {
                                          _authController.updatewhichPage(
                                              SHOPDETAIL.STORENAME);
                                        },
                                        key: key2,
                                        question:
                                            'Which State is Your\nShop Located?',
                                        labelText: 'State',
                                        body: ListView(
                                          shrinkWrap: true,
                                          children: [
                                            Card(
                                              child: RadioListTile(
                                                selected: _authController
                                                        .state.value ==
                                                    'Madhya Pradesh',
                                                value: 'Madhya Pradesh',
                                                title: Text(
                                                  'Madhya Pradesh',
                                                ),
                                                groupValue:
                                                    _authController.state.value,
                                                onChanged: (String s) {
                                                  _authController
                                                      .updateState(s);
                                                },
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                              ),
                                            ),
                                            Card(
                                              child: RadioListTile(
                                                selected: _authController
                                                        .state.value ==
                                                    'Other',
                                                value: 'Other',
                                                title: Text(
                                                  'Other',
                                                ),
                                                groupValue:
                                                    _authController.state.value,
                                                onChanged: (String s) {
                                                  _authController
                                                      .updateState(s);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : _authController.whichPage.value ==
                                            SHOPDETAIL.CITY
                                        ? DetailsPageWidget(
                                            //city
                                            onChanged: (s) {
                                              _authController.updateCity(s);
                                            },
                                            onBackPressed: () {
                                              _authController.updatewhichPage(
                                                SHOPDETAIL.STATE,
                                              );
                                            },
                                            key: key3,
                                            question:
                                                'In which City is Your\nShop Located in ${_authController.state}?',
                                            labelText: 'City',
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return '';
                                              } else {
                                                return null;
                                              }
                                            },
                                            body: ListView(
                                              shrinkWrap: true,
                                              children: [
                                                Card(
                                                  child: RadioListTile(
                                                    selected: _authController
                                                            .city.value ==
                                                        'Chhindwara',
                                                    value: 'Chhindwara',
                                                    title: Text(
                                                      'Chhindwara',
                                                    ),
                                                    groupValue: _authController
                                                        .city.value,
                                                    onChanged: (String s) {
                                                      _authController
                                                          .updateCity(
                                                        s,
                                                      );
                                                    },
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                    ),
                                                  ),
                                                ),
                                                Card(
                                                  child: RadioListTile(
                                                    selected: _authController
                                                            .city.value ==
                                                        'Other',
                                                    value: 'Other',
                                                    title: Text(
                                                      'Other',
                                                    ),
                                                    groupValue: _authController
                                                        .city.value,
                                                    onChanged: (String s) {
                                                      _authController
                                                          .updateCity(
                                                        s,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            initialValue:
                                                _authController.city.value,
                                          )
                                        : _authController.whichPage.value ==
                                                SHOPDETAIL.POSTALCODE
                                            ? DetailsPageWidget(
                                                //postal code
                                                onBackPressed: () {
                                                  _authController
                                                      .updatewhichPage(
                                                    SHOPDETAIL.CITY,
                                                  );
                                                },
                                                key: key4,
                                                question:
                                                    'What is  the Postal Code of your Locality?',
                                                labelText: 'Postal Code',
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return '';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                body: ListView(
                                                  shrinkWrap: true,
                                                  children: [
                                                    Card(
                                                      child: RadioListTile(
                                                        selected:
                                                            _authController
                                                                    .postalCode
                                                                    .value ==
                                                                '480001',
                                                        value: '480001',
                                                        title: Text(
                                                          '480001',
                                                        ),
                                                        groupValue:
                                                            _authController
                                                                .postalCode
                                                                .value,
                                                        onChanged: (String s) {
                                                          _authController
                                                              .updatePostalCode(
                                                            s,
                                                          );
                                                        },
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(25),
                                                        ),
                                                      ),
                                                    ),
                                                    Card(
                                                      child: RadioListTile(
                                                        selected:
                                                            _authController
                                                                    .postalCode
                                                                    .value ==
                                                                'Other',
                                                        value: 'Other',
                                                        title: Text(
                                                          'Other',
                                                        ),
                                                        groupValue:
                                                            _authController
                                                                .postalCode
                                                                .value,
                                                        onChanged: (String s) {
                                                          _authController
                                                              .updatePostalCode(
                                                            s,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                initialValue: _authController
                                                    .postalCode.value,
                                              )
                                            : _authController.whichPage.value ==
                                                    SHOPDETAIL.LOCATION
                                                ? DetailsPageWidget(
                                                    //location
                                                    onBackPressed: () {
                                                      _authController
                                                          .updatewhichPage(
                                                        SHOPDETAIL.POSTALCODE,
                                                      );
                                                    },
                                                    key: key5,
                                                    question:
                                                        'Please Select you Location',
                                                    labelText: 'Location',
                                                    validator: (value) {
                                                      if (value.isEmpty) {
                                                        return '';
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                    body: Center(
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            _authController
                                                                    .searchResult
                                                                    .value
                                                                    .name ??
                                                                '',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .openSans(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              letterSpacing:
                                                                  1.05,
                                                              color: Color(
                                                                0xff212223,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 25,
                                                          ),
                                                          ElevatedButton(
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all(Colors
                                                                          .red),
                                                              elevation: MaterialStateProperty
                                                                  .resolveWith(
                                                                      (states) {
                                                                if (states.any(
                                                                    (element) =>
                                                                        element ==
                                                                        MaterialState
                                                                            .pressed)) {
                                                                  return 8;
                                                                } else {
                                                                  return 3;
                                                                }
                                                              }),
                                                              shadowColor:
                                                                  MaterialStateProperty
                                                                      .all(Colors
                                                                          .red),
                                                            ),
                                                            onPressed: () {
                                                              Get.to(() =>
                                                                  GoogleMaps());
                                                            },
                                                            child: Text(
                                                              _authController
                                                                          .searchResult
                                                                          .value
                                                                          .name !=
                                                                      null
                                                                  ? 'Change Location'
                                                                  : 'Select Location',
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : _authController
                                                            .whichPage.value ==
                                                        SHOPDETAIL.CONFIRM
                                                    ? DetailsPageWidget(
                                                        onBackPressed: () {
                                                          _authController
                                                              .updatewhichPage(
                                                            SHOPDETAIL.LOCATION,
                                                          );
                                                        },
                                                        question:
                                                            'Is this right?\nIf not then go back and correct It',
                                                        centeredText: true,
                                                        body: Table(
                                                          defaultColumnWidth:
                                                              const FlexColumnWidth(
                                                            2.0,
                                                          ),
                                                          children: [
                                                            TableRow(
                                                              children: [
                                                                buildTableCellCOnfirm(
                                                                  'Store Name',
                                                                ),
                                                                buildTableCellCOnfirm1(
                                                                    _authController
                                                                        .storeName
                                                                        .value),
                                                              ],
                                                            ),
                                                            TableRow(
                                                              children: [
                                                                buildTableCellCOnfirm(
                                                                  'State',
                                                                ),
                                                                buildTableCellCOnfirm1(
                                                                    _authController
                                                                        .state
                                                                        .value),
                                                              ],
                                                            ),
                                                            TableRow(
                                                              children: [
                                                                buildTableCellCOnfirm(
                                                                  'City',
                                                                ),
                                                                buildTableCellCOnfirm1(
                                                                    _authController
                                                                        .city
                                                                        .value),
                                                              ],
                                                            ),
                                                            TableRow(
                                                              children: [
                                                                buildTableCellCOnfirm(
                                                                  'Postal Code',
                                                                ),
                                                                buildTableCellCOnfirm1(
                                                                    _authController
                                                                        .postalCode
                                                                        .value),
                                                              ],
                                                            ),
                                                            TableRow(
                                                              children: [
                                                                buildTableCellCOnfirm(
                                                                  'Location',
                                                                ),
                                                                buildTableCellCOnfirm1(
                                                                  _authController
                                                                      .searchResult
                                                                      .value
                                                                      .name,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : DetailsPageWidget(
                                                        question: 'Please Wait',
                                                        centeredText: true,
                                                        body: Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        ),
                                                      ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildTableCellCOnfirm(String text) {
    return TableCell(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            textScaleFactor: 1.3,
            style: GoogleFonts.openSans(
              color: Color(
                0xff212223,
              ),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  TableCell buildTableCellCOnfirm1(String text) {
    return TableCell(
      child: Card(
        color: Color(0xff5b92ac),
        shadowColor: Color(0xff5b92ac),
        elevation: 8.0,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: Text(
              text,
              textScaleFactor: 1.3,
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsPageWidget extends StatefulWidget {
  const DetailsPageWidget({
    Key key,
    this.labelText,
    this.question,
    this.validator,
    this.onBackPressed,
    this.body,
    this.onChanged,
    this.formKey1,
    this.initialValue,
    this.centeredText,
  }) : super(key: key);
  final String labelText, question, initialValue;
  final String Function(String) validator;
  final void Function() onBackPressed;
  final Widget body;
  final void Function(String) onChanged;
  final GlobalKey<FormState> formKey1;
  final bool centeredText;

  @override
  _DetailsPageWidgetState createState() => _DetailsPageWidgetState();
}

class _DetailsPageWidgetState extends State<DetailsPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey1,
      autovalidateMode: AutovalidateMode.always,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: widget.onBackPressed != null,
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Color(
                      0xff212223,
                    ),
                  ),
                  tooltip: 'Back',
                  iconSize: 16.0,
                  onPressed: widget.onBackPressed,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            widget.centeredText != null
                ? !widget.centeredText
                    ? Text(
                        widget.question,
                        textScaleFactor: 2.0,
                        style: GoogleFonts.openSans(
                          color: Color(
                            0xff212223,
                          ),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.1,
                        ),
                      )
                    : Center(
                        child: Text(
                        widget.question,
                        textScaleFactor: 2.0,
                        style: GoogleFonts.openSans(
                          color: Color(
                            0xff212223,
                          ),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.1,
                        ),
                      ))
                : Text(
                    widget.question,
                    textScaleFactor: 2.0,
                    style: GoogleFonts.openSans(
                      color: Color(
                        0xff212223,
                      ),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1,
                    ),
                  ),
            Expanded(
              child: SizedBox(),
            ),
            widget.body ??
                TextFormField(
                  initialValue: widget.initialValue,
                  onChanged: widget.onChanged,
                  onTap: () {},
                  validator: widget.validator,
                  decoration: InputDecoration(
                    labelText: widget.labelText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    labelStyle: GoogleFonts.openSans(
                      color: Color(0xff5b92ac),
                      fontWeight: FontWeight.w500,
                    ),
                    errorText: null,
                    //errorStyle: TextStyle(height: 0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Color(0xff5b92ac),
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
            Expanded(
              child: InkWell(child: SizedBox()),
            ),
            Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

class ShopDetailsFormTF extends StatelessWidget {
  const ShopDetailsFormTF({
    Key key,
    this.fgColor,
    this.shadowColor,
  }) : super(key: key);
  final Color fgColor, shadowColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        color: fgColor,
        shadowColor: shadowColor,
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: TextFormField(
          //autofocus: true,
          style: GoogleFonts.openSans(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.3,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
