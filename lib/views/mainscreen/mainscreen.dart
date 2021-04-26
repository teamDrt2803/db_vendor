import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/helpers/coustom_bottom_nav_bar.dart';
import 'package:db_vendor/helpers/enums.dart';
import 'package:db_vendor/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Color inActiveIconColor = Color(0xFFB6B6B6);
  PageController _pageController = PageController();
  int currentIndex = 0;
  onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  getMenuState() {
    switch (currentIndex) {
      case 0:
        return MenuState.home;
        break;
      case 1:
        return MenuState.message;
        break;
      default:
        return MenuState.favourite;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SnakeNavigationBar.color(
        unselectedItemColor: Colors.blueGrey,
        snakeShape: SnakeShape.indicator,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        currentIndex: currentIndex,
        onTap: (index) async {
          _pageController.jumpToPage(
            index,
          );
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/Shop Icon.svg",
                color: currentIndex == 0 ? kPrimaryColor : inActiveIconColor,
              ),
              label: 'tickets'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.verified_outlined,
                color: currentIndex == 1 ? kPrimaryColor : inActiveIconColor,
              ),
              label: 'calendar'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.branding_watermark_outlined,
                color: currentIndex == 2 ? kPrimaryColor : inActiveIconColor,
              ),
              label: 'home'),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          HomeScreen(),
          OffersScreen(),
          BrandList(),
        ],
      ),
    );
  }
}
