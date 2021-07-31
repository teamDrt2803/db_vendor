import 'package:another_flushbar/flushbar_helper.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:db_vendor/main.dart';
import 'package:db_vendor/modals/modals.dart';
import 'package:db_vendor/modals/notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'package:db_vendor/helpers/helpers.dart';
import 'package:db_vendor/modals/user.dart';
import 'package:db_vendor/views/complete_profile/complete_profile_screen.dart';
import 'package:db_vendor/views/mainscreen/mainscreen.dart';
import 'package:db_vendor/views/otp/otp_screen.dart';
import 'package:db_vendor/views/welcome_screen.dart';

class AuthController extends GetxController {
  ///
  ///Declaration
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final Rx<FirestoreUser> firestoreUser = Rx<FirestoreUser>(null);
  final Rxn<User> _user = Rxn<User>();
  final RxBool otpSent = false.obs;
  final RxnString otpCode = RxnString();
  final RxnString fcmToken = RxnString();
  final RxnBool _processing = RxnBool(false);
  final RxnBool _firstBoot = RxnBool(false);
  final storage = GetStorage('preferences');
  Box preferenceBox;
  String verificationId;
  int resendToken;

  ///TextEditingControllers for textformfields used in login Process
  final phone = TextEditingController();
  final otp = TextEditingController();

  ///TextEditingControllers for textformfields used in setup Process
  final email = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final postalCode = TextEditingController();
  final storeName = TextEditingController();
  final displayName = TextEditingController();
  final address = TextEditingController();

  ///Getters
  // FirestoreUser get firestoreUser => firestoreUser.value;
  FirebaseAuth get auth => _auth;
  FirebaseFirestore get firestore => _firestore;
  User get user => _user.value;
  Rxn<User> get userStream => _user;
  bool get processing => _processing.value;
  bool get firstBoot => _firstBoot.value;

  ///
  ///[Login] Helper Methods
  ///

  ///
  ///Method to send [otp]
  ///
  Future<void> loginwithPhone(BuildContext context) async {
    if (processing) return;
    _processing.value = true;
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phone.text.countrycode(),
        verificationCompleted: verificationCompleted,
        verificationFailed: (e) => verificationFailed(e, context),
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (exception) {
      debugPrint(exception);
    }
  }

