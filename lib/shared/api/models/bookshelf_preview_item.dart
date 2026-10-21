// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'bookshelf_preview_item.g.dart';

/// 미리보기 꾸미기 아이템. 이미지 대신 프런트에서 사용하는 아이템 키와 위치를 저장합니다.
@JsonSerializable()
class BookshelfPreviewItem {
  const BookshelfPreviewItem({
    required this.itemKey,
    required this.slot,
  });
  
  factory BookshelfPreviewItem.fromJson(Map<String, Object?> json) => _$BookshelfPreviewItemFromJson(json);
  
  /// 프런트에 정의한 아이템 키. 앞뒤 공백 제거·대문자 정규화 후 영문자로 시작하는 영문·숫자·밑줄 1~50자입니다. 같은 아이템을 다른 위치에 반복 배치할 수 있습니다.
  final String itemKey;

  /// 미리보기 위치 0~5. 책과 아이템 전체에서 위치를 중복할 수 없습니다.
  final int slot;

  Map<String, Object?> toJson() => _$BookshelfPreviewItemToJson(this);
}
