// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'signup_request.g.dart';

/// 신규 카카오 사용자의 가입 요청. 카카오 회원번호는 가입 JWT에서 가져옵니다.
@JsonSerializable()
class SignupRequest {
  const SignupRequest({
    required this.nickname,
  });
  
  factory SignupRequest.fromJson(Map<String, Object?> json) => _$SignupRequestFromJson(json);
  
  /// 앞뒤 공백 제거 후 2~20자 닉네임. 중복을 허용합니다.
  final String nickname;

  Map<String, Object?> toJson() => _$SignupRequestToJson(this);
}
