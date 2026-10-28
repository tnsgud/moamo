import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:moamo/shared/api/export.dart';
import 'package:moamo/shared/network/api_client.dart';

part 'guestbook_provider.g.dart';

/// 회원 방명록. 서버는 최신순으로 준다.
@riverpod
class Guestbook extends _$Guestbook {
  @override
  Future<GuestbookResponse> build(String memberId) async {
    // ponytail: 최대 100개 한 페이지만. 더 많아지면 page로 이어 붙이기.
    final res = await apiClient.guestbook.getMemberGuestbook(
      memberId: memberId,
      size: '100',
    );
    return res.data;
  }

  /// 글·스티커 중 하나는 필수.
  Future<void> add({String? content, List<String>? stickerKeys}) async {
    await apiClient.guestbook.createGuestbookEntry(
      memberId: memberId,
      body: GuestbookEntryRequest(content: content, stickerKeys: stickerKeys),
    );
    ref.invalidateSelf();
  }

  Future<void> edit(String entryId, {String? content}) async {
    await apiClient.guestbook.updateGuestbookEntry(
      memberId: memberId,
      entryId: entryId,
      body: GuestbookEntryRequest(content: content),
    );
    ref.invalidateSelf();
  }

  Future<void> delete(String entryId) async {
    await apiClient.guestbook.deleteGuestbookEntry(
      memberId: memberId,
      entryId: entryId,
    );
    ref.invalidateSelf();
  }

  /// 주인만 호출. 화면의 N 표시는 다음에 열 때 사라지도록 다시 불러오지 않는다.
  Future<void> markRead(List<String> entryIds) =>
      apiClient.guestbook.markGuestbookEntriesRead(
        memberId: memberId,
        body: GuestbookReadRequest(entryIds: entryIds),
      );
}
