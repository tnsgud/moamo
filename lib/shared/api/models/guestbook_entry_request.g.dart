// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guestbook_entry_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuestbookEntryRequest _$GuestbookEntryRequestFromJson(
  Map<String, dynamic> json,
) => GuestbookEntryRequest(
  content: json['content'] as String?,
  stickerKeys: (json['stickerKeys'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$GuestbookEntryRequestToJson(
  GuestbookEntryRequest instance,
) => <String, dynamic>{
  'content': instance.content,
  'stickerKeys': instance.stickerKeys,
};
