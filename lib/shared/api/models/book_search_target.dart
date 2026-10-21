// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

/// TITLE: 제목, AUTHOR: 저자, ISBN: ISBN-13 검색. 한 요청에서 한 대상만 선택합니다.
@JsonEnum()
enum BookSearchTarget {
  @JsonValue('TITLE')
  title('TITLE'),
  @JsonValue('AUTHOR')
  author('AUTHOR'),
  @JsonValue('ISBN')
  isbn('ISBN'),
  /// Default value for all unparsed values, allows backward compatibility when adding new values on the backend.
  $unknown(null);

  const BookSearchTarget(this.json);

  factory BookSearchTarget.fromJson(String json) => values.firstWhere(
        (e) => e.json == json,
        orElse: () => $unknown,
      );

  final String? json;

  @override
  String toString() => json?.toString() ?? super.toString();
  /// Returns all defined enum values excluding the $unknown value.
  static List<BookSearchTarget> get $valuesDefined => values.where((value) => value != $unknown).toList();
}
