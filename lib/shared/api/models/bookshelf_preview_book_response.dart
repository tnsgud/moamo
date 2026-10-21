// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'book_response.dart';
import 'bookshelf_preview_book_response_display_type.dart';

part 'bookshelf_preview_book_response.g.dart';

/// 책장 미리보기에 선택한 책과 표시 설정. 제목·저자·표지 URL을 함께 반환합니다.
@JsonSerializable()
class BookshelfPreviewBookResponse {
  const BookshelfPreviewBookResponse({
    required this.slot,
    required this.displayType,
    required this.book,
  });
  
  factory BookshelfPreviewBookResponse.fromJson(Map<String, Object?> json) => _$BookshelfPreviewBookResponseFromJson(json);
  
  /// 미리보기 위치. 책·아이템 전체에서 작은 값부터 표시합니다.
  final int slot;

  /// 미리보기의 책 표시 방식. FRONT는 앞표지, SPINE은 책등입니다.
  final BookshelfPreviewBookResponseDisplayType displayType;
  final BookResponse book;

  Map<String, Object?> toJson() => _$BookshelfPreviewBookResponseToJson(this);
}
