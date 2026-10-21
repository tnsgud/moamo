// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'bookshelf_preview_book_request_display_type.dart';

part 'bookshelf_preview_book_request.g.dart';

/// 미리보기에 표시할 책 한 권. 해당 책장에 이미 담긴 책만 선택할 수 있습니다.
@JsonSerializable()
class BookshelfPreviewBookRequest {
  const BookshelfPreviewBookRequest({
    required this.bookId,
    required this.slot,
    this.displayType = BookshelfPreviewBookRequestDisplayType.spine,
  });
  
  factory BookshelfPreviewBookRequest.fromJson(Map<String, Object?> json) => _$BookshelfPreviewBookRequestFromJson(json);
  
  /// 책장 책 목록 응답의 book.id. ISBN이 아닙니다.
  final String bookId;

  /// 미리보기 위치 0~5. 책과 아이템 전체에서 중복할 수 없으며 작은 값부터 표시합니다.
  final int slot;

  /// 미리보기의 책 표시 방식. FRONT는 앞표지, SPINE은 책등입니다.
  final BookshelfPreviewBookRequestDisplayType displayType;

  Map<String, Object?> toJson() => _$BookshelfPreviewBookRequestToJson(this);
}
