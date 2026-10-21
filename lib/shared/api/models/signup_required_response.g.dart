// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_required_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequiredResponse _$SignupRequiredResponseFromJson(
  Map<String, dynamic> json,
) => SignupRequiredResponse(
  status: SignupRequiredResponseStatus.fromJson(json['status'] as String),
  signupToken: json['signupToken'] as String,
  tokenType: SignupRequiredResponseTokenType.fromJson(
    json['tokenType'] as String,
  ),
  expiresIn: (json['expiresIn'] as num).toInt(),
);

Map<String, dynamic> _$SignupRequiredResponseToJson(
  SignupRequiredResponse instance,
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
