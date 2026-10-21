// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'auth_user_response_provider.dart';

part 'auth_user_response.g.dart';

/// 가입 완료된 서비스 회원 정보. 카카오 회원번호와 서비스 회원 UUID는 별개입니다.
@JsonSerializable()
class AuthUserResponse {
  const AuthUserResponse({
    required this.memberId,
    required this.nickname,
    required this.provider,
    required this.providerId,
  });
  
  factory AuthUserResponse.fromJson(Map<String, Object?> json) => _$AuthUserResponseFromJson(json);
  
  /// 서비스 회원 UUID. 액세스 토큰의 sub와 같은 값입니다.
  final String memberId;

  /// 회원이 가입 시 입력한 닉네임. 중복을 허용합니다.
  final String nickname;

  /// 인증 제공자
  final AuthUserResponseProvider provider;

  /// 카카오가 발급한 회원번호. 서비스 회원 UUID가 아닙니다.
  final String providerId;

  Map<String, Object?> toJson() => _$AuthUserResponseToJson(this);
}
