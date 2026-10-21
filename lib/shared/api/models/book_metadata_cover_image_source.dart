// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

/// 표지 URL의 제공처. 표지가 없으면 null입니다. 정보나루 표지는 비영리 화면 표시 조건을 따릅니다.
@JsonEnum()
enum BookMetadataCoverImageSource {
  @JsonValue('NATIONAL_LIBRARY')
  nationalLibrary('NATIONAL_LIBRARY'),
  @JsonValue('LIBRARY_NARU')
  libraryNaru('LIBRARY_NARU'),
  /// Default value for all unparsed values, allows backward compatibility when adding new values on the backend.
  $unknown(null);

  const BookMetadataCoverImageSource(this.json);

  factory BookMetadataCoverImageSource.fromJson(String json) => values.firstWhere(
        (e) => e.json == json,
        orElse: () => $unknown,
      );

  final String? json;

  @override
  String toString() => json?.toString() ?? super.toString();
  /// Returns all defined enum values excluding the $unknown value.
  static List<BookMetadataCoverImageSource> get $valuesDefined => values.where((value) => value != $unknown).toList();
}
