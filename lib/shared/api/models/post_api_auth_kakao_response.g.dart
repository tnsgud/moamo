// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_api_auth_kakao_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostApiAuthKakaoResponse _$PostApiAuthKakaoResponseFromJson(
  Map<String, dynamic> json,
) => PostApiAuthKakaoResponse(
  success: json['success'] as bool,
  code: json['code'] as String,
  message: json['message'] as String,
  data: DataSealed.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PostApiAuthKakaoResponseToJson(
  PostApiAuthKakaoResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
