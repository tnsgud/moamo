// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_search_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookSearchHistoryResponse _$BookSearchHistoryResponseFromJson(
  Map<String, dynamic> json,
) => BookSearchHistoryResponse(
  id: json['id'] as String,
  keyword: json['keyword'] as String,
  target: BookSearchTarget.fromJson(json['target'] as String),
  searchedAt: DateTime.parse(json['searchedAt'] as String),
);

Map<String, dynamic> _$BookSearchHistoryResponseToJson(
  BookSearchHistoryResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'keyword': instance.keyword,
  'target': _$BookSearchTargetEnumMap[instance.target]!,
  'searchedAt': instance.searchedAt.toIso8601String(),
};

const _$BookSearchTargetEnumMap = {
  BookSearchTarget.title: 'TITLE',
  BookSearchTarget.author: 'AUTHOR',
  BookSearchTarget.isbn: 'ISBN',
  BookSearchTarget.$unknown: r'$unknown',
};
