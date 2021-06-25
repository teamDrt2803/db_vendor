import 'package:db_vendor/helpers/constants.dart';
import 'package:flutter/material.dart';

class CustAppBar extends PreferredSize {
  final Widget leading;
  final Widget title;
  final Widget trailing;
  final Widget subtitle;

  CustAppBar({
    this.leading,
    this.title,
    this.trailing,
    this.subtitle,
  });
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: leading == null &&
              title == null &&
              trailing == null &&
              subtitle == null
          ? SizedBox.shrink()
          : Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 16,
                    color: kSecondaryColor.withOpacity(0.1),
                  ),
                ],
              ),
              child: Center(
                child: ListTile(
                  leading: leading,
                  title: title,
                  trailing: trailing,
                  subtitle: subtitle,
                ),
              ),
            ),
    );
  }
}
