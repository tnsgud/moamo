// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'guestbook_read_request.g.dart';

/// 방명록 주인이 화면에 표시된 글을 읽음 처리합니다. 뒤늦게 도착한 다른 글은 새 글로 유지합니다.
@JsonSerializable()
class GuestbookReadRequest {
  const GuestbookReadRequest({
    required this.entryIds,
  });
  
  factory GuestbookReadRequest.fromJson(Map<String, Object?> json) => _$GuestbookReadRequestFromJson(json);
  
  /// 화면에 표시된 방명록 글 UUID 1~100개. 이미 읽은 글·삭제된 글·다른 방명록의 글은 무시합니다.
  final List<String> entryIds;

  Map<String, Object?> toJson() => _$GuestbookReadRequestToJson(this);
}
