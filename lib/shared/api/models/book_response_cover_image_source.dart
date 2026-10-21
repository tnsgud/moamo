// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

/// 표지 URL 제공처. 표지가 없으면 null입니다.
@JsonEnum()
enum BookResponseCoverImageSource {
  @JsonValue('NATIONAL_LIBRARY')
  nationalLibrary('NATIONAL_LIBRARY'),
  @JsonValue('LIBRARY_NARU')
  libraryNaru('LIBRARY_NARU'),
  /// Default value for all unparsed values, allows backward compatibility when adding new values on the backend.
  $unknown(null);

  const BookResponseCoverImageSource(this.json);

  factory BookResponseCoverImageSource.fromJson(String json) => values.firstWhere(
        (e) => e.json == json,
        orElse: () => $unknown,
      );

  final String? json;

  @override
  String toString() => json?.toString() ?? super.toString();
  /// Returns all defined enum values excluding the $unknown value.
  static List<BookResponseCoverImageSource> get $valuesDefined => values.where((value) => value != $unknown).toList();
}
