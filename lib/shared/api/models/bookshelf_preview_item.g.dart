// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookshelf_preview_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookshelfPreviewItem _$BookshelfPreviewItemFromJson(
  Map<String, dynamic> json,
) => BookshelfPreviewItem(
  itemKey: json['itemKey'] as String,
  slot: (json['slot'] as num).toInt(),
);

Map<String, dynamic> _$BookshelfPreviewItemToJson(
  BookshelfPreviewItem instance,
) => <String, dynamic>{'itemKey': instance.itemKey, 'slot': instance.slot};
