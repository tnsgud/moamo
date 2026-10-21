// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'bookshelf_add_request.g.dart';

/// 선택한 책장에 책을 추가하는 요청. 회원·책장·제목·표지 URL을 본문에서 받지 않습니다.
@JsonSerializable()
class BookshelfAddRequest {
  const BookshelfAddRequest({
    required this.isbn,
  });
  
  factory BookshelfAddRequest.fromJson(Map<String, Object?> json) => _$BookshelfAddRequestFromJson(json);
  
  /// ISBN-13. 공백·하이픈을 제거한 13자리로 처리하며 서버가 책 정보를 조회합니다.
  final String isbn;

  Map<String, Object?> toJson() => _$BookshelfAddRequestToJson(this);
}
