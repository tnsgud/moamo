// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      status: LoginResponseStatus.fromJson(json['status'] as String),
      accessToken: json['accessToken'] as String,
      tokenType: LoginResponseTokenType.fromJson(json['tokenType'] as String),
      expiresIn: (json['expiresIn'] as num).toInt(),
      member: AuthUserResponse.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': _$LoginResponseStatusEnumMap[instance.status]!,
      'accessToken': instance.accessToken,
      'tokenType': _$LoginResponseTokenTypeEnumMap[instance.tokenType]!,
      'expiresIn': instance.expiresIn,
      'member': instance.member,
    };

const _$LoginResponseStatusEnumMap = {
  LoginResponseStatus.loginSuccess: 'LOGIN_SUCCESS',
  LoginResponseStatus.$unknown: r'$unknown',
};

const _$LoginResponseTokenTypeEnumMap = {
  LoginResponseTokenType.bearer: 'Bearer',
  LoginResponseTokenType.$unknown: r'$unknown',
};
