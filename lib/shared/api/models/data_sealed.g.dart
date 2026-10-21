// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_sealed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$DataSealedToJson(DataSealed instance) =>
    <String, dynamic>{};

DataSealedLoginResponse _$DataSealedLoginResponseFromJson(
  Map<String, dynamic> json,
) => DataSealedLoginResponse(
  status: LoginResponseStatus.fromJson(json['status'] as String),
  accessToken: json['accessToken'] as String,
  tokenType: LoginResponseTokenType.fromJson(json['tokenType'] as String),
  expiresIn: (json['expiresIn'] as num).toInt(),
  member: AuthUserResponse.fromJson(json['member'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataSealedLoginResponseToJson(
  DataSealedLoginResponse instance,
) => <String, dynamic>{
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

DataSealedSignupRequiredResponse _$DataSealedSignupRequiredResponseFromJson(
  Map<String, dynamic> json,
) => DataSealedSignupRequiredResponse(
  status: SignupRequiredResponseStatus.fromJson(json['status'] as String),
  signupToken: json['signupToken'] as String,
  tokenType: SignupRequiredResponseTokenType.fromJson(
    json['tokenType'] as String,
  ),
  expiresIn: (json['expiresIn'] as num).toInt(),
);

Map<String, dynamic> _$DataSealedSignupRequiredResponseToJson(
  DataSealedSignupRequiredResponse instance,
) => <String, dynamic>{
  'status': _$SignupRequiredResponseStatusEnumMap[instance.status]!,
  'signupToken': instance.signupToken,
  'tokenType': _$SignupRequiredResponseTokenTypeEnumMap[instance.tokenType]!,
  'expiresIn': instance.expiresIn,
};

const _$SignupRequiredResponseStatusEnumMap = {
  SignupRequiredResponseStatus.signupRequired: 'SIGNUP_REQUIRED',
  SignupRequiredResponseStatus.$unknown: r'$unknown',
};

const _$SignupRequiredResponseTokenTypeEnumMap = {
  SignupRequiredResponseTokenType.bearer: 'Bearer',
  SignupRequiredResponseTokenType.$unknown: r'$unknown',
};
