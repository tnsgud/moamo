// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_api_bookshelf_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetApiBookshelfResponse _$GetApiBookshelfResponseFromJson(
  Map<String, dynamic> json,
) => GetApiBookshelfResponse(
  success: json['success'] as bool,
  code: json['code'] as String,
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => BookshelfResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetApiBookshelfResponseToJson(
  GetApiBookshelfResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
