// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'bookshelf_preview_book_request.dart';
import 'bookshelf_preview_item.dart';

part 'bookshelf_decoration_request.g.dart';

/// 책장 꾸미기 전체 저장 요청. 이름·템플릿·색상·책/아이템 미리보기를 한 번에 교체합니다.
@JsonSerializable()
class BookshelfDecorationRequest {
  const BookshelfDecorationRequest({
    required this.name,
    required this.templateKey,
    required this.coverColor,
    this.books,
    this.items,
  });
  
  factory BookshelfDecorationRequest.fromJson(Map<String, Object?> json) => _$BookshelfDecorationRequestFromJson(json);
  
  /// 앞뒤 공백 제거 후 1~50자 책장 이름. 기존 책장 이름도 함께 수정합니다.
  final String name;

  /// 프런트에서 사용하는 템플릿 키. DEFAULT는 기본 템플릿입니다. 앞뒤 공백 제거·대문자 정규화 후 영문자로 시작하는 영문·숫자·밑줄 1~50자입니다.
  final String templateKey;

  /// 책 표지·책등 표현에 사용할 색상. #RRGGBB 형식이며 대문자로 정규화합니다. 도서 표지 이미지 URL 자체를 변경하지 않습니다.
  final String coverColor;

  /// 미리보기에 선택한 책 최대 3권. 같은 책을 반복 선택할 수 없습니다. 생략·null·빈 배열이면 책 미리보기를 비웁니다. 책장에 담긴 책은 삭제하지 않습니다.
  final List<BookshelfPreviewBookRequest>? books;

  /// 미리보기에 배치한 꾸미기 아이템 최대 3개. 생략·null·빈 배열이면 아이템 미리보기를 비웁니다.
  final List<BookshelfPreviewItem>? items;

  Map<String, Object?> toJson() => _$BookshelfDecorationRequestToJson(this);
}
