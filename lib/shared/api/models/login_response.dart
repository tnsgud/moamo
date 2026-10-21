// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'auth_user_response.dart';
import 'login_response_status.dart';
import 'login_response_token_type.dart';

part 'login_response.g.dart';

/// 기존 회원의 카카오 로그인 또는 신규 회원 가입이 완료된 응답
@JsonSerializable()
class LoginResponse {
  const LoginResponse({
    required this.status,
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.member,
  });
  
  factory LoginResponse.fromJson(Map<String, Object?> json) => _$LoginResponseFromJson(json);
  
  /// 프런트 로그인 완료 분기값
  final LoginResponseStatus status;

  /// 서비스가 발급한 액세스 JWT. 일반 API의 Authorization 헤더에 사용합니다. 카카오 토큰이 아닙니다.
  final String accessToken;

  /// Authorization 헤더의 인증 방식
  final LoginResponseTokenType tokenType;

  /// 발급 시점부터 토큰 만료까지의 초. 기본 900초이며 JWT_ACCESS_TOKEN_TTL 설정에 따라 달라집니다.
  final int expiresIn;
  final AuthUserResponse member;

  Map<String, Object?> toJson() => _$LoginResponseToJson(this);
}
