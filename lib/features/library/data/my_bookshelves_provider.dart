import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:moamo/shared/api/models/bookshelf_response.dart';
import 'package:moamo/shared/network/api_client.dart';

part 'my_bookshelves_provider.g.dart';

/// 내 책장 목록 (생성 시각 최신순). 책장이 없으면 빈 리스트.
@riverpod
Future<List<BookshelfResponse>> myBookshelves(Ref ref) async {
  final res = await apiClient.bookshelf.getMyBookshelves();
  return res.data;
}
