// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_api_books_by_isbn_isbn_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetApiBooksByIsbnIsbnResponse _$GetApiBooksByIsbnIsbnResponseFromJson(
  Map<String, dynamic> json,
) => GetApiBooksByIsbnIsbnResponse(
  success: json['success'] as bool,
  code: json['code'] as String,
  message: json['message'] as String,
  data: BookMetadata.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetApiBooksByIsbnIsbnResponseToJson(
  GetApiBooksByIsbnIsbnResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
