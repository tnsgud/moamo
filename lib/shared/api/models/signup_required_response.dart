// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'signup_required_response_status.dart';
import 'signup_required_response_token_type.dart';

part 'signup_required_response.g.dart';

/// 첫 카카오 로그인 사용자에게 닉네임 입력을 요구하는 응답. 아직 회원이 DB에 저장되지 않습니다.
@JsonSerializable()
class SignupRequiredResponse {
  const SignupRequiredResponse({
    required this.status,
    required this.signupToken,
    required this.tokenType,
    required this.expiresIn,
  });
  
  factory SignupRequiredResponse.fromJson(Map<String, Object?> json) => _$SignupRequiredResponseFromJson(json);
  
  /// 프런트 닉네임 입력 화면 분기값
  final SignupRequiredResponseStatus status;

  /// 가입 전용 임시 JWT. POST /api/auth/signup에서만 사용하며 일반 API에는 사용할 수 없습니다.
  final String signupToken;

  /// Authorization 헤더의 인증 방식
  final SignupRequiredResponseTokenType tokenType;

  /// 가입 토큰 유효기간(초). 기본 300초이며 JWT_SIGNUP_TOKEN_TTL 설정에 따라 달라집니다.
  final int expiresIn;

  Map<String, Object?> toJson() => _$SignupRequiredResponseToJson(this);
}
