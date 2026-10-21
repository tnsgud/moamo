// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

/// 프런트 로그인 완료 분기값
@JsonEnum()
enum LoginResponseStatus {
  @JsonValue('LOGIN_SUCCESS')
  loginSuccess('LOGIN_SUCCESS'),
  /// Default value for all unparsed values, allows backward compatibility when adding new values on the backend.
  $unknown(null);

  const LoginResponseStatus(this.json);

  factory LoginResponseStatus.fromJson(String json) => values.firstWhere(
        (e) => e.json == json,
        orElse: () => $unknown,
      );

  final String? json;

  @override
  String toString() => json?.toString() ?? super.toString();
  /// Returns all defined enum values excluding the $unknown value.
  static List<LoginResponseStatus> get $valuesDefined => values.where((value) => value != $unknown).toList();
}
