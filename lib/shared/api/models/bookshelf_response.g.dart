// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookshelf_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookshelfResponse _$BookshelfResponseFromJson(Map<String, dynamic> json) =>
    BookshelfResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      bookCount: (json['bookCount'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      templateKey: json['templateKey'] as String,
      coverColor: json['coverColor'] as String,
    );

Map<String, dynamic> _$BookshelfResponseToJson(BookshelfResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bookCount': instance.bookCount,
      'createdAt': instance.createdAt.toIso8601String(),
      'templateKey': instance.templateKey,
      'coverColor': instance.coverColor,
    };
