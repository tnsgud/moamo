// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'book_search_target.dart';

part 'book_search_history_request.g.dart';

/// 검색을 제출할 때 한 번 저장하는 최근 검색어. 결과 페이지를 넘길 때는 다시 저장하지 않습니다.
@JsonSerializable()
class BookSearchHistoryRequest {
  const BookSearchHistoryRequest({
    required this.keyword,
    this.target,
  });
  
  factory BookSearchHistoryRequest.fromJson(Map<String, Object?> json) => _$BookSearchHistoryRequestFromJson(json);
  
  /// 앞뒤 공백 제거 후 1~100자 검색어. 같은 회원의 같은 검색어는 기존 이력을 갱신합니다.
  final String keyword;
  final BookSearchTarget? target;

  Map<String, Object?> toJson() => _$BookSearchHistoryRequestToJson(this);
}
