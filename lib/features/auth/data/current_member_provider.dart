import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:moamo/shared/api/export.dart';
import 'package:moamo/shared/network/api_client.dart';

part 'current_member_provider.g.dart';

/// 로그인한 내 정보 (`memberId`·닉네임).
@riverpod
Future<AuthUserResponse> currentMember(Ref ref) async {
  final res = await apiClient.auth.getCurrentMember();
  return res.data;
}
