// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

/// LATEST: 출판 예정일 내림차순, TITLE: 제목 오름차순(국립중앙도서관). POPULAR: 대출 수 내림차순(정보나루).
@JsonEnum()
enum BookSort {
  @JsonValue('LATEST')
  latest('LATEST'),
  @JsonValue('TITLE')
  title('TITLE'),
  @JsonValue('POPULAR')
  popular('POPULAR'),
  /// Default value for all unparsed values, allows backward compatibility when adding new values on the backend.
  $unknown(null);

  const BookSort(this.json);

  factory BookSort.fromJson(String json) => values.firstWhere(
        (e) => e.json == json,
        orElse: () => $unknown,
      );

  final String? json;

  @override
  String toString() => json?.toString() ?? super.toString();
  /// Returns all defined enum values excluding the $unknown value.
  static List<BookSort> get $valuesDefined => values.where((value) => value != $unknown).toList();
}
