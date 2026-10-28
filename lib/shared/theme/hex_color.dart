import 'dart:ui';

/// 서버의 `#RRGGBB` 문자열 ↔ [Color]. 형식이 잘못되면 기본 색(`#D9DBFF`).
Color hexToColor(String hex) => Color(
  0xFF000000 | (int.tryParse(hex.replaceFirst('#', ''), radix: 16) ?? 0xD9DBFF),
);

String colorToHex(Color color) =>
    '#${(color.toARGB32() & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
