// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookshelf_decoration_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookshelfDecorationResponse _$BookshelfDecorationResponseFromJson(
  Map<String, dynamic> json,
) => BookshelfDecorationResponse(
  bookshelfId: json['bookshelfId'] as String,
  name: json['name'] as String,
  templateKey: json['templateKey'] as String,
  coverColor: json['coverColor'] as String,
  books: (json['books'] as List<dynamic>)
      .map(
        (e) => BookshelfPreviewBookResponse.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  items: (json['items'] as List<dynamic>)
      .map((e) => BookshelfPreviewItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BookshelfDecorationResponseToJson(
  BookshelfDecorationResponse instance,
) => <String, dynamic>{
  'bookshelfId': instance.bookshelfId,
  'name': instance.name,
  'templateKey': instance.templateKey,
  'coverColor': instance.coverColor,
  'books': instance.books,
  'items': instance.items,
};
