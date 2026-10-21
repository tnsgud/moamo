// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'book_memo_response.dart';

part 'public_book_memo_page_response.g.dart';

/// 책별 공개 메모 페이지. PRIVATE 또는 공개 범위 값이 없는 기존 메모는 목록·총 건수에서 제외합니다.
@JsonSerializable()
class PublicBookMemoPageResponse {
  const PublicBookMemoPageResponse({
    required this.page,
    required this.size,
    required this.totalCount,
    required this.memos,
  });
  
  factory PublicBookMemoPageResponse.fromJson(Map<String, Object?> json) => _$PublicBookMemoPageResponseFromJson(json);
  
  /// 1부터 시작하는 요청 페이지
  final int page;

  /// 페이지당 요청 건수
  final int size;

  /// 해당 책의 PUBLIC 메모 총 건수
  final int totalCount;

  /// 공개 메모 배열. 없으면 빈 배열이며 자신의 공개 메모도 포함합니다.
  final List<BookMemoResponse> memos;

  Map<String, Object?> toJson() => _$PublicBookMemoPageResponseToJson(this);
}
