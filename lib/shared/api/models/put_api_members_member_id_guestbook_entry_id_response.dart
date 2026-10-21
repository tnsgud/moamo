// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'guestbook_entry_response.dart';

part 'put_api_members_member_id_guestbook_entry_id_response.g.dart';

@JsonSerializable()
class PutApiMembersMemberIdGuestbookEntryIdResponse {
  const PutApiMembersMemberIdGuestbookEntryIdResponse({
    required this.success,
    required this.code,
    required this.message,
    required this.data,
  });
  
  factory PutApiMembersMemberIdGuestbookEntryIdResponse.fromJson(Map<String, Object?> json) => _$PutApiMembersMemberIdGuestbookEntryIdResponseFromJson(json);
  
  /// 요청 성공 여부
  final bool success;

  /// 성공은 OK, 실패는 오류 코드
  final String code;

  /// 성공·오류 안내 메시지
  final String message;
  final GuestbookEntryResponse data;

  Map<String, Object?> toJson() => _$PutApiMembersMemberIdGuestbookEntryIdResponseToJson(this);
}
