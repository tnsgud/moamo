// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'put_api_bookshelf_bookshelf_id_decoration_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PutApiBookshelfBookshelfIdDecorationResponse
_$PutApiBookshelfBookshelfIdDecorationResponseFromJson(
  Map<String, dynamic> json,
) => PutApiBookshelfBookshelfIdDecorationResponse(
  success: json['success'] as bool,
  code: json['code'] as String,
  message: json['message'] as String,
  data: BookshelfDecorationResponse.fromJson(
    json['data'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$PutApiBookshelfBookshelfIdDecorationResponseToJson(
  PutApiBookshelfBookshelfIdDecorationResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
