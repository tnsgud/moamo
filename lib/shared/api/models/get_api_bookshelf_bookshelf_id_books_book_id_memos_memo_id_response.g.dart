// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_api_bookshelf_bookshelf_id_books_book_id_memos_memo_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetApiBookshelfBookshelfIdBooksBookIdMemosMemoIdResponse
_$GetApiBookshelfBookshelfIdBooksBookIdMemosMemoIdResponseFromJson(
  Map<String, dynamic> json,
) => GetApiBookshelfBookshelfIdBooksBookIdMemosMemoIdResponse(
  success: json['success'] as bool,
  code: json['code'] as String,
  message: json['message'] as String,
  data: BookMemoResponse.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic>
_$GetApiBookshelfBookshelfIdBooksBookIdMemosMemoIdResponseToJson(
  GetApiBookshelfBookshelfIdBooksBookIdMemosMemoIdResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
