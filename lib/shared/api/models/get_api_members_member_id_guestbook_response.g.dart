// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_api_members_member_id_guestbook_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetApiMembersMemberIdGuestbookResponse
_$GetApiMembersMemberIdGuestbookResponseFromJson(Map<String, dynamic> json) =>
    GetApiMembersMemberIdGuestbookResponse(
      success: json['success'] as bool,
      code: json['code'] as String,
      message: json['message'] as String,
      data: GuestbookResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetApiMembersMemberIdGuestbookResponseToJson(
  GetApiMembersMemberIdGuestbookResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
