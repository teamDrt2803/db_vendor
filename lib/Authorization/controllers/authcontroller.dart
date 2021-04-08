import 'package:db_vendor/storedetailspodo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_restart/flutter_restart.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';

import '../../constants.dart';

enum SHOPDETAIL {
  USERNAME,
  STORENAME,
  STATE,
  CITY,
  POSTALCODE,
  LOCATION,
  CONFIRM,
  FINISHING,
}

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseDatabase _database = FirebaseDatabase.instance;
  DatabaseReference databaseReference;
  Rx<User> _user = Rx<User>();
  GetStorage storage = GetStorage();
  String verificationId;
  int resendToken;
  final status = SignInStatus.IDLE.obs;
  Stream<User> get user => _user.stream;
  FirebaseAuth get auth => _auth;
  final firstBoot = true.obs;
  final number = ''.obs;
  final otp = ''.obs;
  Rx<SHOPDETAIL> whichPage = SHOPDETAIL.USERNAME.obs;
  final state = ''.obs;
  final storeName = ''.obs;
  final city = ''.obs;
  final postalCode = ''.obs;
  final location = ''.obs;
  final latlng = LatLng(22.0574, 78.9382).obs;
  final searchResult = SearchResult().obs;
  final setupComplete = true.obs;
  final userName = ''.obs;

  updatestatus(SignInStatus status) {
    this.status.value = status;
  }

  updateLatlng(LatLng latLng) {
    this.latlng.value = latLng;
  }

  updateNumber({String number1}) {
    number.value = number1;
  }

  updateOtp({String otp1}) {
    otp.value = otp1;
  }

  updatewhichPage(SHOPDETAIL shopdetail) {
    whichPage.value = shopdetail;
  }

  updateState(String state) {
    this.state.value = state;
  }

  updateStoreName(String state) {
    this.storeName.value = state;
  }

  updateCity(String state) {
    this.city.value = state;
  }

  updatePostalCode(String state) {
    this.postalCode.value = state;
  }

  updateLocation(dynamic location) {
    this.location.value = location;
  }

  updateSearchResult(SearchResult searchResult) {
    this.searchResult.value = searchResult;
  }

  updateUserName(String userName) {
    this.userName.value = userName;
  }

  Future completeSetup() async {
    await storage.write(Consts.userName, userName.value);
    await storage.write(Consts.storeName, storeName.value);
    await storage.write(Consts.state, state.value);
    await storage.write(Consts.city, city.value);
    await storage.write(Consts.postalcode, postalCode.value);
    await storage.write(Consts.location, searchResult.value.name);
    Storedetails storedetails = Storedetails(
      userName: userName.value,
      state: state.value,
      city: city.value,
      postalcode: postalCode.value,
      location: searchResult.value.name,
      storeName: storeName.value,
      setupComplete: true,
    );
    await databaseReference
        .child(_user.value.uid)
        .set(storedetails.toJson())
        .then((value) {
      storage.write(
        Consts.setupComplete,
        true,
      );
    });
  }

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    _user.value = _auth.currentUser;
    databaseReference = _database.reference();
    if (storage.hasData(Consts.userName)) {
      userName.value = storage.read(Consts.userName);
    }
    if (storage.hasData(Consts.firstBoot)) {
      firstBoot.value = storage.read(Consts.firstBoot);
      storage.listenKey(
        Consts.firstBoot,
        (s) {
          firstBoot.value = s;
        },
      );
    } else {
      storage.listenKey(
        Consts.firstBoot,
        (s) {
          firstBoot.value = s;
        },
      );
      storage.write(Consts.firstBoot, true);
    }
    setupSetupComplete();
    readData();
  }

  readData() async {
    if (_user.value != null) {
      await databaseReference.child(_user.value.uid).once().then(
        (event) async {
          var storeDetails =
              Storedetails.fromJson(Map<String, dynamic>.from(event.value));
          setupComplete.value = storeDetails.setupComplete;
          await writeData(storeDetails);
        },
      );
    }
  }

  writeData(Storedetails storeDetails) async {
    await storage.write(Consts.city, storeDetails.city);
    await storage.write(Consts.state, storeDetails.state);
    await storage.write(
        Consts.setupComplete, storeDetails.setupComplete ?? false);
    await storage.write(Consts.postalcode, storeDetails.postalcode);
    await storage.write(Consts.storeName, storeDetails.storeName);
    await storage.write(Consts.userName, storeDetails.userName);
  }

  setupSetupComplete() {
    if (storage.hasData(Consts.setupComplete)) {
      setupComplete.value = storage.read(Consts.setupComplete);
      storage.listenKey(
        Consts.setupComplete,
        (value) => setupComplete.value = value,
      );
    } else {
      storage.listenKey(
          Consts.setupComplete, (value) => setupComplete.value = value);
      storage.write(Consts.setupComplete, false);
    }
  }

  noFirstBoot(bool a) {
    storage.write(Consts.firstBoot, false);
  }

  Future sendOtp({String phoneNumber}) async {
    print(phoneNumber);
    updatestatus(SignInStatus.PROCESSING);
    try {
      _auth.verifyPhoneNumber(
        phoneNumber: '+91' + phoneNumber,
        verificationCompleted: (credential) {
          print(credential.smsCode);
          _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          Get.snackbar("Log In Failed", e.message);
        },
        codeSent: (verificationId, resendToken) {
          //print(verificationId);
          //print(resendToken);
          this.verificationId = verificationId;
          this.resendToken = resendToken;

          status.value = SignInStatus.OTPSENT;
        },
        codeAutoRetrievalTimeout: (s) {},
      );
    } on FirebaseAuthException catch (e) {
      updatestatus(SignInStatus.FAILED);
      Get.snackbar("Error Occured", e.message);
    }
  }

  Future verifyOtp({String otp}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      await _auth.signInWithCredential(credential);
      await readData();
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error Occured", e.message);
    }
  }

  Future signOut(BuildContext context) async {
    await storage.erase();
    await _auth.signOut();
    FlutterRestart.restartApp();
    status.value = SignInStatus.SIGNOUT;
  }
}

enum SignInStatus {
  IDLE,
  SIGNOUT,
  PROCESSING,
  OTPSENT,
  VERIFIED,
  FAILED,
}
