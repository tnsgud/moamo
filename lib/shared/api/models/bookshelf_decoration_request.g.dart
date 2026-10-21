// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookshelf_decoration_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookshelfDecorationRequest _$BookshelfDecorationRequestFromJson(
  Map<String, dynamic> json,
) => BookshelfDecorationRequest(
  name: json['name'] as String,
  templateKey: json['templateKey'] as String,
  coverColor: json['coverColor'] as String,
  books: (json['books'] as List<dynamic>?)
      ?.map(
        (e) => BookshelfPreviewBookRequest.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => BookshelfPreviewItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BookshelfDecorationRequestToJson(
  BookshelfDecorationRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'templateKey': instance.templateKey,
  'coverColor': instance.coverColor,
  'books': instance.books,
  'items': instance.items,
};
