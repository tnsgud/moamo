// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'put_api_members_member_id_guestbook_entry_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PutApiMembersMemberIdGuestbookEntryIdResponse
_$PutApiMembersMemberIdGuestbookEntryIdResponseFromJson(
  Map<String, dynamic> json,
) => PutApiMembersMemberIdGuestbookEntryIdResponse(
  success: json['success'] as bool,
  code: json['code'] as String,
  message: json['message'] as String,
  data: GuestbookEntryResponse.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PutApiMembersMemberIdGuestbookEntryIdResponseToJson(
  PutApiMembersMemberIdGuestbookEntryIdResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
