// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_api_bookshelf_bookshelf_id_books_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetApiBookshelfBookshelfIdBooksResponse
_$GetApiBookshelfBookshelfIdBooksResponseFromJson(Map<String, dynamic> json) =>
    GetApiBookshelfBookshelfIdBooksResponse(
      success: json['success'] as bool,
      code: json['code'] as String,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => BookshelfBookResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetApiBookshelfBookshelfIdBooksResponseToJson(
  GetApiBookshelfBookshelfIdBooksResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
