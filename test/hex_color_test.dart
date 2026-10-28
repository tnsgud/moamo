import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:moamo/shared/theme/hex_color.dart';

void main() {
  test('hex ↔ Color 왕복 변환', () {
    expect(hexToColor('#D9DBFF'), const Color(0xFFD9DBFF));
    expect(colorToHex(const Color(0xFF0a0b0c)), '#0A0B0C');
    expect(hexToColor('잘못된 값'), const Color(0xFFD9DBFF));
  });
}
