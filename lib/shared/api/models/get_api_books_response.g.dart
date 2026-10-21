// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_api_books_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetApiBooksResponse _$GetApiBooksResponseFromJson(Map<String, dynamic> json) =>
    GetApiBooksResponse(
      success: json['success'] as bool,
      code: json['code'] as String,
      message: json['message'] as String,
      data: BookPageResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetApiBooksResponseToJson(
  GetApiBooksResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
