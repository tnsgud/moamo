import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:moamo/shared/api/export.dart';
import 'package:moamo/shared/network/api_client.dart';

part 'book_memos_provider.g.dart';

/// 책장에 담긴 책 한 권의 내 메모 목록 (공개·비공개 모두).
/// [bookId]는 ISBN이 아니라 `book.id`.
@riverpod
class BookMemos extends _$BookMemos {
  @override
  Future<List<BookMemoResponse>> build(
    String bookshelfId,
    String bookId,
  ) async {
    final res = await apiClient.bookMemo.getMyBookMemos(
      bookshelfId: bookshelfId,
      bookId: bookId,
    );
    return res.data;
  }

  /// 글·사진 중 하나는 필수.
  Future<void> create({
    String? content,
    File? image,
    required BookMemoVisibility visibility,
  }) async {
    await apiClient.bookMemo.createMyBookMemo(
      bookshelfId: bookshelfId,
      bookId: bookId,
      content: content,
      image: image,
      visibility: visibility,
    );
    ref.invalidateSelf();
  }

  Future<void> edit(
    String memoId, {
    String? content,
    File? image,
    required BookMemoVisibility visibility,
  }) async {
    await apiClient.bookMemo.updateMyBookMemo(
      bookshelfId: bookshelfId,
      bookId: bookId,
      memoId: memoId,
      content: content,
      image: image,
      visibility: visibility,
    );
    ref.invalidateSelf();
  }

  Future<void> delete(String memoId) async {
    await apiClient.bookMemo.deleteMyBookMemo(
      bookshelfId: bookshelfId,
      bookId: bookId,
      memoId: memoId,
    );
    ref.invalidateSelf();
  }
}
