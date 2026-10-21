// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_api_books_recommendations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetApiBooksRecommendationsResponse _$GetApiBooksRecommendationsResponseFromJson(
  Map<String, dynamic> json,
) => GetApiBooksRecommendationsResponse(
  success: json['success'] as bool,
  code: json['code'] as String,
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => BookMetadata.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetApiBooksRecommendationsResponseToJson(
  GetApiBooksRecommendationsResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
