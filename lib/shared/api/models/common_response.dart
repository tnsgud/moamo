// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'common_response.g.dart';

/// 공통 JSON 응답. success·code·message·data를 항상 반환합니다. 성공은 code=OK와 기존 DTO·배열·페이지를 data에, 실패는 오류 코드·메시지와 선택 추가 정보를 반환합니다. HTTP 상태 코드를 유지합니다. 비공개 오류의 data에는 visibility=PRIVATE를 포함합니다. 204·사진 바이너리는 래퍼가 없습니다.
@JsonSerializable()
class CommonResponse {
  const CommonResponse({
    required this.success,
    required this.code,
    required this.message,
    required this.data,
  });
  
  factory CommonResponse.fromJson(Map<String, Object?> json) => _$CommonResponseFromJson(json);
  
  /// 요청 성공 여부
  final bool success;

  /// 성공은 OK, 실패는 오류 코드
  final String code;

  /// 성공·오류 안내 메시지
  final String message;
  final dynamic data;

  Map<String, Object?> toJson() => _$CommonResponseToJson(this);
}
