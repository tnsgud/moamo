// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_api_bookshelf_bookshelf_id_books_book_id_memos_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostApiBookshelfBookshelfIdBooksBookIdMemosResponse
_$PostApiBookshelfBookshelfIdBooksBookIdMemosResponseFromJson(
  Map<String, dynamic> json,
) => PostApiBookshelfBookshelfIdBooksBookIdMemosResponse(
  success: json['success'] as bool,
  code: json['code'] as String,
  message: json['message'] as String,
  data: BookMemoResponse.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic>
_$PostApiBookshelfBookshelfIdBooksBookIdMemosResponseToJson(
  PostApiBookshelfBookshelfIdBooksBookIdMemosResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
