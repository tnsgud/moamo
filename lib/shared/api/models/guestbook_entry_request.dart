// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'guestbook_entry_request.g.dart';

/// 방명록 작성·수정 요청. 글 또는 스티커 중 하나는 필요합니다. 수정에서는 최종 내용 전체를 전송합니다.
@JsonSerializable()
class GuestbookEntryRequest {
  const GuestbookEntryRequest({
    this.content,
    this.stickerKeys,
  });
  
  factory GuestbookEntryRequest.fromJson(Map<String, Object?> json) => _$GuestbookEntryRequestFromJson(json);
  
  /// 앞뒤 공백 제거 후 최대 1,000자. 줄바꿈과 일반 이모지를 유지합니다. 빈 글은 null로 저장합니다.
  final String? content;

  /// 프런트의 스티커 자산 키 최대 10개. 순서와 반복을 유지합니다. 앞뒤 공백 제거·대문자 정규화 후 영문자로 시작하는 영문·숫자·밑줄 1~50자입니다. 생략·null은 빈 배열이며 이미지 파일이나 URL은 받지 않습니다.
  final List<String>? stickerKeys;

  Map<String, Object?> toJson() => _$GuestbookEntryRequestToJson(this);
}
