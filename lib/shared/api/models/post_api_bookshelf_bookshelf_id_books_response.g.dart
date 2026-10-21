// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_api_bookshelf_bookshelf_id_books_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostApiBookshelfBookshelfIdBooksResponse
_$PostApiBookshelfBookshelfIdBooksResponseFromJson(Map<String, dynamic> json) =>
    PostApiBookshelfBookshelfIdBooksResponse(
      success: json['success'] as bool,
      code: json['code'] as String,
      message: json['message'] as String,
      data: BookshelfBookResponse.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$PostApiBookshelfBookshelfIdBooksResponseToJson(
  PostApiBookshelfBookshelfIdBooksResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
