// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_api_auth_me_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetApiAuthMeResponse _$GetApiAuthMeResponseFromJson(
  Map<String, dynamic> json,
) => GetApiAuthMeResponse(
  success: json['success'] as bool,
  code: json['code'] as String,
  message: json['message'] as String,
  data: AuthUserResponse.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetApiAuthMeResponseToJson(
  GetApiAuthMeResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
