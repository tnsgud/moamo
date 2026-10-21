// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_search_history_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookSearchHistoryRequest _$BookSearchHistoryRequestFromJson(
  Map<String, dynamic> json,
) => BookSearchHistoryRequest(
  keyword: json['keyword'] as String,
  target: json['target'] == null
      ? null
      : BookSearchTarget.fromJson(json['target'] as String),
);

Map<String, dynamic> _$BookSearchHistoryRequestToJson(
  BookSearchHistoryRequest instance,
) => <String, dynamic>{
  'keyword': instance.keyword,
  'target': _$BookSearchTargetEnumMap[instance.target],
};

const _$BookSearchTargetEnumMap = {
  BookSearchTarget.title: 'TITLE',
  BookSearchTarget.author: 'AUTHOR',
  BookSearchTarget.isbn: 'ISBN',
  BookSearchTarget.$unknown: r'$unknown',
};
