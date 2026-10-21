// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'kakao_login_request.g.dart';

/// 앱의 카카오 SDK 로그인으로 받은 액세스 토큰. 서버가 카카오에 직접 검증하고 회원번호를 조회합니다.
@JsonSerializable()
class KakaoLoginRequest {
  const KakaoLoginRequest({
    required this.kakaoAccessToken,
  });
  
  factory KakaoLoginRequest.fromJson(Map<String, Object?> json) => _$KakaoLoginRequestFromJson(json);
  
  /// 카카오 액세스 토큰 원문. Bearer 접두사·인가 코드·ID 토큰·서비스 JWT를 넣지 않습니다.
  final String kakaoAccessToken;

  Map<String, Object?> toJson() => _$KakaoLoginRequestToJson(this);
}
