// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_api_bookshelf_bookshelf_id_books_book_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetApiBookshelfBookshelfIdBooksBookIdResponse
_$GetApiBookshelfBookshelfIdBooksBookIdResponseFromJson(
  Map<String, dynamic> json,
) => GetApiBookshelfBookshelfIdBooksBookIdResponse(
  success: json['success'] as bool,
  code: json['code'] as String,
  message: json['message'] as String,
  data: BookshelfBookResponse.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetApiBookshelfBookshelfIdBooksBookIdResponseToJson(
  GetApiBookshelfBookshelfIdBooksBookIdResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
