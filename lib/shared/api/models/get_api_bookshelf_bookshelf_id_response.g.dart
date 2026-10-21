// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_api_bookshelf_bookshelf_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetApiBookshelfBookshelfIdResponse _$GetApiBookshelfBookshelfIdResponseFromJson(
  Map<String, dynamic> json,
) => GetApiBookshelfBookshelfIdResponse(
  success: json['success'] as bool,
  code: json['code'] as String,
  message: json['message'] as String,
  data: BookshelfResponse.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetApiBookshelfBookshelfIdResponseToJson(
  GetApiBookshelfBookshelfIdResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
