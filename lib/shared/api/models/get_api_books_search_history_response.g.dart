// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_api_books_search_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetApiBooksSearchHistoryResponse _$GetApiBooksSearchHistoryResponseFromJson(
  Map<String, dynamic> json,
) => GetApiBooksSearchHistoryResponse(
  success: json['success'] as bool,
  code: json['code'] as String,
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => BookSearchHistoryResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetApiBooksSearchHistoryResponseToJson(
  GetApiBooksSearchHistoryResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
