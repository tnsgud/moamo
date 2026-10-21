// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'book_search_target.dart';

part 'book_search_history_response.g.dart';

/// 로그인한 회원의 최근 검색어 한 개. 책 정보의 저장 여부와 별개입니다.
@JsonSerializable()
class BookSearchHistoryResponse {
  const BookSearchHistoryResponse({
    required this.id,
    required this.keyword,
    required this.target,
    required this.searchedAt,
  });
  
  factory BookSearchHistoryResponse.fromJson(Map<String, Object?> json) => _$BookSearchHistoryResponseFromJson(json);
  
  /// 검색 이력 UUID. 책 ID·책장 ID와 다르며 검색어 개별 삭제에 사용합니다.
  final String id;

  /// 저장한 검색어
  final String keyword;
  final BookSearchTarget target;

  /// 마지막 검색 시각(UTC ISO-8601). 같은 검색어를 저장하면 갱신됩니다.
  final DateTime searchedAt;

  Map<String, Object?> toJson() => _$BookSearchHistoryResponseToJson(this);
}
