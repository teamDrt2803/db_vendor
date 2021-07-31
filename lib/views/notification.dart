import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/main.dart';
import 'package:db_vendor/modals/notification.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:db_vendor/helpers/custappbar.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  var selectedINdex = 0;
  String getCategory() {
    switch (selectedINdex) {
      case 0:
        return 'order';
        break;
      case 1:
        return 'promo';
      case 2:
        return 'delivery';
      default:
        return 'account';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustAppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            'Notifications',
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NotificationCategoryButton(
                      elevation: selectedINdex == 0 ? 15 : 0,
                      onPressed: () {
                        setState(() {
                          selectedINdex = 0;
                        });
                      },
                      color: Colors.blue,
                      svg: 'assets/icons/Shop Icon.svg',
                      title: 'Orders',
                    ),
                    NotificationCategoryButton(
                      elevation: selectedINdex == 1 ? 15 : 0,
                      onPressed: () {
                        setState(() {
                          selectedINdex = 1;
                        });
                      },
                      svg: 'assets/icons/tag.svg',
                      color: Colors.green,
                      title: 'Promos',
                    ),
                    NotificationCategoryButton(
                      elevation: selectedINdex == 2 ? 15 : 0,
                      onPressed: () {
                        setState(() {
                          selectedINdex = 2;
                        });
                      },
                      svg: 'assets/icons/delivery.svg',
                      color: Colors.red,
                      title: 'Delivery',
                    ),
                    NotificationCategoryButton(
                      elevation: selectedINdex == 3 ? 15 : 0,
                      onPressed: () {
                        setState(() {
                          selectedINdex = 3;
                        });
                      },
                      svg: 'assets/icons/User.svg',
                      color: Colors.purple,
                      title: 'Account',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: (25),
              ),
              Flexible(
                child: ValueListenableBuilder<Box<NotificationData>>(
                  valueListenable: notificationBox.listenable(),
                  builder: (context, box, _) {
                    var list = box.values
                        .toList()
                        .where(
                          (element) => element.type.contains(getCategory()),
                        )
                        .toList();
                    return list.isEmpty
                        ? Container(
                            child: Center(
                              child: Text(
                                'Nothing to show here',
                                style: GoogleFonts.roboto(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              var not = list[index];
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                height: (80),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 5),
                                      blurRadius: 16,
                                      color: Colors.grey.shade200,
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 24,
                                      backgroundColor: kPrimaryColor,
                                      foregroundColor: kPrimaryLightColor,
                                      child: Icon(
                                        Icons.shopping_bag_sharp,
                                      ),
                                    ),
                                    title: Text(not.title.toUpperCase()),
                                    subtitle: RichText(
                                      text: TextSpan(
                                        text: not.body
                                            .substring(
                                                not.body.indexOf('order'))
                                            .split('#${not.orderId}')[0],
                                        style: TextStyle(color: kTextColor),
                                        children: [
                                          TextSpan(
                                            text: '#${not.orderId}',
                                            style: TextStyle(
                                              color: kPrimaryColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          TextSpan(
                                            text: not.body
                                                .substring(
                                                    not.body.indexOf('order'))
                                                .split('${not.orderId}')[1],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                  },
                ),
              )
            ],
          ),
        ));
  }
}

class NotificationCategoryButton extends StatelessWidget {
  const NotificationCategoryButton({
    Key key,
    this.svg,
    this.title,
    this.color,
    this.onPressed,
    this.elevation,
  }) : super(key: key);
  final String svg, title;
  final Color color;
  final void Function() onPressed;
  final double elevation;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          elevation: elevation,
          backgroundColor: color ?? kPrimaryColor,
          onPressed: onPressed,
          child: SvgPicture.asset(
            svg ?? 'assets/icons/Shop Icon.svg',
            height: 24,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(title ?? ''),
        )
      ],
    );
  }
}
