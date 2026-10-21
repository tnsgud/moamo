// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_api_bookshelf_bookshelf_id_books_book_id_memos_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetApiBookshelfBookshelfIdBooksBookIdMemosResponse
_$GetApiBookshelfBookshelfIdBooksBookIdMemosResponseFromJson(
  Map<String, dynamic> json,
) => GetApiBookshelfBookshelfIdBooksBookIdMemosResponse(
  success: json['success'] as bool,
  code: json['code'] as String,
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => BookMemoResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetApiBookshelfBookshelfIdBooksBookIdMemosResponseToJson(
  GetApiBookshelfBookshelfIdBooksBookIdMemosResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
