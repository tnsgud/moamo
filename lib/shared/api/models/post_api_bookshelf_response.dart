// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'bookshelf_response.dart';

part 'post_api_bookshelf_response.g.dart';

@JsonSerializable()
class PostApiBookshelfResponse {
  const PostApiBookshelfResponse({
    required this.success,
    required this.code,
    required this.message,
    required this.data,
  });
  
  factory PostApiBookshelfResponse.fromJson(Map<String, Object?> json) => _$PostApiBookshelfResponseFromJson(json);
  
  /// 요청 성공 여부
  final bool success;

  /// 성공은 OK, 실패는 오류 코드
  final String code;

  /// 성공·오류 안내 메시지
  final String message;
  final BookshelfResponse data;

  Map<String, Object?> toJson() => _$PostApiBookshelfResponseToJson(this);
}
