// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_api_members_member_id_guestbook_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostApiMembersMemberIdGuestbookResponse
_$PostApiMembersMemberIdGuestbookResponseFromJson(Map<String, dynamic> json) =>
    PostApiMembersMemberIdGuestbookResponse(
      success: json['success'] as bool,
      code: json['code'] as String,
      message: json['message'] as String,
      data: GuestbookEntryResponse.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$PostApiMembersMemberIdGuestbookResponseToJson(
  PostApiMembersMemberIdGuestbookResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
