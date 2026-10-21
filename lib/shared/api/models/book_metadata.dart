// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'book_metadata_cover_image_source.dart';

part 'book_metadata.g.dart';

/// 외부 API의 도서 정보. 검색·인기·추천·ISBN 상세 조회는 DB에 저장하지 않으므로 내부 id가 없습니다.
@JsonSerializable()
class BookMetadata {
  const BookMetadata({
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
  
  factory BookMetadata.fromJson(Map<String, Object?> json) => _$BookMetadataFromJson(json);
  
  /// 책의 검색 식별자 ISBN-13. 책장에 추가할 때 이 값을 보냅니다.
  final String isbn;

  /// 책 제목
  final String title;

  /// 외부 제공처의 저자 표기 원문. 여러 저자도 하나의 문자열로 반환합니다.
  final String? authors;

  /// 출판사
  final String? publisher;

  /// 제공처의 출판 예정일 또는 발행연도 원문. yyyyMMdd 또는 yyyy 등이므로 날짜 타입으로 단정하지 않습니다.
  final String? publicationDate;

  /// 한국십진분류(KDC) 코드 원문. 앱 카테고리로 자동 변환하지 않습니다.
  final String? kdc;

  /// 제공처의 분류명. ISBN API에는 없을 수 있습니다.
  final String? classificationName;

  /// 표지 이미지 HTTP(S) URL. 없으면 null입니다. 파일은 내려받지 않으며 프런트에서 기본 표지를 처리합니다.
  final String? coverImageUrl;

  /// 표지 URL의 제공처. 표지가 없으면 null입니다. 정보나루 표지는 비영리 화면 표시 조건을 따릅니다.
  final BookMetadataCoverImageSource? coverImageSource;

  /// 책 소개 원문. 없으면 null이며 외부 문자열은 화면에서 텍스트로 표시합니다.
  final String? description;

  Map<String, Object?> toJson() => _$BookMetadataToJson(this);
}
