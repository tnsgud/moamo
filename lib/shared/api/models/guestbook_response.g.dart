// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guestbook_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuestbookResponse _$GuestbookResponseFromJson(Map<String, dynamic> json) =>
    GuestbookResponse(
      ownerMemberId: json['ownerMemberId'] as String?,
      ownerNickname: json['ownerNickname'] as String?,
      totalEntries: (json['totalEntries'] as num?)?.toInt(),
      unreadEntries: (json['unreadEntries'] as num?)?.toInt(),
      ownerView: json['ownerView'] as bool?,
      page: (json['page'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt(),
      hasNext: json['hasNext'] as bool?,
      entries: (json['entries'] as List<dynamic>?)
          ?.map(
            (e) => GuestbookEntryResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$GuestbookResponseToJson(GuestbookResponse instance) =>
    <String, dynamic>{
      'ownerMemberId': instance.ownerMemberId,
      'ownerNickname': instance.ownerNickname,
      'totalEntries': instance.totalEntries,
      'unreadEntries': instance.unreadEntries,
      'ownerView': instance.ownerView,
      'page': instance.page,
      'size': instance.size,
      'hasNext': instance.hasNext,
      'entries': instance.entries,
    };
