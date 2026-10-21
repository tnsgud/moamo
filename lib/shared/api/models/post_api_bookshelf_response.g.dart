// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_api_bookshelf_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostApiBookshelfResponse _$PostApiBookshelfResponseFromJson(
  Map<String, dynamic> json,
) => PostApiBookshelfResponse(
  success: json['success'] as bool,
  code: json['code'] as String,
  message: json['message'] as String,
  data: BookshelfResponse.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PostApiBookshelfResponseToJson(
  PostApiBookshelfResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
