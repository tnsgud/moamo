import 'package:flutter/material.dart';

abstract final class AppTextStyle {
  // H1
  static const h1 = TextStyle(fontSize: 24);
  static const h1Bold = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  // H2
  static const h2 = TextStyle(fontSize: 20);
  static const h2Bold = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  // H3
  static const h3 = TextStyle(fontSize: 16);
  static const h3Bold = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  // Subtitle
  static const subtitle = TextStyle(fontSize: 14);
  static const subtitleBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  // Body
  static const body12 = TextStyle(fontSize: 12, height: 1.5);
  static const body12Bold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    height: 1.5,
  );
  static const body10 = TextStyle(fontSize: 10, height: 1.5);
  static const body10Bold = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    height: 1.5,
  );
  static const body09 = TextStyle(fontSize: 9, height: 1.5);

  // Button
  static const btn14Bold = TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
  static const btn12Bold = TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
  static const btn12 = TextStyle(fontSize: 12);
  static const btn10Bold = TextStyle(fontSize: 10, fontWeight: FontWeight.bold);

  // Caption
  static const caption10 = TextStyle(fontSize: 10);
  static const caption10Bold = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
  );
  static const caption09 = TextStyle(fontSize: 9);
  static const caption09Bold = TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.bold,
  );
}
