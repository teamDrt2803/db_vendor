import 'package:db_vendor/helpers/constants.dart';
import 'package:db_vendor/helpers/enums.dart';
import 'package:db_vendor/views/favourites/favouritespage.dart';
import 'package:db_vendor/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  static String routeName = '/mainscreen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Color inActiveIconColor = Color(0xFFB6B6B6);
  final PageController _pageController = PageController();
  int currentIndex = 0;
  Future<void> onPageChanged(int index) async => setState(() {
        currentIndex = index;
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SnakeNavigationBar.color(
        unselectedItemColor: Colors.blueGrey,
        snakeShape: SnakeShape.indicator,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        currentIndex: currentIndex,
        selectedItemColor: kPrimaryColor,
        snakeViewColor: kPrimaryColor,
        onTap: (index) async => await _pageController.animateToPage(
          index,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeIn,
        ),
        items: [
          ...List.generate(navigationItem.length, (index) {
            return BottomNavigationBarItem(
              icon: navigationItem[index]['icon']
                  ? Icon(navigationItem[index]['svg'])
                  : SvgPicture.asset(
                      navigationItem[index]['svg'],
                      color:
                          currentIndex == 0 ? kPrimaryColor : inActiveIconColor,
                    ),
              label: navigationItem[index]['label'],
            );
          }),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          HomeScreen(),
          FavouritesPage(),
          OffersScreen(),
          BrandList(),
        ],
      ),
    );
  }
}

var navigationItem = [
  {
    'label': 'Home',
    'icon': false,
    'svg': 'assets/icons/Shop Icon.svg',
  },
  {
    'label': 'Favourites',
    'icon': true,
    'svg': Icons.favorite_outline_outlined,
  },
  {
    'label': 'Offers',
    'icon': true,
    'svg': Icons.verified_outlined,
  },
  {
    'label': 'Brand List',
    'icon': true,
    'svg': Icons.branding_watermark_outlined,
  }
];
