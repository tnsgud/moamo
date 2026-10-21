// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'bookshelf_preview_book_response.dart';
import 'bookshelf_preview_item.dart';

part 'bookshelf_decoration_response.g.dart';

/// 책장에 저장된 꾸미기 설정. 선택 책과 아이템은 각각 위치 오름차순이며, 화면에서는 두 배열을 slot으로 합쳐 배치합니다.
@JsonSerializable()
class BookshelfDecorationResponse {
  const BookshelfDecorationResponse({
    required this.bookshelfId,
    required this.name,
    required this.templateKey,
    required this.coverColor,
    required this.books,
    required this.items,
  });
  
  factory BookshelfDecorationResponse.fromJson(Map<String, Object?> json) => _$BookshelfDecorationResponseFromJson(json);
  
  /// 책장 UUID
  final String bookshelfId;

  /// 저장된 책장 이름
  final String name;

  /// 저장한 템플릿 키. 생성에서 생략하면 DEFAULT입니다.
  final String templateKey;

  /// 저장한 #RRGGBB 색상. 생성에서 생략하면 #D9DBFF입니다.
  final String coverColor;

  /// 미리보기에 선택한 책 최대 3권. 선택한 책이 없으면 빈 배열입니다.
  final List<BookshelfPreviewBookResponse> books;

  /// 미리보기 아이템 최대 3개. 선택한 아이템이 없으면 빈 배열입니다.
  final List<BookshelfPreviewItem> items;

  Map<String, Object?> toJson() => _$BookshelfDecorationResponseToJson(this);
}
