// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookshelf_book_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookshelfBookResponse _$BookshelfBookResponseFromJson(
  Map<String, dynamic> json,
) => BookshelfBookResponse(
  id: json['id'] as String,
  book: BookResponse.fromJson(json['book'] as Map<String, dynamic>),
  addedAt: DateTime.parse(json['addedAt'] as String),
);

Map<String, dynamic> _$BookshelfBookResponseToJson(
  BookshelfBookResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'book': instance.book,
  'addedAt': instance.addedAt.toIso8601String(),
};
