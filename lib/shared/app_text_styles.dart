import 'package:flutter/material.dart';

abstract final class AppTextStyles {
  // H1
  static const h1 = TextStyle(fontSize: 24);
  static const h1Bold = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  // H2
  static const h2 = TextStyle(fontSize: 20, letterSpacing: 20 * -0.01);
  static const h2Bold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: 20 * -0.01,
  );
  // H3
  static const h3 = TextStyle(fontSize: 16, letterSpacing: 16 * -0.01);
  static const h3Bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 16 * -0.01,
  );

  // Subtitle
  static const subtitle = TextStyle(fontSize: 14, letterSpacing: 14 * -0.01);
  static const subtitleBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    letterSpacing: 14 * -0.01,
  );

  // Body
  static const body1 = TextStyle(
    fontSize: 12,
    height: 1.5,
    letterSpacing: 12 * -0.01,
  );
  static const body1Bold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    height: 1.5,
    letterSpacing: 12 * -0.01,
  );
  static const body2 = TextStyle(
    fontSize: 10,
    height: 1.5,
    letterSpacing: 10 * -0.01,
  );
  static const body2Bold = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    height: 1.5,
    letterSpacing: 10 * -0.01,
  );
  static const body3 = TextStyle(
    fontSize: 9,
    height: 1.5,
    letterSpacing: 9 * -0.01,
  );

  // Button
  static const btn1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    letterSpacing: 14 * -0.01,
  );
  static const btn2 = TextStyle(fontSize: 12, letterSpacing: 12 * -0.01);
  static const btn2Bold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    letterSpacing: 12 * -0.01,
  );
  static const btn3 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    letterSpacing: 10 * -0.01,
  );

  // Caption
  static const caption1 = TextStyle(fontSize: 10, letterSpacing: 10 * -0.01);
  static const caption1Bold = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    letterSpacing: 10 * -0.01,
  );
  static const caption2 = TextStyle(fontSize: 9);
  static const caption2Bold = TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.bold,
  );
}
