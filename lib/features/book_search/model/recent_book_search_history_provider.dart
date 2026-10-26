import 'package:moamo/shared/api/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/network/api_client.dart';

part 'recent_book_search_history_provider.g.dart';

@riverpod
class BookSearchHistory extends _$BookSearchHistory {
  @override
  Future<List<BookSearchHistoryResponse>> build() async {
    final res = await apiClient.bookSearchHistory.getMyRecentSearches();
    return res.data;
  }

  Future<void> add(String keyword, BookSearchTarget target) async {
    await apiClient.bookSearchHistory.saveMyRecentSearch(
      body: BookSearchHistoryRequest(keyword: keyword, target: target),
    );
    ref.invalidateSelf();
  }

  Future<void> delete(String historyId) async {
    await apiClient.bookSearchHistory.deleteMyRecentSearch(
      historyId: historyId,
    );
    ref.invalidateSelf();
  }

  Future<void> clear() async {
    await apiClient.bookSearchHistory.clearMyRecentSearches();

    ref.invalidateSelf();
  }
}
