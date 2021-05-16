extension CustExtension on String {
  String countrycode() => '+91' + this;
  String rupee() => '₹' + this;
  String normalize() => replaceAll(RegExp('\\ufffd'), ' ');
}
