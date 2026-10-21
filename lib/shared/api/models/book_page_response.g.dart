// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookPageResponse _$BookPageResponseFromJson(Map<String, dynamic> json) =>
    BookPageResponse(
      page: (json['page'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      totalCount: (json['totalCount'] as num).toInt(),
      books: (json['books'] as List<dynamic>)
          .map((e) => BookMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookPageResponseToJson(BookPageResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'totalCount': instance.totalCount,
      'books': instance.books,
    };
