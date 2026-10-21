// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'guestbook_entry_response.dart';

part 'guestbook_response.g.dart';

/// 회원별 방명록과 목록 페이지. 모든 회원은 별도 생성 요청 없이 빈 방명록부터 조회할 수 있습니다.
@JsonSerializable()
class GuestbookResponse {
  const GuestbookResponse({
    this.ownerMemberId,
    this.ownerNickname,
    this.totalEntries,
    this.unreadEntries,
    this.ownerView,
    this.page,
    this.size,
    this.hasNext,
    this.entries,
  });
  
  factory GuestbookResponse.fromJson(Map<String, Object?> json) => _$GuestbookResponseFromJson(json);
  
  /// 방명록 주인 회원 UUID
  final String? ownerMemberId;

  /// 방명록 제목에 사용할 주인 닉네임
  final String? ownerNickname;

  /// 전체 방명록 글 수. 주인이 작성한 글도 포함합니다.
  final int? totalEntries;

  /// 주인이 읽지 않은 방문자 글 수. 주인 외의 조회자에게는 0입니다.
  final int? unreadEntries;

  /// 현재 조회자가 방명록 주인인지 여부
  final bool? ownerView;

  /// 0부터 시작하는 페이지 번호
  final int? page;

  /// 요청한 페이지 크기
  final int? size;

  /// 더 오래된 글의 다음 페이지 존재 여부
  final bool? hasNext;

  /// 최신순 글 목록. 글이 없으면 빈 배열입니다.
  final List<GuestbookEntryResponse>? entries;

  Map<String, Object?> toJson() => _$GuestbookResponseToJson(this);
}
