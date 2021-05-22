import 'package:another_flushbar/flushbar_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:db_vendor/controllers/controllers.dart';
import 'package:db_vendor/helpers/constants.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  final AuthController _controller = Get.find();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: StreamBuilder<User>(
          stream: auth.userChanges(),
          builder: (context, snapshot) {
            return Column(
              children: [
                ProfilePic(),
                SizedBox(height: 20),
                Obx(
                  () => ProfileMenu(
                    showEdit: true,
                    text: _controller.firestoreUser.value.displayName,
                    icon: 'assets/icons/User Icon.svg',
                    press: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      initialValue: _controller
                                          .firestoreUser.value.displayName,
                                      onChanged: (value) {
                                        namecontroller.text = value;
                                      },
                                      decoration:
                                          InputDecoration(labelText: 'Name'),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: TextButton(
                                        onPressed: () {
                                          if (namecontroller.text.length >= 6 &&
                                              namecontroller.text !=
                                                  _controller.firestoreUser
                                                      .value.displayName) {
                                            _controller.updateUserName(
                                              namecontroller.text,
                                            );
                                            FlushbarHelper.createInformation(
                                                message: 'Updated username');
                                            Get.back();
                                          } else {
                                            Get.back();
                                          }
                                        },
                                        child: Text(
                                          'Save',
                                          style:
                                              TextStyle(color: kPrimaryColor),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    label: 'Name',
                  ),
                ),
                ProfileMenu(
                  showEdit: false,
                  text: auth.currentUser.phoneNumber,
                  label: 'Phone',
                  icon: 'assets/icons/Question mark.svg',
                  press: () {},
                ),
                Obx(
                  () => ProfileMenu(
                    showEdit: false,
                    text: _controller.firestoreUser.value.email,
                    label: 'Email',
                    icon: 'assets/icons/Question mark.svg',
                    press: () {
                      // showModalBottomSheet(
                      //     backgroundColor: Colors.transparent,
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return Container(
                      //         height: 200,
                      //         decoration: BoxDecoration(
                      //             color: Colors.white,
                      //             borderRadius: BorderRadius.only(
                      //                 topLeft: Radius.circular(16),
                      //                 topRight: Radius.circular(16)),
                      //             boxShadow: [
                      //               BoxShadow(
                      //                   color: Colors.white,
                      //                   offset: Offset(5.0, 5.0),
                      //                   blurRadius: 10.0,
                      //                   spreadRadius: 2.0)
                      //             ]),
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Column(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceEvenly,
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               TextFormField(
                      //                 controller: emailcontroller,
                      //                 decoration:
                      //                     InputDecoration(labelText: 'Email'),
                      //               ),
                      //               Align(
                      //                 alignment: Alignment.bottomRight,
                      //                 child: TextButton(
                      //                   onPressed: () {
                      //                     if (emailcontroller.text.isEmail) {
                      //                       // _controller.updateEmail(
                      //                       //     email: emailcontroller.text);
                      //                       // Get.back();
                      //                     } else {
                      //                       Get.snackbar(
                      //                           'Please enter a valid email.',
                      //                           '');
                      //                     }
                      //                   },
                      //                   child: Text(
                      //                     'Save',
                      //                     style:
                      //                         TextStyle(color: kPrimaryColor),
                      //                   ),
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       );
                      //     });
                    },
                  ),
                ),
                ProfileMenu(
                  showEdit: false,
                  text: '106, Ambika Bhuvan ,\nKopar road,\tDombivli(West).',
                  label: 'Address',
                  icon: 'assets/icons/Question mark.svg',
                  press: () {},
                )
              ],
            );
          }),
    );
  }
}