  ///
  ///Method to verify [otp]
  ///
  Future<void> verifyOtp(context) async {
    if (processing) return;
    _processing.value = true;
    try {
      var credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp.text,
      );
      await _auth
          .signInWithCredential(credential)
          .then((value) => _processing.value = false);
    } on FirebaseAuthException catch (e) {
      verificationFailed(e, context);
    }
  }

  ///
  ///Method to [Complete] profle setup
  ///
  Future<void> completeSetup() async {
    _processing.value = true;
    var storeUser = FirestoreUser(
      setupComplete: true,
      email: email.text,
      displayName: displayName.text,
      storeName: storeName.text,
      city: 'Chhindwara',
      postalCode: '480001',
      state: 'Madhya Pradesh',
      fcmToken: await _messaging.getToken(),
    ).toMap();
    await firestore.collection('users').doc(user.uid).set(storeUser).then(
          (value) => _processing.value = false,
        );
  }

  ///
  ///[Callback] when code is auto verified
  ///
  Future<void> verificationCompleted(PhoneAuthCredential credential) async {}

  ///
  ///[Callback] for exceptionoccurred while sending otp
  ///
  void verificationFailed(
      FirebaseAuthException exception, BuildContext context) {
    switch (exception.code) {
      case 'invalid-verification-code':
        FlushbarHelper.createError(
          message:
              'The Verification code you entered is invalid. Please try again!',
          title: 'Error occurred',
        ).show(context);
        break;
      default:
        FlushbarHelper.createError(
          message: exception.message,
          title: exception.code,
        );
    }
  }

  ///
  ///Methods to uodate user data on firestore database [Start]
  ///
  ///
  ///Update [UserName]
  ///
  Future<void> updateUserName(String displayName) async {
    await firestore
        .collection('users')
        .doc(user.uid)
        .update({'displayName': displayName});
  }

  ///
  ///Update [Address]
  ///
  void updateAddress(AddressModal addressModal) async {}

  ///
  ///Add New [Address]
  ///
  void addNewAddress() async {}

  ///
  ///[End]
  ///

  ///
  ///[Callback] when code is sent successfully
  ///
  void codeSent(String verificationId, int resendToken) {
    _processing.value = false;
    otpSent.value = true;
    this.verificationId = verificationId;
    this.resendToken = resendToken;
    debugPrint('Otp Sent');
  }

  ///
  ///[Callback] when code auto retrival has failed due to timeout
  ///
  void codeAutoRetrievalTimeout(String verificationID) {
    FlushbarHelper.createInformation(
      message: 'Unable to autodetect sms. Please enter it manually',
      title: 'Code auto retreival failed',
    );
  }

  ///
  /// handle stream changes methods [start]
  ///

  ///
  ///This method gets fired [everytime] user [changes]
  ///
  ///It checks if the the user is [valid] then binds [firestoreUser] user stream to [_streamUserChanges]
  Future<void> handleUserChanges(User user) async {
    if (user?.uid != null) {
      firestoreUser.bindStream(_streamUserChanges());

      fcmToken.bindStream(_messaging.onTokenRefresh);
    }
  }

  ///This method [stream] [changes] happened in [Firestore] Database
  Stream<FirestoreUser> _streamUserChanges() {
    return firestore
        .collection('users')
        .doc(user.uid)
        .snapshots()
        .map((snapshot) => FirestoreUser.fromMap(snapshot.data()));
  }

  ///
  ///This method handles change in otp sent value
  ///
  void _handleOtpSent(bool sent) {
    if (sent) {
      SmsAutoFill().listenForCode;
      otpCode.bindStream(_streamOtp());
      if (Get.currentRoute != OtpScreen.routeName) {
        Get.offAllNamed(OtpScreen.routeName);
      }
    } else {
      SmsAutoFill().unregisterListener();
    }
  }

  ///
  ///This method fires when otp is auto detected
  void _handleAutodetectOtp(String code) {
    otp.text = code;
  }

  ///
  ///handle firstboot value changes
  ///
  void _handleFirstBootChange(firstboot) {
    if (firstBoot) {
      if (Get.currentRoute != SplashScreen.routeName) {
        Get.offAllNamed(SplashScreen.routeName);
      }
    } else {
      if (Get.currentRoute != MainScreen.routeName) {
        Get.offAllNamed(MainScreen.routeName);
      }
    }
  }

  ///
  ///handle [firestore] changes
  ///
  Future<void> _handleFirestoreUserChanges(FirestoreUser firestoreUser) async {
    var token = await _messaging.getToken();
    if (firestoreUser.fcmToken != token) {
      _handleFcmTokenChanges(token);
    }
    if (!firestoreUser.setupComplete) {
      if (Get.currentRoute != CompleteProfileScreen.routeName) {
        // ignore: unawaited_futures
        Get.offAllNamed(CompleteProfileScreen.routeName);
      }
    } else {
      if (Get.currentRoute != MainScreen.routeName) {
        // ignore: unawaited_futures
        Get.offAllNamed(MainScreen.routeName);
      }
    }
  }

  ///
  ///handle [FCM] [Token] Refresh
  ///
  void _handleFcmTokenChanges(String token) async {
    await firestore
        .collection('users')
        .doc(user.uid)
        .update(firestoreUser.value.copyWith(fcmToken: token).toMap());
  }

  ///
  ///This streams otp code auto detected if listener is added
  Stream<String> _streamOtp() {
    return SmsAutoFill().code;
  }

  ///
  ///[SignOut] and clear user data
  ///
  void signout(BuildContext context) async {
    try {
      await preferenceBox.clear();
      await _auth.signOut();
      await Hive.deleteFromDisk();
    } catch (e) {
      debugPrint(e);
    }
  }

  ///
  /// handle stream changes methods [ends]
  ///

  ///[Overridden] methods
  @override
  Future<void> onInit() async {
    preferenceBox = await Hive.openBox('preferences');
    super.onInit();
  }

  @override
  void onReady() {
    ever(_user, handleUserChanges);
    ever(otpCode, _handleAutodetectOtp);
    ever(otpSent, _handleOtpSent);
    ever(_firstBoot, _handleFirstBootChange);
    ever(firestoreUser, _handleFirestoreUserChanges);
    ever(fcmToken, _handleFcmTokenChanges);
    FirebaseMessaging.onMessage.listen((event) {
      var not = NotificationData.fromMap(event.data);
      if (!notificationBox.values
          .toList()
          .any((element) => element.orderId == not.orderId)) {
        notificationBox.add(not);
      }
      AwesomeNotifications().createNotification(
          content: NotificationContent(
        id: 10,
        title: event.notification.title,
        body: event.notification.body,
        channelKey: 'KeyOrders1234567890',
        largeIcon: event.notification.android.imageUrl,
        bigPicture: event.notification.android.imageUrl,
        hideLargeIconOnExpand: false,
      ));
    });
    _user.bindStream(auth.userChanges());
    _firstBoot.value = preferenceBox.get('firstBoot', defaultValue: true);
    _firstBoot.bindStream(preferenceBox
        .watch(key: 'firstBoot')
        .asBroadcastStream()
        .map((event) => event.value));
    super.onReady();
  }
}
