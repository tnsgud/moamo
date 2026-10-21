// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_book_memo_page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicBookMemoPageResponse _$PublicBookMemoPageResponseFromJson(
  Map<String, dynamic> json,
) => PublicBookMemoPageResponse(
  page: (json['page'] as num).toInt(),
  size: (json['size'] as num).toInt(),
  totalCount: (json['totalCount'] as num).toInt(),
  memos: (json['memos'] as List<dynamic>)
      .map((e) => BookMemoResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PublicBookMemoPageResponseToJson(
  PublicBookMemoPageResponse instance,
) => <String, dynamic>{
  'page': instance.page,
  'size': instance.size,
  'totalCount': instance.totalCount,
  'memos': instance.memos,
};
