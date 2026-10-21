// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookshelf_preview_book_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookshelfPreviewBookResponse _$BookshelfPreviewBookResponseFromJson(
  Map<String, dynamic> json,
) => BookshelfPreviewBookResponse(
  slot: (json['slot'] as num).toInt(),
  displayType: BookshelfPreviewBookResponseDisplayType.fromJson(
    json['displayType'] as String,
  ),
  book: BookResponse.fromJson(json['book'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BookshelfPreviewBookResponseToJson(
  BookshelfPreviewBookResponse instance,
) => <String, dynamic>{
  'slot': instance.slot,
  'displayType':
      _$BookshelfPreviewBookResponseDisplayTypeEnumMap[instance.displayType]!,
  'book': instance.book,
};

const _$BookshelfPreviewBookResponseDisplayTypeEnumMap = {
  BookshelfPreviewBookResponseDisplayType.front: 'FRONT',
  BookshelfPreviewBookResponseDisplayType.spine: 'SPINE',
  BookshelfPreviewBookResponseDisplayType.$unknown: r'$unknown',
};
