// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guestbook_read_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuestbookReadRequest _$GuestbookReadRequestFromJson(
  Map<String, dynamic> json,
) => GuestbookReadRequest(
  entryIds: (json['entryIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$GuestbookReadRequestToJson(
  GuestbookReadRequest instance,
) => <String, dynamic>{'entryIds': instance.entryIds};
