// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_api_auth_signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostApiAuthSignupResponse _$PostApiAuthSignupResponseFromJson(
  Map<String, dynamic> json,
) => PostApiAuthSignupResponse(
  success: json['success'] as bool,
  code: json['code'] as String,
  message: json['message'] as String,
  data: LoginResponse.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PostApiAuthSignupResponseToJson(
  PostApiAuthSignupResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
