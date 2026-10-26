import 'package:moamo/shared/api/export.dart';
import 'package:moamo/shared/network/api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_search_provider.g.dart';

@riverpod
Future<BookPageResponse> bookSearch(Ref ref, String keyword) async {
  final res = await apiClient.books.searchBooks(query: keyword);
  return res.data;
}

@riverpod
Future<List<BookMetadata>> bookRecommendations(
  Ref ref,
  String isbn, {
  BookRecommendationType? type,
}) async {
  final res = await apiClient.books.getRelatedBooks(isbn: isbn, type: type);
  return res.data;
}
