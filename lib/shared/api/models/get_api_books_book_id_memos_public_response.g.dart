// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_api_books_book_id_memos_public_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetApiBooksBookIdMemosPublicResponse
_$GetApiBooksBookIdMemosPublicResponseFromJson(Map<String, dynamic> json) =>
    GetApiBooksBookIdMemosPublicResponse(
      success: json['success'] as bool,
      code: json['code'] as String,
      message: json['message'] as String,
      data: PublicBookMemoPageResponse.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$GetApiBooksBookIdMemosPublicResponseToJson(
  GetApiBooksBookIdMemosPublicResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
