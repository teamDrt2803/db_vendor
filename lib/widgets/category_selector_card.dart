import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorySelectorCard extends StatelessWidget {
  const CategorySelectorCard({
    Key key,
    @required this.selected,
    @required this.map,
  }) : super(key: key);

  final bool selected;
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: Color(0xfff5f5f5),
              borderRadius: BorderRadius.circular(10),
              border:
                  selected ? Border.all(color: Colors.black, width: 2.0) : null,
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(map['asset'])),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF343434).withOpacity(0.4),
                  Color(0xFF343434).withOpacity(0.15),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Text(
            map['name'],
            style: Get.textTheme.bodyText1?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
        if (selected)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              height: 24,
              width: 24,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Color(0xff212223),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.done,
                  size: 16,
                  color: Color(0xfff5f5f5),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
