// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookshelf_preview_book_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookshelfPreviewBookRequest _$BookshelfPreviewBookRequestFromJson(
  Map<String, dynamic> json,
) => BookshelfPreviewBookRequest(
  bookId: json['bookId'] as String,
  slot: (json['slot'] as num).toInt(),
  displayType: json['displayType'] == null
      ? BookshelfPreviewBookRequestDisplayType.spine
      : BookshelfPreviewBookRequestDisplayType.fromJson(
          json['displayType'] as String,
        ),
);

Map<String, dynamic> _$BookshelfPreviewBookRequestToJson(
  BookshelfPreviewBookRequest instance,
) => <String, dynamic>{
  'bookId': instance.bookId,
  'slot': instance.slot,
  'displayType':
      _$BookshelfPreviewBookRequestDisplayTypeEnumMap[instance.displayType]!,
};

const _$BookshelfPreviewBookRequestDisplayTypeEnumMap = {
  BookshelfPreviewBookRequestDisplayType.front: 'FRONT',
  BookshelfPreviewBookRequestDisplayType.spine: 'SPINE',
  BookshelfPreviewBookRequestDisplayType.$unknown: r'$unknown',
};
