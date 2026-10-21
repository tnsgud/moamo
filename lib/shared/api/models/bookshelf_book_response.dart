// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'book_response.dart';

part 'bookshelf_book_response.g.dart';

/// 회원의 책장에 담긴 개별 책 항목. 동일한 도서도 회원·책장마다 id와 메모가 다르며 book.id는 공유 도서 정보 UUID입니다.
@JsonSerializable()
class BookshelfBookResponse {
  const BookshelfBookResponse({
    required this.id,
    required this.book,
    required this.addedAt,
  });
  
  factory BookshelfBookResponse.fromJson(Map<String, Object?> json) => _$BookshelfBookResponseFromJson(json);
  
  /// 이 책장에 담긴 개별 책 UUID. 메모 응답의 bookshelfBookId와 같습니다. 같은 도서를 다른 회원 또는 다른 책장에 추가하면 다른 값입니다. 경로의 bookId는 이 값이 아닌 book.id를 사용합니다.
  final String id;
  final BookResponse book;

  /// 해당 책장에 추가된 시각(UTC ISO-8601).
  final DateTime addedAt;

  Map<String, Object?> toJson() => _$BookshelfBookResponseToJson(this);
}
