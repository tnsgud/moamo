// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUserResponse _$AuthUserResponseFromJson(Map<String, dynamic> json) =>
    AuthUserResponse(
      memberId: json['memberId'] as String,
      nickname: json['nickname'] as String,
      provider: AuthUserResponseProvider.fromJson(json['provider'] as String),
      providerId: json['providerId'] as String,
    );

Map<String, dynamic> _$AuthUserResponseToJson(AuthUserResponse instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'nickname': instance.nickname,
      'provider': _$AuthUserResponseProviderEnumMap[instance.provider]!,
      'providerId': instance.providerId,
    };

const _$AuthUserResponseProviderEnumMap = {
  AuthUserResponseProvider.kakao: 'kakao',
  AuthUserResponseProvider.$unknown: r'$unknown',
};
