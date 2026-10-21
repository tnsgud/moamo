// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_memo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookMemoResponse _$BookMemoResponseFromJson(Map<String, dynamic> json) =>
    BookMemoResponse(
      id: json['id'] as String,
      bookshelfBookId: json['bookshelfBookId'] as String,
      bookshelfId: json['bookshelfId'] as String,
      bookId: json['bookId'] as String,
      visibility: BookMemoResponseVisibility.fromJson(
        json['visibility'] as String,
      ),
      authorId: json['authorId'] as String,
      authorNickname: json['authorNickname'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      content: json['content'] as String?,
      page: (json['page'] as num?)?.toInt(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$BookMemoResponseToJson(BookMemoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookshelfBookId': instance.bookshelfBookId,
      'bookshelfId': instance.bookshelfId,
      'bookId': instance.bookId,
      'content': instance.content,
      'page': instance.page,
      'visibility': _$BookMemoResponseVisibilityEnumMap[instance.visibility]!,
      'authorId': instance.authorId,
      'authorNickname': instance.authorNickname,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$BookMemoResponseVisibilityEnumMap = {
  BookMemoResponseVisibility.private: 'PRIVATE',
  BookMemoResponseVisibility.public: 'PUBLIC',
  BookMemoResponseVisibility.$unknown: r'$unknown',
};
