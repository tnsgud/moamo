// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'guestbook_entry_response.g.dart';

/// 방명록 글. 작성자 UUID·닉네임만 공개하며 카카오 계정 정보는 포함하지 않습니다.
@JsonSerializable()
class GuestbookEntryResponse {
  const GuestbookEntryResponse({
    required this.id,
    required this.authorMemberId,
    required this.authorNickname,
    required this.stickerKeys,
    this.content,
    this.ownerEntry,
    this.mine,
    this.canEdit,
    this.canDelete,
    this.unread,
    this.createdAt,
    this.updatedAt,
  });
  
  factory GuestbookEntryResponse.fromJson(Map<String, Object?> json) => _$GuestbookEntryResponseFromJson(json);
  
  /// 방명록 글 UUID
  final String id;

  /// 작성자 회원 UUID
  final String authorMemberId;

  /// 작성자의 현재 닉네임
  final String authorNickname;

  /// 글 내용. 스티커만 작성했으면 null입니다.
  final String? content;

  /// 작성 순서대로 표시할 스티커 자산 키. 없으면 빈 배열입니다.
  final List<String> stickerKeys;

  /// 방명록 주인이 쓴 글인지 여부. 주인 글의 말풍선 색상을 구분할 때 사용합니다.
  final bool? ownerEntry;

  /// 현재 조회자가 작성한 글인지 여부
  final bool? mine;

  /// 수정 메뉴 표시 여부. 작성자 본인만 true입니다.
  final bool? canEdit;

  /// 삭제 메뉴 표시 여부. 작성자 본인 또는 방명록 주인에게 true입니다.
  final bool? canDelete;

  /// 주인이 아직 읽지 않은 방문자 글. 주인이 조회할 때만 true가 될 수 있습니다. 수정으로 다시 새 글이 되지 않습니다.
  final bool? unread;

  /// 작성 시각(UTC ISO-8601). 수정해도 유지합니다.
  final DateTime? createdAt;

  /// 마지막 수정 시각(UTC ISO-8601)
  final DateTime? updatedAt;

  Map<String, Object?> toJson() => _$GuestbookEntryResponseToJson(this);
}
