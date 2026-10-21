// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'book_metadata.dart';

part 'book_page_response.g.dart';

/// 외부 도서 검색·인기 도서의 페이지 응답. 책 정보는 DB에 저장하지 않습니다.
@JsonSerializable()
class BookPageResponse {
  const BookPageResponse({
    required this.page,
    required this.size,
    required this.totalCount,
    required this.books,
  });
  
  factory BookPageResponse.fromJson(Map<String, Object?> json) => _$BookPageResponseFromJson(json);
  
  /// 요청한 페이지 번호. 1부터 시작합니다.
  final int page;

  /// 요청한 페이지 크기. 실제 books 배열은 더 작을 수 있습니다.
  final int size;

  /// 외부 제공처의 전체 검색 건수. 유효 ISBN 없는 항목 제외·페이지 내 ISBN 중복 제거 전의 값입니다.
  final int totalCount;

  /// 도서 목록. 검색 결과가 없으면 빈 배열이며 외부 순서를 유지합니다.
  final List<BookMetadata> books;

  Map<String, Object?> toJson() => _$BookPageResponseToJson(this);
}
