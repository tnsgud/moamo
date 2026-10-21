// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

/// 메모 공개 범위. PRIVATE는 작성자만, PUBLIC은 다른 로그인 회원도 글과 사진을 조회할 수 있습니다.
@JsonEnum()
enum BookMemoResponseVisibility {
  @JsonValue('PRIVATE')
  private('PRIVATE'),
  @JsonValue('PUBLIC')
  public('PUBLIC'),
  /// Default value for all unparsed values, allows backward compatibility when adding new values on the backend.
  $unknown(null);

  const BookMemoResponseVisibility(this.json);

  factory BookMemoResponseVisibility.fromJson(String json) => values.firstWhere(
        (e) => e.json == json,
        orElse: () => $unknown,
      );

  final String? json;

  @override
  String toString() => json?.toString() ?? super.toString();
  /// Returns all defined enum values excluding the $unknown value.
  static List<BookMemoResponseVisibility> get $valuesDefined => values.where((value) => value != $unknown).toList();
}
