import 'package:db_vendor/Authorization/controllers/authcontroller.dart';
import 'package:db_vendor/Authorization/views/detailsform.dart';
import 'package:db_vendor/Authorization/views/otp.dart';
import 'package:db_vendor/modalPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class Authorize extends StatefulWidget {
  final AuthController authController;

  const Authorize({Key key, this.authController}) : super(key: key);
  @override
  _AuthorizeState createState() => _AuthorizeState();
}

class _AuthorizeState extends State<Authorize> {
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
      return Colors.grey;
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
    if (widget.authController.status.value == SignInStatus.OTPSENT) {
      Get.off(
        () => OtpScreen(
          authController: widget.authController,
        ),
      );
    }
    widget.authController.status.listen((status) {
      if (mounted) {
        if (status == SignInStatus.OTPSENT) {
          Get.off(
            () => OtpScreen(
              authController: widget.authController,
            ),
          );
        }
      }
    });
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
              minimumSize: MaterialStateProperty.all(Size(120, 60)),
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) => getColor(states),
              ),
            )),
            child: Obx(
              () => ElevatedButton(
                onPressed: widget.authController.number.value.length == 10
                    ? () {
                        widget.authController.sendOtp(
                          phoneNumber: widget.authController.number.value,
                        );
                      }
                    : null,
                child: Text('Send OTP'),
              ),
            ),
          ),
        ],
      ),
      body: Expanded(
        flex: 8,
        child: SizedBox(
          height: 500,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustText(
                      text: 'Enter your\nMobile number',
                      textScaleFactor: 2.2,
                    ),
                    CustText(
                      text: 'We\'ll send you a verification Code',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    autofocus: true,
                    onSubmitted: (value) {
                      widget.authController.sendOtp(
                        phoneNumber: widget.authController.number.value,
                      );
                    },
                    style: GoogleFonts.openSans(
                      color: Color(
                        0xff212223,
                      ),
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                    onChanged: (s) {
                      widget.authController.updateNumber(number1: s);
                    },
                    maxLength: 10,
                    decoration: InputDecoration(
                      counterStyle: null,
                      counter: null,
                      counterText: '',
                      prefixText: '+91 ',
                      hintText: 'Enter your mobile number',
                      hintStyle: GoogleFonts.openSans(
                        color: Colors.grey.shade200,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                      prefixStyle: GoogleFonts.openSans(
                        color: Color(
                          0xff212223,
                        ),
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      ),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustText extends StatelessWidget {
  final String text;
  final double textScaleFactor;
  const CustText({Key key, @required this.text, this.textScaleFactor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        textScaleFactor: textScaleFactor ?? 1.2,
        style: GoogleFonts.openSans(
          fontWeight:
              textScaleFactor == null ? FontWeight.w500 : FontWeight.w600,
          letterSpacing: 1.3,
          color: Color(0xff212223),
        ),
      ),
    );
  }
}
