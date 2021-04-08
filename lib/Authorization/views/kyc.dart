import 'package:db_vendor/home.dart';
import 'package:db_vendor/modalPage.dart';
import 'package:db_vendor/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KYCForm extends StatefulWidget {
  @override
  _KYCFormState createState() => _KYCFormState();
}

class _KYCFormState extends State<KYCForm> {
  @override
  Widget build(BuildContext context) {
    return ModalPage(
      title: 'Select Business Proof',
      footer: Row(
        //crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            onPressed: () {
              Get.off(() => HomeScreen());
            },
            child: Text(
              'Skip for now',
            ),
          )
        ],
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          width: double.infinity,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ListTile(
                title: Text('GST Certificate'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
              ListTile(
                title: Text('Udyam Aadhar'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
              ListTile(
                title: Text('Shop and Establishment License'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
              ListTile(
                title: Text('Trade Cerificate/License'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
              ListTile(
                title: Text('FSSAI Registration'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
              ListTile(
                title: Text('Drug License'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
              ListTile(
                title: Text('Current Account Cheque'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
