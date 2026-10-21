// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guestbook_entry_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuestbookEntryResponse _$GuestbookEntryResponseFromJson(
  Map<String, dynamic> json,
) => GuestbookEntryResponse(
  id: json['id'] as String,
  authorMemberId: json['authorMemberId'] as String,
  authorNickname: json['authorNickname'] as String,
  stickerKeys: (json['stickerKeys'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  content: json['content'] as String?,
  ownerEntry: json['ownerEntry'] as bool?,
  mine: json['mine'] as bool?,
  canEdit: json['canEdit'] as bool?,
  canDelete: json['canDelete'] as bool?,
  unread: json['unread'] as bool?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$GuestbookEntryResponseToJson(
  GuestbookEntryResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'authorMemberId': instance.authorMemberId,
  'authorNickname': instance.authorNickname,
  'content': instance.content,
  'stickerKeys': instance.stickerKeys,
  'ownerEntry': instance.ownerEntry,
  'mine': instance.mine,
  'canEdit': instance.canEdit,
  'canDelete': instance.canDelete,
  'unread': instance.unread,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
