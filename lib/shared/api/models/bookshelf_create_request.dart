// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'bookshelf_preview_item.dart';

part 'bookshelf_create_request.g.dart';

/// 새 책장과 꾸미기 설정을 함께 생성합니다. 이름만 전송하면 기본 설정의 빈 책장을 만듭니다. 책은 생성 후 /api/bookshelf/{bookshelfId}/books로 추가합니다.
@JsonSerializable()
class BookshelfCreateRequest {
  const BookshelfCreateRequest({
    required this.name,
    this.items,
    this.templateKey = 'DEFAULT',
    this.coverColor = '#D9DBFF',
  });
  
  factory BookshelfCreateRequest.fromJson(Map<String, Object?> json) => _$BookshelfCreateRequestFromJson(json);
  
  /// 앞뒤 공백 제거 후 1~50자 책장 이름. 중복 이름을 허용하고 책장 UUID로 구분합니다.
  final String name;

  /// 선택 템플릿 키. 생략·null이면 DEFAULT입니다. 앞뒤 공백 제거·대문자 정규화 후 영문자로 시작하는 영문·숫자·밑줄 1~50자입니다.
  final String templateKey;

  /// 선택 책 표지·책등 색상 #RRGGBB. 생략·null이면 #D9DBFF입니다. 앞뒤 공백 제거·대문자 정규화 후 저장합니다.
  final String coverColor;

  /// 생성 시 배치할 아이템 최대 3개. 생략·null·빈 배열이면 아이템을 배치하지 않습니다.
  final List<BookshelfPreviewItem>? items;

  Map<String, Object?> toJson() => _$BookshelfCreateRequestToJson(this);
}
