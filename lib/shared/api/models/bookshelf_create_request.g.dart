// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookshelf_create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookshelfCreateRequest _$BookshelfCreateRequestFromJson(
  Map<String, dynamic> json,
) => BookshelfCreateRequest(
  name: json['name'] as String,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => BookshelfPreviewItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  templateKey: json['templateKey'] as String? ?? 'DEFAULT',
  coverColor: json['coverColor'] as String? ?? '#D9DBFF',
);

Map<String, dynamic> _$BookshelfCreateRequestToJson(
  BookshelfCreateRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'templateKey': instance.templateKey,
  'coverColor': instance.coverColor,
  'items': instance.items,
};
