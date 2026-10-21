// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_api_books_search_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostApiBooksSearchHistoryResponse _$PostApiBooksSearchHistoryResponseFromJson(
  Map<String, dynamic> json,
) => PostApiBooksSearchHistoryResponse(
  success: json['success'] as bool,
  code: json['code'] as String,
  message: json['message'] as String,
  data: BookSearchHistoryResponse.fromJson(
    json['data'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$PostApiBooksSearchHistoryResponseToJson(
  PostApiBooksSearchHistoryResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
