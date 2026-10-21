// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'bookshelf_response.g.dart';

/// 회원이 소유한 책장 요약. 책 목록은 /api/bookshelf/{bookshelfId}/books에서 조회합니다.
@JsonSerializable()
class BookshelfResponse {
  const BookshelfResponse({
    required this.id,
    required this.name,
    required this.bookCount,
    required this.createdAt,
    required this.templateKey,
    required this.coverColor,
  });
  
  factory BookshelfResponse.fromJson(Map<String, Object?> json) => _$BookshelfResponseFromJson(json);
  
  /// 책장 UUID. 책의 UUID가 아닙니다. 책장별 책 조회·추가·삭제 경로에 사용합니다.
  final String id;

  /// 책장 이름
  final String name;

  /// 현재 해당 책장에 담긴 책 수. 빈 책장은 0입니다.
  final int bookCount;

  /// 책장 생성 시각(UTC ISO-8601)
  final DateTime createdAt;

  /// 생성·꾸미기 수정 시 저장한 책장 템플릿 키. 생성에서 생략하면 DEFAULT입니다.
  final String templateKey;

  /// 생성·꾸미기 수정 시 저장한 책 표지·책등 색상. 생성에서 생략하면 #D9DBFF입니다.
  final String coverColor;

  Map<String, Object?> toJson() => _$BookshelfResponseToJson(this);
}
