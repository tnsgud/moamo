// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

/// 미리보기의 책 표시 방식. FRONT는 앞표지, SPINE은 책등입니다.
@JsonEnum()
enum BookshelfPreviewBookRequestDisplayType {
  @JsonValue('FRONT')
  front('FRONT'),
  @JsonValue('SPINE')
  spine('SPINE'),
  /// Default value for all unparsed values, allows backward compatibility when adding new values on the backend.
  $unknown(null);

  const BookshelfPreviewBookRequestDisplayType(this.json);

  factory BookshelfPreviewBookRequestDisplayType.fromJson(String json) => values.firstWhere(
        (e) => e.json == json,
        orElse: () => $unknown,
      );

  final String? json;

  @override
  String toString() => json?.toString() ?? super.toString();
  /// Returns all defined enum values excluding the $unknown value.
  static List<BookshelfPreviewBookRequestDisplayType> get $valuesDefined => values.where((value) => value != $unknown).toList();
}
