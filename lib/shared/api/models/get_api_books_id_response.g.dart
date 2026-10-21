// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_api_books_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetApiBooksIdResponse _$GetApiBooksIdResponseFromJson(
  Map<String, dynamic> json,
) => GetApiBooksIdResponse(
  success: json['success'] as bool,
  code: json['code'] as String,
  message: json['message'] as String,
  data: BookResponse.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetApiBooksIdResponseToJson(
  GetApiBooksIdResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
