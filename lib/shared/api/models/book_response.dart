// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'book_response_cover_image_source.dart';

part 'book_response.g.dart';

/// 책장에 추가할 때 저장한 책 정보. ISBN당 하나의 내부 UUID를 여러 회원·책장에서 공유합니다.
@JsonSerializable()
class BookResponse {
  const BookResponse({
    required this.id,
    required this.isbn,
    required this.title,
    this.authors,
    this.publisher,
    this.publicationDate,
    this.kdc,
    this.classificationName,
    this.coverImageUrl,
    this.coverImageSource,
    this.description,
  });
  
  factory BookResponse.fromJson(Map<String, Object?> json) => _$BookResponseFromJson(json);
  
  /// 저장된 책 UUID. 책장 UUID와 다릅니다. GET /api/books/{id}에 사용합니다.
  final String id;

  /// 책의 ISBN-13
  final String isbn;

  /// 저장된 책 제목
  final String title;

  /// 저자 표기 원문. 여러 저자도 문자열로 반환합니다.
  final String? authors;

  /// 출판사
  final String? publisher;

  /// 제공처의 예정일 또는 발행연도 원문. yyyyMMdd 또는 yyyy 등의 값입니다.
  final String? publicationDate;

  /// 한국십진분류(KDC) 코드 원문
  final String? kdc;

  /// 제공처의 분류명
  final String? classificationName;

  /// 저장한 표지 URL. 이미지 파일이 아니며 없으면 null입니다.
  final String? coverImageUrl;

  /// 표지 URL 제공처. 표지가 없으면 null입니다.
  final BookResponseCoverImageSource? coverImageSource;

  /// 저장한 책 소개 원문. 없으면 null입니다.
  final String? description;

  Map<String, Object?> toJson() => _$BookResponseToJson(this);
}
