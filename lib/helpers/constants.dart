import 'package:db_vendor/modals/favorites.dart';
import 'package:db_vendor/modals/modals.dart';
import 'package:db_vendor/modals/notification.dart';
import 'package:flutter/material.dart';
import 'package:db_vendor/modals/size_config.dart';
import 'package:hive_flutter/hive_flutter.dart';

const kPrimaryColor = Color(0xFFf28b32);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFF28b32)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: (28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

class Consts {
  static const String app_name = 'Discount Bazaar';
  static const String url = 'https://www.discount-bazaar.com';
  static const String consumerKey =
      'ck_a8200f8c74b2f73c16a7e178b954c7977891000c';
  static const String consumerSecret =
      'cs_043642983a3d8799b786429a154264cb400d7fd2';
  static const String prroductEp = '/wp-json/wc/v3/products/categories';
  static const String firstBoot = 'firstBoot';
  static const String state = 'state';
  static const String city = 'city';
  static const String postalcode = 'static const String';
  static const String location = 'location';
  static const String storeName = 'storename';
  static const String setupComplete = 'setupComplete';
  static const String userName = 'userName';
  static const String email = 'email';
}

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
const String kEmailNullError = 'Please Enter your phone';
const String kInvalidEmailError = 'Please Enter Valid phone';
const String kPassNullError = 'Please Enter your password';
const String kShortPassError = 'Password is too short';
const String kMatchPassError = 'Passwords don\'t match';
const String kNamelNullError = 'Please Enter your name';
const String kPhoneNumberNullError = 'Please Enter your phone number';
const String kAddressNullError = 'Please Enter your address';
const String whatsappUri = 'https://wa.me/+919098244189';

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: (15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular((15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

class BrandDetails {
  String brandName;
  String imageUrl;

  BrandDetails({this.brandName, this.imageUrl});

  BrandDetails.fromJson(Map<String, dynamic> json) {
    brandName = json['brandName'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['brandName'] = brandName;
    data['imageUrl'] = imageUrl;
    return data;
  }
}

List<Map<String, String>> brandsData = [
  {
    'brandName': 'Nestle india',
    'imageUrl': 'https://www.crazymasalafood.com/wp-content/images/nestle.jpg'
  },
  {
    'brandName': 'Parle Agro',
    'imageUrl':
        'https://www.crazymasalafood.com/wp-content/images/parle-agro.jpg'
  },
  {
    'brandName': 'Britania Industries Limited',
    'imageUrl':
        'https://www.crazymasalafood.com/wp-content/images/britannia.jpg'
  },
  {
    'brandName': 'Cadbury',
    'imageUrl': 'https://www.crazymasalafood.com/wp-content/images/Cadbury.png'
  },
  {
    'brandName': 'Amul',
    'imageUrl': 'https://www.crazymasalafood.com/wp-content/images/amul.jpg'
  },
  {
    'brandName': 'Vadilal',
    'imageUrl': 'https://www.crazymasalafood.com/wp-content/images/Vadilal.png'
  },
  {
    'brandName': 'MTR Foods',
    'imageUrl': 'https://www.crazymasalafood.com/wp-content/images/MTR.png'
  },
  {
    'brandName': 'Haldiram\'s',
    'imageUrl': 'https://www.crazymasalafood.com/wp-content/images/Haldiram.png'
  },
  {
    'brandName': 'KRBL Limited',
    'imageUrl': 'https://www.crazymasalafood.com/wp-content/images/KRBL.jpg'
  },
  {
    'brandName': 'Mother Dairy',
    'imageUrl':
        'https://www.crazymasalafood.com/wp-content/images/Mother-dairy.jpg'
  },
  {
    'brandName': 'hindustan Unilever',
    'imageUrl':
        'https://www.crazymasalafood.com/wp-content/images/Hindustan-Unilever.png'
  },
  {
    'brandName': 'McCain',
    'imageUrl': 'https://www.crazymasalafood.com/wp-content/images/Mccain.png'
  },
  {
    'brandName': 'Kissan',
    'imageUrl': 'https://www.crazymasalafood.com/wp-content/images/kissan.jpg'
  },
  {
    'brandName': 'Godrej Beverages and Food Limited',
    'imageUrl': 'https://www.crazymasalafood.com/wp-content/images/Godrej.png'
  },
  {
    'brandName': 'Pepsico India',
    'imageUrl': 'https://www.crazymasalafood.com/wp-content/images/pepsico.png'
  },
  {
    'brandName': 'Kwality Dairy India Limited',
    'imageUrl': 'https://www.crazymasalafood.com/wp-content/images/Kwality.jpg'
  },
  {
    'brandName': 'Hatsun Argo',
    'imageUrl': 'https://www.crazymasalafood.com/wp-content/images/hatsun.png'
  },
  {
    'brandName': 'Heritage Foods Limited',
    'imageUrl':
        'https://www.crazymasalafood.com/wp-content/images/heritage-1.jpg'
  },
  {
    'brandName': 'Patanjali',
    'imageUrl':
        'https://www.crazymasalafood.com/wp-content/images/patanjali.jpg'
  },
  {
    'brandName': 'Sunfest',
    'imageUrl': 'https://www.crazymasalafood.com/wp-content/images/sunfeast.jpg'
  }
];

var coupons = [
  {
    'code': 'DBNEWUSER',
    'id': 'abcdefghijkl',
    'title': 'Get 20% off on first purchase',
    'description':
        'use code DBNEWUSER to get 20% off upto INR 50/- on your first ever purchase on Discount Bazaar. T&C\'s Apply',
    'dicount': 20,
    'unit': '%',
    'maxDiscount': 50,
    'minOrderValue': 200,
  },
  {}
];

Future<void> setupHive() async {
  Hive.registerAdapter<Products>(ProductsAdapter());
  Hive.registerAdapter<Images>(ImagesAdapter());
  Hive.registerAdapter<FavouriteProduct>(FavouriteProductAdapter());
  Hive.registerAdapter<NotificationData>(NotificationDataAdapter());
  await Hive.initFlutter();
}

List<Map<String, String>> splashData = [
  {
    'title': 'Welcome to \nDiscount Bazaar',
    'text':
        'MP’s leading online wholesale platform for Small & Medium Businesses and Shop owners.',
    'image': 'assets/images/splash_1.png'
  },
  {
    'title': 'Wide Range \nOf Products',
    'text':
        'We offer wide range of products and categories available at the lowest possible rates.',
    'image': 'assets/images/splash_3.png'
  },
  {
    'title': 'Fast Delivery',
    'text': 'We strive for next day delivery of goods at your doorstep.',
    'image': 'assets/images/splash_4.png'
  },
  {
    'title': 'Easy Return',
    'text': 'We have a hassle free returns policy.',
    'image': 'assets/images/splash_2.png'
  },
];

var navigationItem = [
  {'label': 'Home', 'icon': false, 'svg': 'assets/icons/Shop Icon.svg'},
  {'label': 'Favourites', 'icon': true, 'svg': Icons.favorite_outline_outlined},
  {'label': 'Offers', 'icon': true, 'svg': Icons.verified_outlined},
  {'label': 'Brand List', 'icon': true, 'svg': Icons.branding_watermark},
  {'label': 'My Account', 'icon': true, 'svg': Icons.person}
];
