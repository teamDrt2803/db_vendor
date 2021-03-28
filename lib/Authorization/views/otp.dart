import 'package:db_vendor/Authorization/controllers/authcontroller.dart';
import 'package:db_vendor/Authorization/views/signIn.dart';
import 'package:db_vendor/modalPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpScreen extends StatefulWidget {
  final AuthController authController;

  const OtpScreen({Key key, this.authController}) : super(key: key);
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController _textEditingController = TextEditingController();
  SmsAutoFill smsAutoFill = SmsAutoFill();
  initliase() async {
    await smsAutoFill.listenForCode;
    smsAutoFill.code.listen((event) {
      print(event);
      if (event.isNotEmpty) {
        _textEditingController.text = event;
      }
    });
  }

  Size getSize(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
    };
    if (!states.any(interactiveStates.contains)) {
      return Size(
        MediaQuery.of(context).size.width * 0.85,
        MediaQuery.of(context).size.height * 0.07,
      );
    }
    return Size(
      MediaQuery.of(context).size.width * 0.83,
      MediaQuery.of(context).size.height * 0.068,
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.disabled,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.grey.shade400;
    }
    return Color(0xffee1a1a);
  }

  Color getShadowColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.disabled,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.grey.shade400;
    }
    return Color(0xffee1a1a);
  }

  double getElevation(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.disabled,
    };
    const Set<MaterialState> interactiveStates2 = <MaterialState>{
      MaterialState.pressed,
    };

    if (states.any(interactiveStates.contains)) {
      return 0;
    }
    if (states.any(interactiveStates2.contains)) {
      return 13;
    }
    return 10;
  }

  @override
  void initState() {
    super.initState();
    initliase();
  }

  @override
  Widget build(BuildContext context) {
    return ModalPage(
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButtonTheme(
            data: ElevatedButtonThemeData(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(
                  Size(
                    120,
                    60,
                  ),
                ),
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => getColor(states),
                ),
              ),
            ),
            child: Obx(
              () => ElevatedButton(
                onPressed: widget.authController.otp.value.length == 6
                    ? () {
                        widget.authController
                            .verifyOtp(
                              otp: widget.authController.otp.value,
                            )
                            .then(
                              (value) => Get.back(
                                closeOverlays: true,
                              ),
                            );
                      }
                    : null,
                child: Text('Verify OTP'),
              ),
            ),
          ),
        ],
      ),
      body: Expanded(
        flex: 8,
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: CustText(
                      text: 'Enter the Code\nSent to your Number ',
                      textScaleFactor: 2.2,
                    ),
                  ),
                  FittedBox(
                    child: CustText(
                      text:
                          'We sent it to the number +91${widget.authController.number ?? ''}',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PinCodeTextField(
                  keyboardType: TextInputType.visiblePassword,
                  enablePinAutofill: true,
                  //enableActiveFill: true,
                  controller: _textEditingController,
                  appContext: context,
                  length: 6,
                  onChanged: (s) {
                    widget.authController.updateOtp(
                      otp1: s,
                    );
                  },
                  onCompleted: (s) async {
                    widget.authController.updateOtp(
                      otp1: s,
                    );
                    if (s.length == 6) {
                      await widget.authController.verifyOtp(
                        otp: widget.authController.otp.value,
                      );
                      Get.back(
                        closeOverlays: true,
                      );
                    }
                  },
                  pinTheme: PinTheme(
                    activeColor: Color(0xffee1a1a),
                    selectedColor: Color(0xffee1a1a),
                    inactiveColor: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
            /*Center(
              child: ElevatedButtonTheme(
                data: ElevatedButtonThemeData(
                    style: ButtonStyle(
                  minimumSize: MaterialStateProperty.resolveWith(
                    (states) => getSize(states),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        25,
                      ),
                    ),
                  ),
                  elevation: MaterialStateProperty.resolveWith(
                      (states) => getElevation(states)),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => getColor(states)),
                  shadowColor: MaterialStateProperty.resolveWith(
                      (states) => getColor(states)),
                )),
                child: Obx(
                  () => ElevatedButton(
                    onPressed: widget.authController.otp.value.length == 6
                        ? () {
                            widget.authController
                                .verifyOtp(
                                  otp: widget.authController.otp.value,
                                )
                                .then(
                                  (value) => Get.back(
                                    closeOverlays: true,
                                  ),
                                );
                          }
                        : null,
                    child: Text('Verify'),
                  ),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
