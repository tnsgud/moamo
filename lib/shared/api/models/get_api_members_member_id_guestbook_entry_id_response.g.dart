// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_api_members_member_id_guestbook_entry_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetApiMembersMemberIdGuestbookEntryIdResponse
_$GetApiMembersMemberIdGuestbookEntryIdResponseFromJson(
  Map<String, dynamic> json,
) => GetApiMembersMemberIdGuestbookEntryIdResponse(
  success: json['success'] as bool,
  code: json['code'] as String,
  message: json['message'] as String,
  data: GuestbookEntryResponse.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetApiMembersMemberIdGuestbookEntryIdResponseToJson(
  GetApiMembersMemberIdGuestbookEntryIdResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
