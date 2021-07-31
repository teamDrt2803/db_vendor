import 'package:db_vendor/modals/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var categories = <Map<String, dynamic>>[
      {'icon': 'assets/icons/atta.svg', 'text': 'Atta'},
      {'icon': 'assets/icons/cleaning.svg', 'text': 'Cleaning'},
      {'icon': 'assets/icons/biscuit.svg', 'text': 'Biscuits'},
      {'icon': 'assets/icons/beauty.svg', 'text': 'Beauty'},
      {'icon': 'assets/icons/grocery.svg', 'text': 'Grocery'},
    ];
    return Padding(
      padding: EdgeInsets.all((20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]['icon'],
            text: categories[index]['text'],
            press: () {},
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 55,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  color: Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset(icon, fit: BoxFit.cover),
            ),
            SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
