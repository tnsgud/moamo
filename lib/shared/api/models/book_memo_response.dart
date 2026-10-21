// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'book_memo_response_visibility.dart';

part 'book_memo_response.g.dart';

/// 회원의 책장에 담긴 개별 책에 작성한 메모와 공개 범위. PRIVATE는 작성자만, PUBLIC은 다른 로그인 회원도 조회합니다. 작성자의 회원 UUID·닉네임을 반환하며 사진 바이너리는 별도 imageUrl에서 JWT와 함께 조회합니다.
@JsonSerializable()
class BookMemoResponse {
  const BookMemoResponse({
    required this.id,
    required this.bookshelfBookId,
    required this.bookshelfId,
    required this.bookId,
    required this.visibility,
    required this.authorId,
    required this.authorNickname,
    required this.createdAt,
    required this.updatedAt,
    this.content,
    this.page,
    this.imageUrl,
  });
  
  factory BookMemoResponse.fromJson(Map<String, Object?> json) => _$BookMemoResponseFromJson(json);
  
  /// 메모 UUID. 수정·삭제·사진 조회에 사용하는 memoId입니다.
  final String id;

  /// 메모가 연결된 개별 책 UUID. 책장 책 응답의 id입니다. 공유 도서 정보인 bookId와 구분합니다.
  final String bookshelfBookId;

  /// 메모 작성자의 책장 UUID
  final String bookshelfId;

  /// DB에 저장된 공유 도서 정보 UUID. 같은 도서는 여러 회원·책장에서 같은 값이며 ISBN이 아닙니다.
  final String bookId;

  /// 메모 글. 사진만 있는 메모는 null입니다.
  final String? content;

  /// 기록한 페이지 번호. 입력하지 않았으면 null입니다.
  final int? page;

  /// 메모 공개 범위. PRIVATE는 작성자만, PUBLIC은 다른 로그인 회원도 글과 사진을 조회할 수 있습니다.
  final BookMemoResponseVisibility visibility;

  /// 메모 작성자의 서비스 회원 UUID. 카카오 회원번호를 공개하지 않습니다.
  final String authorId;

  /// 메모 작성자 닉네임
  final String authorNickname;

  /// 사진 조회 API의 서버 기준 상대 경로. 사진이 없으면 null입니다. Authorization: Bearer <accessToken>이 필요하며 PRIVATE 사진은 작성자, PUBLIC 사진은 다른 회원도 조회합니다.
  final String? imageUrl;

  /// 생성 시각(UTC ISO-8601). 수정해도 유지합니다.
  final DateTime createdAt;

  /// 마지막 수정 시각(UTC ISO-8601). 생성 시에는 createdAt과 같습니다.
  final DateTime updatedAt;

  Map<String, Object?> toJson() => _$BookMemoResponseToJson(this);
}
