import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:db_vendor/Global/Constants.dart';
import 'package:db_vendor/Main/Cart.dart';
import 'package:db_vendor/Main/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class Item {
  const Item(this.name, this.img);
  final String name;
  final img;
}

class _NavigationState extends State<Navigation> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: primary,
          actions: <Widget>[
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Card(
                      child: IconButton(
                        icon: Icon(
                          Icons.menu_rounded,
                          color: secondary,
                        ),
                        onPressed: () => _scaffoldKey.currentState.openDrawer(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Card(
                      child: IconButton(
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: secondary,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: SafeArea(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  height: 150,
                  color: Colors.grey.shade300,
                  child: DrawerHeader(
                    margin: EdgeInsets.all(0.0),
                    padding: EdgeInsets.all(0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          child: Icon(
                            Icons.person_outline_outlined,
                            size: 45,
                            color: primary,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Jaykumar Gori",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            Text(
                              "+91 7666071669",
                              style: TextStyle(color: primary, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.shopping_bag_rounded),
                  title: Text("Your Orders"),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.delivery_dining),
                  title: Text("Your Deliveries"),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.keyboard_return_rounded),
                  title: Text("Your Returns"),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.support_agent_rounded),
                  title: Text("Support"),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.policy),
                  title: Text("Terms of Use"),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.question_answer_rounded),
                  title: Text("FAQ"),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.info_rounded),
                  title: Text("About Us"),
                  onTap: () {},
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Center(
                    child: Text(
                      "App Version: 1.0",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: _tabItems[_activePage],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: primary,
          index: 0,
          height: 50,
          items: [
            Icon(
              Icons.home_rounded,
              color: secondary,
            ),
            Icon(
              Icons.notifications,
              color: secondary,
            ),
            Icon(
              Icons.branding_watermark_rounded,
              color: secondary,
            ),
          ],
          onTap: (index) {
            setState(() {
              _activePage = index;
            });
          },
        ),
      ),
    );
  }
}

final List<Widget> _tabItems = [Home(), Alert(), AllBrands()];
int _activePage = 0;

List<Item> mainCategories = <Item>[
  const Item('Groceries',
      'https://image.freepik.com/free-photo/basket-full-vegetables_1112-316.jpg'),
  const Item('Medicines',
      'https://image.freepik.com/free-vector/medicine-pharmacy_131590-145.jpg'),
  const Item('Electronics',
      'https://image.shutterstock.com/image-vector/large-home-appliances-check-shopping-600w-394618711.jpg'),
  const Item('Clothing & Accessories',
      'https://image.freepik.com/free-vector/hand-drawn-winter-clothes-essentials_52683-49771.jpg')
];
