import 'package:flutter/material.dart';

import 'components/body.dart';

class AddressScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  final void Function() onPressed;

  AddressScreen({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Body(onPressed: onPressed);
  }
}
